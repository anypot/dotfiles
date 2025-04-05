-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- If the LazyVim default leader key changes...
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.breakindent = true -- Enable break indent
opt.hidden = true -- Hide buffers in background instead of closing them when opening a new file
opt.hlsearch = false -- Remove highlight on search
opt.mouse = "" -- Disable mouse mode
