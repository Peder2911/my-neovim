lua require("filetypes")
lua require("configure-plugins")
lua require("diagnostics")
lua require("keymaps")

" Preferences

set shiftwidth=3
set expandtab
colorscheme my_256_colors 
set signcolumn=yes
set relativenumber
set number 

" Keybindings
nnoremap gd :Telescope lsp_definitions<CR>
