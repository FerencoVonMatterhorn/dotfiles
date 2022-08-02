-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'preservim/nerdtree'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'nvim-treesitter/nvim-treesitter'
  use 'fatih/vim-go'
  use 'tpope/vim-fugitive'
  use "ahmedkhalf/project.nvim"
  use 'ryanoasis/vim-devicons'
end)
