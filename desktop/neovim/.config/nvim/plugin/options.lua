-- Set colorscheme
vim.o.termguicolors = true
-- vim.g.tokyonight_style = "night" -- default = storm
-- vim.g.tokyonight_sidebars = { "packer" }
-- vim.cmd[[colorscheme tokyonight]]

-- Incremental live completion
vim.o.inccommand = 'nosplit'

-- Remove highlight on search
vim.o.hlsearch = false

-- Hide buffers in background instead of closing them when opening a new file
vim.o.hidden = true

-- Turn current line number + relative numbers on
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
-- vim.o.mouse = 'a'

-- Tab settings
vim.o.tabstop           = 4         -- Tab indentation levels every two columns
vim.o.softtabstop       = 4         -- Tab indentation when mixing tabs & spaces
vim.o.shiftwidth        = 4         -- Indent/outdent by two columns
vim.o.shiftround        = true      -- Always indent/outdent to nearest tabstop
vim.o.expandtab         = true      -- Convert all tabs that are typed into spaces
vim.o.smarttab          = true      -- Use shiftwidths at left margin, tabstops everywhere else

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching unless /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Always display the sign column to avoid the text jumping to the right the first time you make a change to a file (because of Gitsigns)
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

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
