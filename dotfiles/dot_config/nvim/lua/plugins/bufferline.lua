return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    if (vim.g.colors_name or ""):find("catppuccin") then
      opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
    end
    opts.options = {
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
    }
  end,
}
