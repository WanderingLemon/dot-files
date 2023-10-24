local lsp = require('lsp-zero')

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- Setup keybindings for cmp
cmp.setup({sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'}
  }, window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  }, mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }), formatting = cmp_format
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  --local opts = {buffer=bufnr, remap=false}

  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

-- Run LSP config
local lspconfig = require('lspconfig')
--lspconfig.pyright.setup{}
lspconfig.pylsp.setup{}
lspconfig.clangd.setup{}
lspconfig.lua_ls.setup{}
--lspconfig.rust_analyzer.setup{}
lspconfig.jdtls.setup{}
lspconfig.tsserver.setup{}

