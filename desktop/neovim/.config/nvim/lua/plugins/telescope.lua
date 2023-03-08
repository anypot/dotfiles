return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        file_ignore_patterns = { ".git" },
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        color_devicons = true,
      },
    },
    keys = {
      { "<leader>?", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>st", "<cmd>Telescope tags<cr>", desc = "Tags" },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      {
        "<leader>fB",
        "<cmd>Telescope file_browser path=%:p:h=%:p:h<cr>",
        desc = "Browse Files",
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
