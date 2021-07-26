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
  use 'folke/tokyonight.nvim' -- Color theme
  use 'kyazdani42/nvim-web-devicons' -- Adds filetype glyphs to plugins
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines 
  use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' } -- Interface for the tree-sitter library in Neovim 
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter
  use 'andweeb/presence.nvim' -- What's the point in using vim if you're not telling the world?
end)

-- Set colorscheme
vim.o.termguicolors = true
--vim.g.tokyonight_style = "night" -- default = storm
vim.g.tokyonight_sidebars = { "packer" }
vim.cmd[[colorscheme tokyonight]]

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Turn current line number + relative numbers on
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
-- vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { timeout = 700, higroup="IncSearch" }
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

-- Telescope
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    },
    file_ignore_patterns = { '.git' },
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    color_devicons = true,
  }
}

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained', -- parsers with maintainers
  highlight = { enable = true, },
  indent = { enable = true, },
  incremental_selection = {
    enable = true,
    disable = {},
    keymaps = {
      init_selection = "gnn",
      node_decremental = "grm",
      node_incremental = "grn",
      scope_incremental = "grc",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim 
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer', ['if'] = '@function.inner',
        ['ac'] = '@class.outer', ['ic'] = '@class.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {['<leader>a'] = '@parameter.inner'},
      swap_previous = {['<leader>A'] = '@parameter.inner'},
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {[']a'] = '@parameter.outer', [']f'] = '@function.outer', [']c'] = '@class.outer'},
      goto_next_end = {[']A'] = '@parameter.outer', [']F'] = '@function.outer', [']C'] = '@class.outer'},
      goto_previous_start = {['[a'] = '@parameter.outer', ['[f'] = '@function.outer', ['[c'] = '@class.outer'},
      goto_previous_end = {['[A'] = '@parameter.outer', ['[F'] = '@function.outer', ['[C'] = '@class.outer'},
    },
  },
}


-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Telescope shortcuts (<leader> and "f"uzzy find...)
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true }) -- vim buffers
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true }) -- previously open files
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({ hidden=true })<CR>]], { noremap = true, silent = true }) -- "f"ile names
vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true }) -- the current "w"ord in files
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true }) -- a string "g"lobally (grep)
vim.api.nvim_set_keymap('n', '<leader>fl', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true }) -- a string "l"ocally
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true }) -- "t"ags
-- vim.api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_tags()<CR>]], { noremap = true, silent = true }) -- tags only for the "c"urrently open buffer
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true }) -- "h"elp
