return {
  { "folke/twilight.nvim" },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        alacritty = { enabled = true, font = "14" },
      },
    },
  },
}
