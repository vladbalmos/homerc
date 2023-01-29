" General settings
" Leader key
let mapleader = ' '

set backspace=indent,eol,start	" More powerful backspacing
set autoindent
set expandtab "Use spaces instead of tabs
set tabstop=4 "Nuber of spaces per tab
set shiftwidth=4 "Number of spaces to use for each stop of indentation
set shiftround
set autoread
set nrformats= " Treat numbers as decimal 
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set number relativenumber
set incsearch " Show search results while typing
set hlsearch " Highlight search results
set nowrap
set noswapfile
set nobackup
set nowritebackup
set exrc
set secure
set ignorecase
set smartcase
set scrolljump=5 " Minimal number of lines to scroll when the cursor gets off the screen.
set scrolloff=3 " Minimal number of screen liones to keep above and below the cursor.

" Mappings
nnoremap <leader><leader>n :nohlsearch<CR>
nnoremap Y yy

" Splits navigation
nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>

" Resize splits bindings
nnoremap <leader>wh :vertical resize +10<CR>
nnoremap <leader>wl :vertical resize -10<CR>
nnoremap <leader>wj :resize +10<CR>
nnoremap <leader>wk :resize -10<CR>

" All modes mappings
noremap - ddp
noremap _ ddkP

" Visual mode mappings
vnoremap <C-c> "+y

nnoremap <leader><leader>f <Cmd>call VSCodeNotify('revealInExplorer')<CR>
nnoremap <leader>c<leader> <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
