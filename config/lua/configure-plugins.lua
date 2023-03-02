local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

return require('packer').startup(function()
  -- Packer
  -- Packages 
  use 'wbthomason/packer.nvim'

  -- Unicode
  -- Input unicode characters 
  use 'chrisbra/unicode.vim'

  -- Telescope
  -- go-to-definition
  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0'}

  -- Nvim cmp
  -- code completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'

  -- Emmet
  -- Easily write HTML
  use 'mattn/emmet-vim'

  -- EasyAlign
  -- Align all the things 
  use 'junegunn/vim-easy-align'

  -- Hashivim 
  -- Terraform's official terraform vim plugin
  use 'hashivim/vim-terraform'

  -- venn.nvim
  -- Cool plugin for drawing diagrams
  use {'jbyuki/venn.nvim', branch = 'main'}

  -- Configuration settings
  vim.g.python3_host_prog = '/usr/bin/python3'

  -- CMP Setup
  local has, cmp = pcall(require, 'cmp')
  if has then
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = {
        ['<C-Space>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },

        ['<Tab>'] = function(fallback)
          if not cmp.select_next_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,

        ['<S-Tab>'] = function(fallback)
          if not cmp.select_prev_item() then
            if vim.bo.buftype ~= 'prompt' and has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end
        end,
      },

      sources = cmp.config.sources(
      {
        { name = 'nvim_lsp' },
      },
      {
        { name = 'buffer' },
      })
    })


    -- LSP Setup
    has, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp') 
    if has then 
      local capabilities = cmp_nvim_lsp.default_capabilities()
      
      -- LSP Config
      --
      has, lspconfig = pcall(require, 'lspconfig')
      if has then
        lspconfig.terraformls.setup{capabilities = capabilities}

        vim.api.nvim_create_autocmd({"BufWritePre"}, {
          pattern = {"*.tf", "*.tfvars"},
          callback = function()
            vim.lsp.buf.format()
          end
        })

        lspconfig.pyright.setup{
          capabilities = capabilities
        }

      --lspconfig.denols.setup{
      --  capabilities = capabilities
      --}

        lspconfig.gopls.setup{}
      end
    end
  end

  -- venn.nvim: enable or disable keymappings
  function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == 'nil' then
      vim.b.venn_enabled = true
      vim.cmd[[setlocal ve=all]]
      -- draw a line on HJKL keystokes
      vim.api.nvim_buf_set_keymap(0, 'n', 'J', '<C-v>j:VBox<CR>', {noremap = true})
      vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<C-v>k:VBox<CR>', {noremap = true})
      vim.api.nvim_buf_set_keymap(0, 'n', 'L', '<C-v>l:VBox<CR>', {noremap = true})
      vim.api.nvim_buf_set_keymap(0, 'n', 'H', '<C-v>h:VBox<CR>', {noremap = true})
      -- draw a box by pressing 'f' with visual selection
      vim.api.nvim_buf_set_keymap(0, 'v', 'f', ':VBox<CR>', {noremap = true})
    else
      vim.cmd[[setlocal ve=]]
      vim.cmd[[mapclear <buffer>]]
      vim.b.venn_enabled = nil
    end
  end
  -- toggle keymappings for venn using <leader>v
  vim.api.nvim_set_keymap('n', '<leader>v', ':lua Toggle_venn()<CR>', { noremap = true})
end)
