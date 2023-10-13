local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  -- Go to definition.
 vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
 -- Hover the explanation of what's under the cursor
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
  -- Search symbol in workspace
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
  -- Display diagnostics floating window
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- goto next diagnostic & open float
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- goto prev diagnostic open float
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- Code actions that can be performed on the current line or selection
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- lists all refrences for the symbol under cursor
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- This renames all refrences of the symbol under the cursor. Very good for renaming components or interfaces used on many places
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- This function provides signature information for a function or method call at the cursor
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'svelte', 'rust_analyzer', 'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
