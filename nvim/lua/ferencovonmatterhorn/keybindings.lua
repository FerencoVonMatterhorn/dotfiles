vim.g.mapleader = " "

-- write
vim.keymap.set('n', '<Leader>w', ':write<cr>')

-- quit
vim.keymap.set('n', '<Leader>q', ':quit<cr>')

-- undo
vim.keymap.set('n', '<Leader>u', ':undo<cr>')

-- redo
vim.keymap.set('n', '<Leader>r', ':redo<cr>')

-- Telescope
vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<cr>')
vim.keymap.set('n', '<Leader>fh', ':Telescope help_tags<cr>')
vim.keymap.set('n', '<Leader>p', ':Telescope projects<cr>')


-- go back to last buffer
vim.keymap.set('n', '<Leader>b', ':b#<cr>')

-- nerdtree
vim.keymap.set('n','<Leader>n', ':NERDTreeToggle<cr>')

-- move between splits with arrow keys
vim.keymap.set('n','<up>', ':wincmd k<cr>', { silent = true })
vim.keymap.set('n','<down>', ':wincmd j<cr>', { silent = true })
vim.keymap.set('n','<left>', ':wincmd h<cr>', { silent = true })
vim.keymap.set('n','<right>', ':wincmd l<cr>', { silent = true })
