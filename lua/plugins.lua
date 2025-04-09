-- Configure lazy.nvim and add plugins
require('lazy').setup({
    -- Automatically install lazy.nvim itself
    { 'folke/lazy.nvim' },

    {'folke/tokyonight.nvim'},

    -- Git integration
    { 'tpope/vim-fugitive' },

    -- { 'fatih/vim-go' },

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
    -- {
    --     "ray-x/go.nvim",
    --     dependencies = {  -- optional packages
    --         "ray-x/guihua.lua",
    --         "neovim/nvim-lspconfig",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     config = function()
    --         require("go").setup()
    --     end,
    --     event = {"CmdlineEnter"},
    --     ft = {"go", 'gomod'},
    --     build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    -- },


    { "williamboman/mason.nvim" },

    -- LSP config
    -- { 'neovim/nvim-lspconfig' },
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
