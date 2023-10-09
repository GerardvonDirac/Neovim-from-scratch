local dracula = require("dracula")
local colors = require('dracula').colors()
dracula.setup({
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {
    DiffText = { fg = colors.bg, bg = colors.orange },
    SpecialKey = { bg = colors.fg, fg = colors.bg }, -- set NonText fg to white
  },
})

vim.cmd [[
try
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
