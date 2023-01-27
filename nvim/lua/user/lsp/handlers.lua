local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false, -- disable virtual text
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap

  which_key.register({
    ['<leader>g']  = { name = "Goto" },
    ['<leader>gD'] = { [[<cmd>lua vim.lsp.buf.declaration()<CR>]], "definition" },
    ['<leader>gd'] = { [[<cmd>lua vim.lsp.buf.definition()<CR>]], "declaration" },
    ['<leader>gI'] = { [[<cmd>lua vim.lsp.buf.implementation()<CR>]], "implementation" },
    ['<leader>gr'] = { [[<cmd>lua vim.lsp.buf.references()<CR>]], "references" },
    ['<leader>gl'] = { [[<cmd>lua vim.diagnostic.open_float()<CR>]], "diagnostic" },
    ['<leader>gn'] = { [[<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>]], "next buffer" },
    ['<leader>gp'] = { [[<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>]], "next buffer" },

    ['<leader>K'] = { [[<cmd>lua vim.lsp.buf.hover()<CR>]], "hover" },

    ['<leader>l'] = { name = "code actions" },
    ['<leader>lf'] = { [[<cmd>lua vim.lsp.buf.format { async = true }<cr>]], "format" },
    ['<leader>la'] = { [[<cmd>lua vim.lsp.buf.code_action()<cr>]], "code action" },
    ['<leader>lr'] = { [[<cmd>lua vim.lsp.buf.rename()<cr>]], "rename" },
    ['<leader>ls'] = { [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], "signature help" },
  })
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == "sumneko_lua" then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == "jdtls" then
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require("jdtls.setup").add_commands()
    vim.lsp.codelens.refresh()
  end

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end

  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

return M
