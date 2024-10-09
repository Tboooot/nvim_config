# Neovim Core Options Setup

#This guide walks through the process of setting up core options for Neovim, including configurations for line numbers, indentation, search settings, appearance, clipboard, and window splitting.

#### Steps to Set Up Core Options

### 1. Navigate to the Neovim Configuration Folder

#Ensure you are in the correct Neovim configuration folder (`~/.config/nvim`):

```bash
cd ~/.config/nvim
nvim .
```
### 2. Create the options.lua File
#Navigate to the lua/josean/core folder (create it if it doesn’t exist), then press % in Neovim to create a new file called options.lua.

#In this file, add the following command to modify the Netrw explorer list style:


```lua
vim.cmd("let g:netrw_liststyle = 3")
```
### 3. Load Core Options on Startup
#Open the main init.lua file using :Explore or navigate manually, and add the following line to load the core options at startup:

```lua
require("josean.core.options")
```
### 4. Reopen Neovim
#Save your changes with :w and reopen Neovim:


```bash
nvim .
```
### 5. Add Additional Core Options
#Go back to options.lua and add the following configurations to set up various core options:


```lua
local opt = vim.opt -- for conciseness

-- Line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on the cursor line

-- Tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- Line wrapping
opt.wrap = false -- disable line wrapping

-- Search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case-sensitive search if mixed case is used

-- Cursor line
opt.cursorline = true -- highlight the current cursor line

-- Appearance
opt.termguicolors = true -- enable true colors
opt.background = "dark" -- dark theme background
opt.signcolumn = "yes" -- always show sign column

-- Backspace behavior
opt.backspace = "indent,eol,start" -- allow backspace in insert mode

-- Clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default

-- Window splitting
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- horizontal split to the bottom

-- Disable swapfile
opt.swapfile = false
```
### 6. Update init.lua

#Edit lua/josean/core/init.lua to include:

```lua
require("josean.core.options")
```
### 7. Final Adjustment to init.lua

#Open the init.lua file and modify the require statement as follows:

```lua
require("josean.core")
```
