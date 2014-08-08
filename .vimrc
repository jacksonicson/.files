" Load pathogen VIM plugins
execute pathogen#infect() 

" Switch back to normal mode by jk
:imap jk <Esc>

set laststatus=2
syntax on
set tabstop=4
set shiftwidth=4
set expandtab

set autoread
set smarttab
set autoindent smartindent

set backspace=indent,eol,start
"set linebreak
set ttyfast
set noerrorbells
set visualbell

let mapleader="\<space>"
nnoremap <SPACE> <Nop>

nnoremap <leader>q :q!<cr>
nnoremap <leader>w :update<cr>

filetype plugin indent on 

" Map home key 
map <Home> ^
imap <Home> <Esc>^i

" searching 
set incsearch
set ignorecase
set hlsearch
set smartcase
" Clear search highlights if not required any more
nmap \q :nohlsearch<CR>

" Bind (navigate to previous buffer) to ctrl+e
nmap <C-e> :e#<CR>

"set showmatch
set diffopt=filler,iwhite

" Correct line up and line down movements
nmap j gj
nmap k gk

set mouse=a
" set number
" set ruler

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

map <silent> <C-Right> :tabn<CR>
map <silent> <C-Left> :tabp<CR>
map <silent> <C-Up> :tabnew<CR>

map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>
inoremap <C-t>    <Esc>:tabnew<CR>
nnoremap <C-t>    :tabnew<CR>

inoremap <C-w> <Esc>:tabclose<CR>
nnoremap <C-w> <Esc>:tabclose<CR>

set t_Co=256

let g:airline_detect_whitespace=0
let g:airline_powerline_fonts=1

" Faster scrolling 
set lazyredraw

" Highlight current cursor line
colorscheme Tomorrow
set cursorline


set virtualedit=onemore


" Neocomplete settings

" Disable AutoComplPop
let g:acp_enableAtStartup=0

" Use Neocomplete
" let g:neocomplete#enable_at_startup=1

" Smart case
" let g:neocomplete#enable_smart_case=1

" Minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern='\*ku\*'

" Define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }


"Define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" " <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    " return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 3

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
