call plug#begin('~/.vim/plugged')

" appereance
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" zen mode
Plug 'junegunn/goyo.vim'

call plug#end()

syntax on
filetype plugin indent on

" set auto indentation
set autoindent

" set theme
colorscheme gruvbox
set background=dark


" show line number
set number relativenumber

" disable netrw history
let g:netrw_dirhistmax = 0

" enable mouse support
set mouse=a

" add max long text
set colorcolumn=120

" disable wrap text
set textwidth=0 
set wrapmargin=0

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" yaml config
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" hightlight TODO
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END

" esc using JK
inoremap JK <ESC>
vnoremap JK <ESC>

" vim-go configuration
let g:go_autodetect_gopath = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_fold_enable = []

" leader configuration
let mapleader = ","
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>, :noh<CR>
nnoremap <leader>gi :GoImplements<CR>
nnoremap <leader>f :Files<CR>
" copy paste system
nnoremap <leader>p "+p<CR>
nnoremap <leader>y "+y<CR>
