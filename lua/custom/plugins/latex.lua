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
      -- Use Treesitter instead of VimTeX syntax (keep this if you prefer TS)
      vim.g.vimtex_syntax_enabled = 0

      -- Normal <leader> mappings in TeX buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'tex', 'plaintex' },
        callback = function()
          local opts = { buffer = true, silent = true, noremap = true }
          vim.keymap.set('n', '<leader>lc', '<cmd>VimtexCompile<CR>', opts) -- compile/watch
          vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', opts)    -- view PDF
          vim.keymap.set('n', '<leader>lk', '<cmd>VimtexStop<CR>', opts)    -- stop compiler
          vim.keymap.set('n', '<leader>le', '<cmd>VimtexErrors<CR>', opts)  -- error list
        end,
      })

      -- Format only after a successful compile
      -- in your latex.lua (you already have vimtex set up)
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VimtexEventCompileSuccess',
        callback = function()
          local ok, conform = pcall(require, 'conform')
          if not ok then
            return
          end
          conform.format { async = false, lsp_fallback = false }
          vim.cmd 'checktime' -- show the on-disk changes in the current buffer
        end,
      })
    end,
  },
}
