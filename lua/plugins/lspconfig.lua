-- LSP Package Manager - https://github.com/williamboman/mason.nvim
-- LSP Mason + Config Bridge - https://github.com/williamboman/mason-lspconfig.nvim
-- LSP Client Config - https://github.com/neovim/nvim-lspconfig
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- LSP Languages - https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "yamlls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.yamlls.setup({
        filetypes = { "yaml", "yml" },
        settings = {
          redhat = {
            telemetry = {
              enable = false
            }
          }
        }
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
