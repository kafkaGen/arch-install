" -------------------------------------------------------------------
" Plugins
call plug#begin()
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar themes
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-python/python-syntax'
call plug#end()

" -------------------------------------------------------------------
" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = "+"
let g:NERDTreeDirArrowCollapsible = "~"
let g:NERDTreeMinimalUI = 1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
highlight NERDTreeClosable guifg=#98be65 ctermfg=2
highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8

" -------------------------------------------------------------------
"  Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" -------------------------------------------------------------------
"  Settings
syntax on
let python_highlight_all=1
set number
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set autoindent
set encoding=UTF-8
set scrolloff=3
set sidescrolloff=5
set noswapfile
colorscheme gruvbox
"colorscheme onedark
highlight Normal ctermbg=none
