vim.loader.enable()

-- TODO:
local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = ","

-- Edit
opt.undofile = true
opt.autoindent = true
opt.smartindent = true

--opt.completeopt = "menu,menuone,noinsert,fuzzy,preview,noselect"

-- Encoding
opt.encoding = "utf-8"
-- opt.termencoding = "utf-8"
opt.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr"
opt.fileencoding = "utf-8"

-- Input
opt.clipboard = "unnamedplus" -- use system clipboard
opt.completeopt = { "menu", "menuone", "noselect" }
opt.mouse = "a"

-- Tab
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.showmode = false
opt.showmatch = true
opt.showcmd = true
opt.cmdheight = 0

-- Searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Misc

-- Neovide
if g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  g.neovide_padding_top = 30
  g.neovide_padding_bottom = 15
  g.neovide_padding_left = 32
  g.neovide_padding_right = 24
  g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_cursor_animation_length = 0.03
  g.neovide_cursor_trail_size = 0.9
  g.neovide_hide_mouse_when_typing = true
  g.neovide_opacity = 0.78
  g.neovide_normal_opacity = 0.78
end
