return {
  -- Utility Plugins
  "nvim-lua/plenary.nvim", -- Lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- Tmux & split window navigation

  -- Terminal Integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- Configuration options
        open_mapping = [[<c-\>]], -- Key mapping to open/close the terminal
        direction = 'float', -- You can also use 'horizontal', 'vertical', or 'tab'
        float_opts = {
          border = 'curved', -- Options: 'single', 'double', 'shadow', 'curved'
        },
      })
    end,
  },

  -- LSP Configuration Plugins
  { "neovim/nvim-lspconfig" }, -- Core LSP support
  { "williamboman/mason.nvim", build = ":MasonUpdate" }, -- LSP installer
  { "williamboman/mason-lspconfig.nvim" }, -- Mason-LSPConfig integration

  -- Auto-Completion Plugins
  { "hrsh7th/nvim-cmp" }, -- Completion engine
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
  { "hrsh7th/vim-vsnip" }, -- Snippet engine
  { "hrsh7th/cmp-buffer" }, -- Buffer source for nvim-cmp
  { "hrsh7th/cmp-path" }, -- Path source for nvim-cmp
}
-- Load LSP configuration
require("josean.plugins.lsp")

-- Load auto-completion configuration
require("josean.plugins.completion")

