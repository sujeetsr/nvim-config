" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
set laststatus=2   " Always show the statusline (for powerline)
set encoding=utf-8 " Necessary to show unicode glyphs (for powerline)
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set lazyredraw
set expandtab
set showmatch
set showmode
set nobackup
set nowritebackup
let mapleader = ","
set ruler
set incsearch
set nohlsearch
set ignorecase
set number

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path (vim.org tip #2)
if has("unix")
    map ,f :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,f :e <C-R>=expand("%:p:h") . "\" <CR>
endif

" make navigation between splits easier (instead of ctrl-w then j, its just
" ctrl-j)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF
nnoremap <leader>; :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Coc definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" tabstop
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jst setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xhtml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType txt setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType groovy setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html.handlebars setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Plugins
call plug#begin()

  " Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed    
  " colorscheme
  Plug 'rakr/vim-one'
  Plug 'brendonrapp/smyck-vim'
  Plug 'fcpg/vim-fahrenheit'
  Plug 'haishanh/night-owl.vim'
  Plug 'arcticicestudio/nord-vim'

  " Status line
  Plug 'vim-airline/vim-airline'

  " syntax
  Plug 'yalesov/vim-emblem'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'kchmck/vim-coffee-script'
  Plug 'joukevandermaas/vim-ember-hbs'

  " Git
  Plug 'tpope/vim-fugitive'

  " Code editing
  Plug 'adelarsq/vim-matchit' 
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'Raimondi/delimitMate'
  Plug 'bkad/camelcasemotion'

  " File Search / navigation
  Plug 'mileszs/ack.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on
filetype plugin on

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" Coc completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

colorscheme fahrenheit
set background=dark

