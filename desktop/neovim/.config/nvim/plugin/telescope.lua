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
      '--hidden',
    },
    file_ignore_patterns = { '.git' },
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    color_devicons = true,
  }
}
