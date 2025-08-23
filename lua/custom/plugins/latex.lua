
return {
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex" },
    init = function()
      vim.g.maplocalleader = ","
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = { "-shell-escape", "-synctex=1", "-interaction=nonstopmode" },
      }
    end,
  },
}
