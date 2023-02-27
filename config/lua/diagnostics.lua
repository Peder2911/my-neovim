-- For if I want to do something with the diag handler...
-- see :h vim.diagnostic

local namespace = vim.api.nvim_create_namespace("my_namespace")
local orig_signs_handler = vim.diagnostic.handlers.signs
vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, diagnostics, opts)
    orig_signs_handler.show(namespace, bufnr, diagnostics, opts)
  end,
  hide = function(_, bufnr)
    orig_signs_handler.hide(namespace, bufnr)
  end
}
