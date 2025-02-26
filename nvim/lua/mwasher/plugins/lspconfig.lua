local plugin = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  keymap(bufnr, 'n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  keymap(bufnr, 'n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  keymap(bufnr, 'n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  keymap(bufnr, 'n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
end

plugin.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

function plugin.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

function plugin.config()
  local lspconfig = require('lspconfig')
  local icons = require('mwasher.icons')

  local servers = {
    'lua_ls',
    'jsonls',
    'pyright',
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = 'DiagnosticSignError', text = icons.diagnostics.Error },
        { name = 'DiagnosticSignWarn', text = icons.diagnostics.Warning },
        { name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
        { name = 'DiagnosticSignInfo', text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'rounder',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
  )

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
  )

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), 'signs', 'values') or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  for _, server in pairs(servers) do
    local opts = {
     on_attach = plugin.on_attach,
     capabilities = plugin.common_capabilities(),
    }

    local require_ok, settings = pcall(require, 'mwasher.lspsettings.' .. server)

    if require_ok then
      opts = vim.tbl_deep_extend('force', settings, opts)
    end

    lspconfig[server].setup(opts)
  end
end

return plugin
