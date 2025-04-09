-- Configure lazy.nvim and add plugins
require('lazy').setup({
    -- Automatically install lazy.nvim itself
    { 'folke/lazy.nvim' },

    { 'folke/tokyonight.nvim'},

    {'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- Git integration
    { 'tpope/vim-fugitive' },

    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },

    { "williamboman/mason.nvim" },

    -- LSP config
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        }
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'L3MON4D3/LuaSnip'}
        },
    },

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
        'gofumpt',
        'delve',
        'gopls',

        'zls'
    },
})

-- require('go').setup()
