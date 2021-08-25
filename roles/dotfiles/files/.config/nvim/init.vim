setglobal nocompatible

""" For faster redraw
set ttyfast
" set lazyredraw

" Mouse support
set mouse=a

call plug#begin('~/.local/share/nvim/plugged')

" Base
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'justinmk/vim-dirvish'
Plug 'jiangmiao/auto-pairs'
Plug 'aiven715/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim', { 'on': ['Files', 'Buffers', 'Rg'] }

" Syntax support
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'jparise/vim-graphql', { 'for': ['graphql'] }
Plug 'digitaltoad/vim-pug', { 'for': ['pug'] }
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }

" Formatting
Plug 'rhysd/vim-clang-format', { 'for': ['c'] }
Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Other
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript', 'typescript'] }

call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

" Base settings
let mapleader = ','
set nonumber
set relativenumber
set updatetime=100
set nobackup
set noswapfile
set termguicolors
"set colorcolumn=78

" Color scheme
set background=dark
colorscheme onedark

hi Normal guibg=none
hi LineNr guibg=none
hi EndOfBuffer guibg=none
hi CursorLineNr guibg=none
hi StatusLine gui=none guibg=none guifg=none
hi SignColumn guibg=none
hi MatchParen gui=underline guibg=none
hi NonText guibg=none

" Invisible characters
set listchars=eol:¬,space:·,tab:--,trail:·,extends:>,precedes:<
set list

" Tabs
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" Searching
set hlsearch
set incsearch
set noignorecase
set smartcase

" Statusline
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" Fzf
map <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nmap <leader>f :Rg<Space>
vmap <leader>f <ESC>:Rg<Space><C-R><C-W><CR>

" Sign column
set signcolumn=yes

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Ruler
" set colorcolumn=80

" Terminal
nmap <leader>t :split<CR>:term<CR>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

" Emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': "'",
\  },
\}

" Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Clang format
autocmd BufWritePre *.c ClangFormat

" Rust format
let g:rustfmt_autosave = 1

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Go to definition
nnoremap <C-A-i> :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <C-i> :call CocAction('jumpDefinition')<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

let g:coc_node_path = '/usr/bin/node'
