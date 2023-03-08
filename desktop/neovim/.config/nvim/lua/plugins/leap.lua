return {
  -- Maybe too much to use Leap with f/F/t/T for one char...
  { "ggandor/flit.nvim", enabled = false },
  {
    "ggandor/leap.nvim",
    keys = function()
      return {
        { "s", "<Plug>(leap-forward-to)", mode = { "n", "x" }, desc = "Leap forward to" },
        { "S", "<Plug>(leap-backward-to)", mode = { "n", "x" }, desc = "Leap backward to" },
        -- "Leap" is invoked with operators via 'z' because 's' is taken by "nvim-surround"
        { "z", "<Plug>(leap-forward-to)", mode = { "o" }, desc = "Leap forward to" },
        { "Z", "<Plug>(leap-backward-to)", mode = { "o" }, desc = "Leap backward to" },
        { "x", "<Plug>(leap-forward-till)", mode = { "x", "o" }, desc = "Leap forward till" },
        { "X", "<Plug>(leap-backward-till)", mode = { "x", "o" }, desc = "Leap backward till" },
        { "gs", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from windows" },
      }
    end,
  },
}
