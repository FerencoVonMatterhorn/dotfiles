-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- write
keymap('n', '<Leader>w', ':w<cr>', opts)

-- quit
keymap('n', '<Leader>q', ':bd<cr>', opts)
keymap('n', '<Leader>Q', ':q!<cr>', opts)
keymap('n', '<Leader>wq', ':wq<cr>', opts)
keymap('n', 'q', ':q<cr>', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Plugins --

-- NvimTree
local nvim_tree_mappings = {
  ["<leader>e"] = { ":NvimTreeToggle<CR>", "NvimTree" },
}
-- Telescope
local telescope_mappings = {
  ['<leader>f'] = { name = "Telesope" },
  ["<leader>fb"] = { ":Telescope buffers<CR>", "find buffers" },
  ["<leader>ff"] = { ":Telescope find_files<CR>", "find files" },
  ["<leader>ft"] = { ":Telescope live_grep<CR>", "live grep" },
}

-- Git
local git_mappings = {
  ["<leader>gg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "lazygit" },
}

-- Which-key
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end
which_key.register(git_mappings, opts)
which_key.register(nvim_tree_mappings, opts)
which_key.register(telescope_mappings, opts)
