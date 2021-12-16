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

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/playground' 
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'MunifTanjim/prettier.nvim'

  " Completion
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed    

  " Completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

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
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

call plug#end()

set completeopt=menu,menuone,noselect

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
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>

" lua config
lua << EOF

-- Treesitter
  require 'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true
    },
    indent = {
      enable = false,
      disable = {},
    },
    ensure_installed = {
      "tsx",
      "toml",
      "fish",
      "php",
      "json",
      "yaml",
      "swift",
      "html",
      "scss",
      "javascript",
      "typescript",
      "lua",
      "vim"
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,
      persist_queries = false
    },
  }
   
  -- LSP config
  local nvim_lsp = require('lspconfig')
  
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
    local opts = { noremap=true, silent=true }
  
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  
  end
  
  
  -- lspsaga 
  -- local saga = require 'lspsaga'
  -- saga.init_lsp_saga {
  --   -- error_sign = '',
  --   -- warn_sign = '',
  --   -- hint_sign = '',
  --   -- infor_sign = '',
  --   -- border_style = "round",
  -- }
  
  local null_ls = require("null-ls")
  local prettier = require("prettier")
  
  null_ls.setup({
    on_attach = function(client, bufnr)
      if client.resolved_capabilities.document_formatting then
        vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      end
  
      if client.resolved_capabilities.document_range_formatting then
        vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
      end
    end,
  })
  
  prettier.setup({
    bin = 'prettier', -- or `prettierd`
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
  })

  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  
  nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }

EOF

colorscheme fahrenheit
set background=dark

