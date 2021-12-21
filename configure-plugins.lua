return require('packer').startup(function()
  require('install-plugins')

  require'lspconfig'.pylsp.setup{}

  -- autocomplete config
  --
  local cmp = require 'cmp'
  cmp.setup {
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    },
    sources = {
      { name = 'nvim_lsp' },
    }
  }


  -- omnisharp lsp config
  --
  require'lspconfig'.omnisharp.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
    cmd = { "/opt/omnisharp-roslyn/run", "--languageserver" , "--hostPID", tostring(pid) },
  }

  -- Sumneko lua language server
  --
  require'lspconfig'.sumneko_lua.setup {
    settings = {
      Lua  = {
        diagnostics = {
          globals = {'vim', 'pid'}
        }
      }
    }
  }
end)
