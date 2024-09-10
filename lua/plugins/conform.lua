-- Conform - https://github.com/stevearc/conform.nvim
return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          -- default to prettier for all filetypes unless specified
          ["_"]     = { "prettier" },
          go        = { "goimports", "gofmt" },
          rust      = { "rustfmt" },
          sh        = { "shfmt", "shellcheck" },
          terraform = { "terraform_fmt" },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end
  }
}
