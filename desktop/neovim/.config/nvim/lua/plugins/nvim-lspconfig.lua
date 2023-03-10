return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {
      bashls = {},
      gopls = {},
      pyright = {},
      rust_analyzer = {
        -- mason = false, -- set to false if this server has not to be installed with Mason
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              features = "all",
            },
            -- use cargo clippy instead of cargo check
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
              features = "all",
            },
            procMacro = {
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
