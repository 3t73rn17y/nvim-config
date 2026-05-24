
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



-- Plugins
require('lazy').setup({
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'ThePrimeagen/harpoon',
  'windwp/nvim-autopairs',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'ThePrimeagen/vim-be-good',
})



require("eternity.remap")
require("eternity")
print("hello")
