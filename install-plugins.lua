return require('packer').startup(function()
  use 'cmp'
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  -- nvim-cmp

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Ultisnips
  use 'SirVer/ultisnips'
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- Emmet
  use 'mattn/emmet-vim'

  -- EasyAlign
  use 'junegunn/vim-easy-align'
end)
