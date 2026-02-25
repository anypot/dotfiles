return {
  {
    "folke/flash.nvim",
    keys = {
      {
        "x",
        mode = { "x", "o" }, -- Why did I use it with leap.nvim for x mode (= visual only) ?
        function()
          require("flash").jump({ jump = { inclusive = false } })
        end,
        desc = "Flash forward till",
      },
      {
        "X",
        mode = { "x", "o" }, -- Why did I use it with leap.nvim for x mode (= visual only) ?
        function()
          require("flash").jump({
            search = { forward = false, wrap = false },
            jump = { pos = "end" },
          })
        end,
        desc = "Flash backward till",
      },
    },
  },
}
