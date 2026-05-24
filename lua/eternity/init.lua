print("Hello from eternity")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Colorscheme
vim.cmd('colorscheme rose-pine')

-- Treesitter autocmds
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua' },
  callback = function() vim.treesitter.start() end,
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').lua.install_info.generate = true
  end,
})

-- Autopairs
require('nvim-autopairs').setup()

-- Completion
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>']      = cmp.mapping.confirm({ select = true }),
    ['<C-e>']     = cmp.mapping.abort(),
    ['<Tab>']     = cmp.mapping.select_next_item(),
    ['<S-Tab>']   = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),
})

-- Mason + LSP
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd' },
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('clangd', { capabilities = capabilities })
vim.lsp.enable({ 'clangd' })

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end,
})
