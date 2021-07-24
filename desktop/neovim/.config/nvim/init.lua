-- Stolen from https://github.com/mjlbach/defaults.nvim/blob/master/init.lua

-- packer.nvim bootstrapping
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Automatically run :PackerCompile whenever init.lua is updated
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- The package manager itself
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround' -- Mappings to easily operate on "s"urroundings (like parentheses, brackets, quotes, XML tags,...)
  use 'tpope/vim-repeat' -- "." can be used to repeat a plugin map!
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } } -- UI to select things (files, grep results, open buffers...)
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines 
  use 'andweeb/presence.nvim' -- What's the point in using vim if you're not telling the world?
end)

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Turn current line number + relative numbers on
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Gitsigns
require('gitsigns').setup()

-- Indent-blankline
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_space_char = ' '
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
