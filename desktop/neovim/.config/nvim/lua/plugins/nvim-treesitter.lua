return {
  "nvim-treesitter/nvim-treesitter",
  -- keys = {
  --   { "<c-space>", desc = "Increment selection" },
  --   { "<bs>", desc = "Decrement selection", mode = "x" },
  -- },
  ---@type TSConfig
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "dockerfile",
      "go",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
  },
}
