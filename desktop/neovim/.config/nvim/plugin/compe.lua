require('compe').setup {
  enabled = true,
  source = {
    path = { menu = '[PATH]', priority = 9, },
    nvim_lsp = { menu = '[LSP]', priority = 10, sort = true, },
    luasnip = { menu = '[SNP]', priority = 10, },
    buffer = { menu = '[BUF]', priority = 8, },
    calc = false,
    nvim_lua = false,
    vsnip = false,
    ultisnips = false,
    emoji = false,
  },
}
