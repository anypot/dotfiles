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
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround' -- Mappings to easily operate on "s"urroundings (like parentheses, brackets, quotes, XML tags,...)
  use 'tpope/vim-repeat' -- "." can be used to repeat a plugin map!
  use 'andweeb/presence.nvim' -- What's the point in using vim if you're not telling the world?
end)

-- Turn current line number + relative numbers on
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true
