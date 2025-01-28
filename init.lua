-- Neovim Basic Settings
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.wrap = false                 -- Disable line wrapping
vim.opt.clipboard = "unnamedplus"    -- Use system clipboard
vim.opt.tabstop = 4                  -- Number of spaces per tab
vim.opt.shiftwidth = 4               -- Spaces per indentation level
vim.opt.expandtab = true             -- Convert tabs to spaces
vim.opt.smartindent = true           -- Enable smart indentation
vim.opt.termguicolors = true         -- Enable 24-bit RGB colors
vim.opt.cursorline = true            -- Highlight the current line
vim.opt.splitright = true            -- Open vertical splits to the right
vim.opt.splitbelow = true            -- Open horizontal splits below
vim.opt.ignorecase = true            -- Ignore case in search
vim.opt.smartcase = true             -- Override ignorecase if search contains uppercase

-- Leader Key
vim.g.mapleader = " "                -- Set the <Space> key as the leader

-- Plugin Manager: lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup()
        end,
    },

    -- Telescope (fuzzy finder)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                        theme = "ivy",
                    },
                },
            })
            require("telescope").load_extension("file_browser")
        end,
    },

    -- File browser for Telescope
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = { side = "left", width = 30 },
            })
        end,
    },

    -- Terminal toggle
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<C-\>]],
                direction = "horizontal",
            })
        end,
    },

    -- Theme and colorscheme
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            vim.cmd("colorscheme gruvbox")
        end,
    },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                char = "|",
                buftype_exclude = { "terminal" },
                show_trailing_blankline_indent = false,
                show_first_indent_level = true,
            })
        end,
    },

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            })
        end,
    },

    -- Session management
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
            })
        end,
    },

    -- Smooth scrolling
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end,
    },

    -- Visual Tabline (optional, but highly recommended)
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "ordinal", -- Show buffer numbers
                    diagnostics = "nvim_lsp", -- Show LSP diagnostics in the bufferline
                    separator_style = "slant", -- Cool separator for the bufferline
                    always_show_bufferline = true,
                },
            })
        end,
    },
})

-- Keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Tabs Keybindings
map("n", "<leader>tn", ":tabnew<CR>", opts)         -- Open a new tab
map("n", "<leader>tc", ":tabclose<CR>", opts)       -- Close the current tab
map("n", "<leader>to", ":tabonly<CR>", opts)        -- Close all other tabs
map("n", "<leader>tp", ":tabprevious<CR>", opts)    -- Go to the previous tab
map("n", "<leader>tt", ":tabnext<CR>", opts)        -- Go to the next tab
map("n", "<Tab>", ":tabnext<CR>", opts)             -- Use Tab to go to the next tab
map("n", "<S-Tab>", ":tabprevious<CR>", opts)       -- Use Shift+Tab to go to the previous tab

-- Telescope keybindings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)       -- Find files
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)        -- Live grep
map("n", "<leader>fb", ":Telescope file_browser<CR>", opts)     -- File browser
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)        -- Help tags

-- File explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)              -- Toggle file explorer

-- Terminal toggle
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opts) -- Floating terminal
map("n", "<leader>th", ":ToggleTerm size=10 direction=horizontal<CR>", opts) -- Horizontal terminal
map("n", "<leader>tv", ":ToggleTerm size=80 direction=vertical<CR>", opts) -- Vertical terminal
map("t", "<esc>", [[<C-\><C-n>]], opts)                         -- Exit terminal mode

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", opts)                      -- Next buffer
map("n", "<leader>bp", ":bprevious<CR>", opts)                  -- Previous buffer
map("n", "<leader>bd", ":bdelete<CR>", opts)                    -- Delete buffer

-- Save and quit
map("n", "<leader>sa", ":wa<CR>", opts)                         -- Save all
map("n", "<leader>qa", ":qa<CR>", opts)                         -- Quit all

-- Clipboard shortcuts
map("n", "<leader>y", '"+y', opts)                              -- Yank to system clipboard
map("v", "<leader>y", '"+y', opts)                              -- Yank in visual mode

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)                               -- Left window
map("n", "<C-l>", "<C-w>l", opts)                               -- Right window
map("n", "<C-j>", "<C-w>j", opts)                               -- Bottom window
map("n", "<C-k>", "<C-w>k", opts)                               -- Top window
