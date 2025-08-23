-- lua/custom/plugins/conform.lua
return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        tex = { 'latexindent' },
        plaintex = { 'latexindent' },
        bib = { 'latexindent' },
      },
      formatters = {
        latexindent = {
          command = 'latexindent',
          args = { '-m', '-l', '--silent' },
          stdin = true,
        },
      },
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if ft == 'tex' or ft == 'plaintex' or ft == 'bib' then
          return { timeout_ms = 3000, lsp_fallback = false }
        end
      end,
    }
  end,
}
