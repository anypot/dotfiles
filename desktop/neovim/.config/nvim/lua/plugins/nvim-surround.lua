return {
  { "echasnovski/mini.surround", enabled = false },
  {
    "kylechui/nvim-surround",
    opts = {
      -- Highlight the selection to be surrounded
      highlight = { duration = 10000 },
    },
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end,
  },
}
