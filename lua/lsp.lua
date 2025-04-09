-- used in the auto complete
local luasnip = require 'luasnip'

-- configure how the auto complete works
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require('lspconfig').lua_ls.setup({})

require('lspconfig').clangd.setup({})

require('lspconfig').golangci_lint_ls.setup{}
require('lspconfig').goimports.setup{}
require('lspconfig').gopls.setup{
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  settings = {
    gopls = {
      staticcheck = true,
      completeUnimported = true, -- Enables completion for unimported functions
    },
  },
}

vim.cmd [[
  autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = false }) -- can't be async as that will interfere with the organize imports below
  autocmd BufWritePre *.go lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
]]

require('lspconfig').zls.setup({})
