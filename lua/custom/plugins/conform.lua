-- lua/custom/plugins/conform.lua
return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        tex = { 'latexindent' },
        plaintex = { 'latexindent' },
        bib = { 'latexindent' },
      },
      formatters = {
        latexindent = {
          command = 'latexindent',
          -- -w: write in-place (needed when stdin=false)
          -- -m: enable modifyLineBreaks (silences your CLI warning)
          -- -l: load local/project settings + triggers indentconfig chain
          -- set a real logfile so you can debug from nvim; change back to /dev/null after
          args = { '-w', '-m', '-l', '--logfile=indent.log' },
          stdin = false,
        },
      },
      -- Always format on save for TeX-like files
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if ft == 'tex' or ft == 'plaintex' or ft == 'bib' then
          return { timeout_ms = 3000, lsp_fallback = false }
        end
      end,
      notify_on_error = true,
    }

    -- Manual format key (normal/visual): <leader>lf
    vim.keymap.set({ 'n', 'v' }, '<leader>lf', function()
      conform.format { async = false, lsp_fallback = true }
    end, { desc = 'LaTeX [F]ormat file' })
  end,
}
