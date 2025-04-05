return {
  {
    "folke/flash.nvim",
    keys = function()
      return {
        {
          "s",
          mode = { "n", "x" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "S",
          mode = { "n", "x" },
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter",
        },
        -- "Flash" is invoked with operators via 'z' because 's' is taken by "nvim-surround"
        {
          "z",
          mode = "o",
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "Z",
          mode = "o",
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter",
        },
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
        {
          "r",
          mode = "o",
          function()
            require("flash").remote()
          end,
          desc = "Remote Flash",
        },
        {
          "R",
          mode = { "o", "x" },
          function()
            require("flash").treesitter_search()
          end,
          desc = "Treesitter Search",
        },
        {
          "<c-s>",
          mode = { "c" },
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash Search",
        },
      }
    end,
  },
}
