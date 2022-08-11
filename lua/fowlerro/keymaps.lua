local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
local term_options = { silent = true }

-- Modes
-- normal = "n",
-- insert = "i",
-- visual = "v",
-- visual_block = "x",
-- term = "t",
-- command = "c"


-- Leader key
keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Comments
keymap("n", "<C-_>", "<Plug>ContextCommentaryLine", options)
keymap("v", "<C-_>", "<Plug>ContextCommentary", options)

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

-- File explorer
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", options)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", options)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<CR>", options);

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", options)
keymap("n", "<S-h>", ":bprevious<CR>", options)


-- Quick ESC
keymap("i", "ii", "<ESC>", options)


-- Stay in indent mode
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", options)
keymap("v", "<A-k>", ":m .-2<CR>==", options)
keymap("v", "p", '"_dP', options)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", options)
keymap("x", "K", ":move '<-2<CR>gv-gv", options)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", options)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", options)

-- Disable arrow keys
keymap("i", "<Up>", "<Nop>", options)
keymap("n", "<Up>", "<Nop>", options)

keymap("i", "<Down>", "<Nop>", options)
keymap("n", "<Down>", "<Nop>", options)

keymap("i", "<Left>", "<Nop>", options)
keymap("n", "<Left>", "<Nop>", options)

keymap("i", "<Right>", "<Nop>", options)
keymap("n", "<Right>", "<Nop>", options)
