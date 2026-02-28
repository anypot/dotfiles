local function aider_cmd()
  local workdir = vim.fn.getcwd()
  return {
    "sudo",
    "docker",
    "run",
    "--interactive",
    "--tty",
    "--rm",
    "--network",
    "host",
    "--volume",
    vim.fn.expand("~/.aider.conf.yml") .. ":/app/.aider.conf.yml",
    "--volume",
    workdir .. ":/workspace",
    "--workdir",
    "/workspace",
    "--env",
    "OLLAMA_API_BASE=http://127.0.0.1:11434",
    "paulgauthier/aider",
  }
end

return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      tools = {
        kilocode = {
          cmd = { "kilo" },
        },
        aider = {
          cmd = aider_cmd(),
        },
      },
    },
  },
}
