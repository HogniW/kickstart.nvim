-- lua/custom/plugins/luasnip_loader.lua
return {
  {
    'L3MON4D3/LuaSnip',
    config = function()
      -- keep your existing LuaSnip settings, then load custom snippets
      require('luasnip.loaders.from_lua').lazy_load {
        paths = vim.fn.stdpath 'config' .. '/lua/custom/snippets',
      }
    end,
  },
}
