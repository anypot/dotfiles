require("indent_blankline").setup {
  char = '⏐',
  space_char = ' ',
  filetype_exclude = { 'help', 'packer' },
  buftype_exclude = { 'terminal', 'nofile' },
  char_highlight = 'LineNr',
  show_trailing_blankline_indent = false,
}
