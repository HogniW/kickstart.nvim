return {
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'rmd' },
    build = 'cd app && npm install',
    init = function()
      -- optional: force a browser
      -- vim.g.mkdp_browser = "/usr/bin/chromium-browser" -- or "/usr/bin/firefox"
      vim.g.mkdp_filetypes = { 'markdown', 'rmd' }
      vim.g.mkdp_theme = 'light'
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_preview_options = {
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        katex = {}, -- enables $...$ and $$...$$
      }
    end,
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreview<cr>',       desc = 'Markdown Preview' },
      { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>',   desc = 'Stop Preview' },
      { '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Toggle Preview' },
    },
  },
}
