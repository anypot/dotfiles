-- Stolen from https://github.com/mjlbach/defaults.nvim/blob/master/init.lua

-- packer.nvim bootstrapping
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

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
  use('wbthomason/packer.nvim') -- The package manager itself
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }) -- Interface for the tree-sitter library in Neovim
  use('nvim-treesitter/nvim-treesitter-textobjects') -- Additional textobjects for treesitter
  use('neovim/nvim-lspconfig') -- Manages the Nvim LSP client
  use('ray-x/lsp_signature.nvim') -- Made for completion plugins that do not support signature help
  use('hrsh7th/nvim-compe') -- Autocompletion
  use('L3MON4D3/LuaSnip') -- Snippet engine
  use('rafamadriz/friendly-snippets') -- Snippets for different languages
  use({ 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }) -- UI to select things (files, grep results, open buffers...)
  use('kyazdani42/nvim-tree.lua') -- File explorer tree
  use('ludovicchabant/vim-gutentags') -- Automatic tags management
  use('tpope/vim-fugitive') -- Git commands in nvim
  use({ 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }) -- Add git related info in the signs columns and popups
  use('tpope/vim-commentary') -- "gc" to comment visual regions/lines
  use('tpope/vim-surround') -- Mappings to easily operate on "s"urroundings (like parentheses, brackets, quotes, XML tags,...)
  use('tpope/vim-repeat') -- "." can be used to repeat a plugin map!
  use('folke/which-key.nvim') -- Shows suggestions to complete a key binding
  use('windwp/nvim-autopairs') -- Autopairs
  use('lukas-reineke/indent-blankline.nvim') -- Add indentation guides even on blank lines
  use('rebelot/kanagawa.nvim') -- Color theme
  use('folke/zen-mode.nvim') -- Distraction-free coding
  use('folke/twilight.nvim') -- Dims inactive portions of the code
  use({ 'hoob3rt/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' }) -- Statusline
  use({ 'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }) -- Show and sort buffers as tabs
  use('andweeb/presence.nvim') -- What's the point in using vim if you're not telling the world?
end)
