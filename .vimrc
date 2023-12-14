syntax enable
filetype plugin indent on
set ts=2 sts=2 sw=2 et ai si
set nu
set backspace=indent,eol,start
set mouse=a
set clipboard=unnamed
set ww=<,>,[,]
set guifont=consolas:h14
set lines=999 columns=999
vmap <C-c> "+y
vmap <C-p> "+p
map <C-S-v> ^W"*
inoremap <C-Q> <C-\><C-O>dB
map <C-K> :ClangFormat<CR>
let g:clang_use_library=1
call plug#begin()

Plug 'lervag/vimtex'
Plug 'rhysd/vim-clang-format'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'yaegassy/coc-pylsp', {'do': 'yarn install --frozen-lockfile'}
Plug 'p00f/cphelper.nvim'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'gruvbox-community/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ex-surreal/vim-std-io'
call plug#end()

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

set termguicolors
colo monokai
" let g:airline_theme='monokai'

let g:std_io_user_command = {'cpp': "'g++ -Wall --std=c++17 -static-libstdc++ -o ' . expand('%:p:r') . '.o ' . expand('%:p') . ' && ' . expand('%:p:r') . '.o'"}


autocmd filetype cpp nnoremap <F5> :w <bar> !g++ % -static-libstdc++ -std=c++17  -o a & .\a.exe < in.txt > out.txt & cat out.txt<CR>
autocmd filetype cpp nnoremap <F6> :!%:r<CR>
autocmd filetype c nnoremap <F5> :w <bar> !gcc %    -o a & .\a.exe < in.txt > out.txt & cat out.txt <CR>
autocmd filetype c nnoremap <F6> :!%:r<CR>
autocmd filetype python nnoremap <F5> :w <bar> !python % < in.txt >out.txt & cat out.txt <CR>
autocmd filetype cs nnoremap <F5> :w <bar> !dotnet run < in.txt > out.txt & cat in.txt &cat out.txt <CR>
xnoremap <leader>s xi{}<Esc>P

vnoremap d "_d
nnoremap d "_d
vnoremap dd "_dd
nnoremap dd "_dd

let g:vimtex_view_method='sumatra'


" set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
