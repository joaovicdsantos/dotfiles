call plug#begin(stdpath('data') . '/plugged')
 
"Plug 'scrooloose/nerdtree'

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'eslint/eslint'
"Plug 'prettier/vim-prettier'
"Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'chiel92/vim-autoformat'
Plug 'APZelos/blamer.nvim'
Plug 'chun-yang/auto-pairs'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'editorconfig/editorconfig-vim'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\} 
Plug 'terryma/vim-multiple-cursors'
Plug 'suan/vim-instant-markdown'

call plug#end()
 
let g:coc_global_extensions = ['coc-discord-rpc', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-go', 'coc-git', 'coc-python', 'coc-html', 'coc-css', 'coc-vetur']

set relativenumber
set ts=2 sw=2
set cursorline 

"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"noremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Nvim Tree
nnoremap <C-f> :NvimTreeToggle<CR>
nnoremap <leader>t :NvimTreeRefresh<CR>
nnoremap <C-c> :NvimTreeClose<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

highlight NvimTreeFolderIcon guibg=blue

let g:multi_cursor_start_word_key      = '<C-r>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-r>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme gruvbox
 
let g:python3_host_prog="/usr/bin/python3"
let g:vim_vue_plugin_load_full_syntax = 1

command! -nargs=0 Prettier :CocCommand prettier.formatFile
