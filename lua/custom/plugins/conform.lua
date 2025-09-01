-- lua/custom/plugins/conform.lua
return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        tex = { 'latexindent_silent' },
        plaintex = { 'latexindent_silent' },
        bib = { 'latexindent_silent' },
      },
      -- if you only format after compile success, keep nil for TeX here
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if ft == 'tex' or ft == 'plaintex' or ft == 'bib' then
          return nil
        end
      end,
      formatters = {
        latexindent_silent = {
          command = 'latexindent',
          args = function(_)
            -- robustly get absolute path of the current buffer
            local bufnr = vim.api.nvim_get_current_buf()
            local fname = vim.api.nvim_buf_get_name(bufnr)
            if fname == '' then
              fname = vim.fn.expand '%:p'
            end
            -- write-in-place, enable modifyLineBreaks, load local configs; silence logs
            return { '-w', '-m', '-l', '--logfile=/dev/null', fname }
          end,
          stdin = false,
          ignore_stderr = true, -- silence perl warnings
          exit_codes = { 0 },
        },
      },
    }

    -- manual format: write → format → reload
    vim.keymap.set({ 'n', 'v' }, '<leader>lf', function()
      if vim.bo.modified then
        vim.cmd.write()
      end
      require('conform').format { async = false, lsp_fallback = false }
      vim.cmd 'checktime'
    end, { desc = 'LaTeX [F]ormat file' })
  end,
}
