-- [[ Setting globals ]]

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
-- For more options, you can see `:help option-list`

-- Show line numbers
vim.opt.number = true

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

require('config.lazy')
