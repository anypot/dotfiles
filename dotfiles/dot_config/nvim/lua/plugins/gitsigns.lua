return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "▋" },
      change = { text = "▋" },
      delete = { text = "▁", show_count = true },
      topdelete = { text = "▔", show_count = true },
      changedelete = { text = "~", show_count = true },
      untracked = { text = "┆" },
    },
    signs_staged = {
      add = { text = "▋" },
      change = { text = "▋" },
      delete = { text = "▁", show_count = true },
      topdelete = { text = "▔", show_count = true },
      changedelete = { text = "~", show_count = true },
    },
    count_chars = {
      [1] = "₁",
      [2] = "₂",
      [3] = "₃",
      [4] = "₄",
      [5] = "₅",
      [6] = "₆",
      [7] = "₇",
      [8] = "₈",
      [9] = "₉",
      ["+"] = "₊",
    },
  },
}
