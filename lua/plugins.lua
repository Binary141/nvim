-- Configure lazy.nvim and add plugins
require('lazy').setup({
    -- Automatically install lazy.nvim itself
    { 'folke/lazy.nvim' },

    {'folke/tokyonight.nvim'},

    -- Git integration
    { 'tpope/vim-fugitive' },

    { "williamboman/mason.nvim" },

    -- LSP config
    { 'neovim/nvim-lspconfig' },

    -- Autocompletion
    -- { 'hrsh7th/nvim-cmp' },

    -- Treesitter with lazy load and update
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

    -- Telescope
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope' },

    -- Automatically run PackerSync when saving the plugin config file
    { 'nvim-lua/plenary.nvim' },  -- Required for Telescope
})

-- Automatically install plugins when Neovim starts
vim.cmd [[autocmd BufWritePost plugins.lua Lazy sync]]

require("mason").setup({
    ensure_installed = {
    'lua-language-server',

    'clangd',

    'golangci-lint-langserver',
    'goimports',
    'gopls',

    'zls'
    },
})
