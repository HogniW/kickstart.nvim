return {
  {
    'lervag/vimtex',
    ft = { 'tex', 'plaintex' },
    init = function()
      -- Viewer + compiler
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        options = { '-shell-escape', '-synctex=1', '-interaction=nonstopmode' },
      }
      vim.g.vimtex_syntax_enabled = 0

      -- Use normal <leader> mappings in TeX buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'tex', 'plaintex' },
        callback = function()
          local opts = { buffer = true, silent = true, noremap = true }
          vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompile<CR>', opts) -- compile/watch
          vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', opts) -- view PDF
          vim.keymap.set('n', '<leader>lk', '<cmd>VimtexStop<CR>', opts) -- stop compiler
          vim.keymap.set('n', '<leader>le', '<cmd>VimtexErrors<CR>', opts) -- error list
        end,
      })
    end,
  },
}
