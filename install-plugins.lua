return require('packer').startup(function()
  use 'cmp'
  use 'wbthomason/packer.nvim'

  -- Unicode
  -- Input unicode characters 
  use 'chrisbra/unicode.vim'

  -- Telescope
  -- go-to-definition
  use 'nvim-lua/plenary.nvim'


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
end)
