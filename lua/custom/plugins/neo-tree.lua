-- ~/.config/nvim/lua/custom/plugins/neo-tree.lua
return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = function(_, opts)
    opts = opts or {}
    opts.use_popups_for_input = true
    return opts
  end,
}
