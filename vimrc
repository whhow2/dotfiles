"leader key set to space
nnoremap <SPACE> <Nop>
let mapleader=" "

set termguicolors

call plug#begin()
  Plug 'tpope/vim-commentary'
  Plug 'dense-analysis/ale'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'rhysd/vim-lsp-ale'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'lambdalisue/vim-fern'
  Plug 'tribela/vim-transparent'
  Plug 'mattn/vimtweak'
  Plug 'mattn/transparency-windows-vim'
  Plug 'puremourning/vimspector'
  Plug 'airblade/vim-gitgutter'
  Plug 'mhinz/vim-startify'
call plug#end()

set background=dark
colorscheme quiet

""" FZF """
set runtimepath^=~/.fzf
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>ft :Rg<CR>
nnoremap <silent> <leader>fb :Buffers <CR>
nnoremap <silent> <leader>fg :GFiles <CR>
nnoremap <silent> <leader><space> :Files <CR>

""" CORE SETTINGS """
syntax on
" set re=0
filetype plugin on


"file format settings
set fileformat=unix
set encoding=UTF-8

""" WHITESPACE AND TAB SETTINGS """
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

filetype indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
" set cindent
" set cinkeys-=0#
" set indentkeys-=0#
set smarttab
set expandtab
set backspace=indent,eol,start

""" LINE WRAPPING """
set nowrap

""" CURSOR AND NUMBER SETTINGS """
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
set cursorline
set number
set relativenumber
set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set updatetime=100

""" ERROR SOUNDS AND FLASHES """
set noerrorbells visualbell t_vb=

""" STATUS SETTINGS """
set laststatus=2
set showcmd
" set noshowmode
set conceallevel=1
let g:vim_json_conceal=0

""" BACKUP FILES """
set noswapfile
set nobackup
set undofile
if (!has("nvim"))
    set undodir=~/.vim/.undo
endif

""" CLIPBOARD SETTING """
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

""" SEARCHING """
set ignorecase
set smartcase
set incsearch
set hlsearch

""" MOUSE SETTING """
set mouse=a

""" SPLITS """
set splitbelow
set splitright

""" KEYMAPS """

""" SAVING """
nnoremap zz :update<CR>
inoremap <C-z> <ESC>:update<cr>a

""" CLEAR HIGHLIGHTING """
nnoremap <silent><Leader>h :noh<CR>

""" MAC ALT KEYS """
imap ˙ <Left>
" imap ∆ <Down>
" imap ˚ <Up>
imap ¬ <Right>

""" EASY ESCAPE """
inoremap jk <ESC>:update<CR>
inoremap kj <ESC>


""" WINDOW NAVIGATION """
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""" NAVIGATE BUFFERS """
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

""" MOVING TEXT VERTICALLY """
""" for mac
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

""" all other OSs
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

""" FILE SEARCHING """
set path=**

""" INDIVIDUAL PLUGIN SETTINGS """


"Map buffer quick switch keys"
nnoremap <silent> <leader><Tab> <C-^>

""" EMMET """
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

""" VIM-LSP """
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


""" ASYNC COMPLETE """
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

""" ALE """
let g:ale_virtualtext_cursor=0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
" let g:ale_sign_error = 'e'
" let g:ale_sign_warning = 'w'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_set_highlights = 0

""" FERN """
" Disable netrw
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>e :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> M <Plug>(fern-action-move)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> m <Plug>(fern-action-mark-toggle)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" Git
nnoremap <silent> <leader>g :G<CR>

" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

""" FORMATTING """
 autocmd BufWritePost *.py silent !black %

 """ INDENTLINE """
 let g:indentLine_enabled = 0

 """ highlight groups for bold """
" if g:colors_name == 'quiet'
"   hi Statement cterm=bold
"   hi Keyword cterm=bold
"   hi Type cterm=bold
"   hi Function cterm=bold
"   hi Constant cterm=bold
"   hi Special cterm=bold
" endif
