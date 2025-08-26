-- lua/custom/snippets/markdown.lua
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  -- Unnumbered aligned block (align*)
  s(
    'align',
    fmt(
      [[
$$
\begin{{align*}}
    {} \\
\end{{align*}}
$$
]],
      {
        i(1, 'a + b &= c'),
      }
    )
  ),

  -- Numbered aligned block (align)
  s(
    'alignn',
    fmt(
      [[
$$
\begin{{align}}
    {} \\
\end{{align}}
$$
]],
      {
        i(1, 'F'),
      }
    )
  ),

  -- Optional: small helper to add another aligned row quickly
  s('aline', fmt([[{} &= {} \\]], { i(1, 'x'), i(2, 'y') })),
}
