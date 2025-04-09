vim.g.mapleader = " "

-- Bootstrap lazy.nvim installation
-- Needs to be present before using lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--depth=1',
    'https://github.com/folke/lazy.nvim', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins')

require('lsp')

require('options')

require('mappings')

