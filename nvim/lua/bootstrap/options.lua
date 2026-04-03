vim.loader.enable()

-- TODO:
local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = ","

-- Edit
opt.undofile = true
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

-- Indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
-- opt.cindent = true

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
opt.wrap = false
opt.fillchars = { eob = " " }

-- opt.guicursor = 'n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor' -- Blink Cursor

opt.numberwidth = 2
opt.signcolumn = "number"
opt.statuscolumn = "%l%s"

-- Searching
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- LOCALE
-- opt.langmenu = "zh_CN.UTF-8"
-- opt.helplang = "cn"

-- Misc
vim.o.updatetime = 250
vim.o.timeoutlen = 300
opt.shell = "/usr/bin/env sh"
-- opt.lazyredraw = true -- For large file

-- Neovide
if g.neovide then
  vim.o.guifont = "FiraCode Nerd Font Med:h12"
  g.neovide_padding_top = 24
  g.neovide_padding_bottom = 24
  g.neovide_padding_left = 24
  g.neovide_padding_right = 24
  g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_cursor_animation_length = 0.03
  g.neovide_cursor_trail_size = 0.9
  g.neovide_hide_mouse_when_typing = true
  g.neovide_opacity = 0.65
  g.neovide_normal_opacity = 0.65
end
