-- Use spaces
vim.cmd("set expandtab")
vim.cmd("set smarttab")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")

-- Bootstrap lazy.nvim - https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Theme - https://github.com/catppuccin/nvim
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Fuzzy Finding - https://github.com/nvim-telescope/telescope.nvim
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- tree-sitter - https://github.com/nvim-treesitter/nvim-treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Theme - https://github.com/catppuccin/nvim
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Telescope - https://github.com/nvim-telescope/telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- nvim Treesitter - https://github.com/nvim-treesitter/nvim-treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = { "lua", "vim", "javascript", "html", "go" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})
