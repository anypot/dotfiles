return {
  "kylechui/nvim-surround",
  -- version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  init = function()
    ---@diagnostic disable-next-line: undefined-global
    vim.g.nvim_surround_no_mappings = true
  end,
  opts = {
    highlight = { duration = 10000 },
  },
  keys = {
    {
      -- "<C-g>s",
      "<C-g>gs",
      "<Plug>(nvim-surround-insert)",
      desc = "Add a surrounding pair around the cursor (insert mode)",
      mode = "i",
    },
    {
      -- "<C-g>S",
      "<C-g>gS",
      "<Plug>(nvim-surround-insert-line)",
      desc = "Add a surrounding pair around the cursor, on new lines (insert mode)",
      mode = "i",
    },
    {
      -- "ys",
      "gsa",
      "<Plug>(nvim-surround-normal)",
      desc = "Add a surrounding pair around a motion (normal mode)",
      mode = "n",
    },
    {
      -- "yss",
      "gss",
      "<Plug>(nvim-surround-normal-cur)",
      desc = "Add a surrounding pair around the current line (normal mode)",
      mode = "n",
    },
    {
      -- "yS",
      "gS",
      "<Plug>(nvim-surround-normal-line)",
      desc = "Add a surrounding pair around a motion, on new lines (normal mode)",
      mode = "n",
    },
    {
      -- "ySS",
      "gSS",
      "<Plug>(nvim-surround-normal-cur-line)",
      desc = "Add a surrounding pair around the current line, on new lines (normal mode)",
      mode = "n",
    },
    {
      -- "S",
      "gsa",
      "<Plug>(nvim-surround-visual)",
      desc = "Add a surrounding pair around a visual selection",
      mode = "x",
    },
    {
      -- "gS",
      "gS",
      "<Plug>(nvim-surround-visual-line)",
      desc = "Add a surrounding pair around a visual selection, on new lines",
      mode = "x",
    },
    {
      -- "ds",
      "gsd",
      "<Plug>(nvim-surround-delete)",
      desc = "Delete a surrounding pair",
      mode = "n",
    },
    {
      -- "cs",
      "gsr",
      "<Plug>(nvim-surround-change)",
      desc = "Change a surrounding pair",
      mode = "n",
    },
    {
      -- "cS",
      "gSr",
      "<Plug>(nvim-surround-change-line)",
      desc = "Change a surrounding pair, putting replacements on new lines",
      mode = "n",
    },
  },
}
