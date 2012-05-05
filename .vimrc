" sets {{{
set nocompatible
syntax on
filetype plugin indent on
color desert

set encoding=utf-8
set wildmenu
set number
set modeline
set modelines=10
set textwidth=80
set formatoptions=tcroql
set cursorline
set background=light
set dir=~/tmp,/var/tmp,/tmp
set autoindent
set smartindent
set copyindent
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch
set ignorecase
set hlsearch
set autowrite
set foldmethod=marker
set list listchars=tab:\ \ ,trail:⋅
set showmatch
set showcmd
set ruler
set smarttab
set sidescrolloff=5

" powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256       " Explicitly tell vim that the terminal supports 256 colors
let g:Powerline_symbols='fancy'
" maps{{{
map ; :
imap ii <C-[>

nmap date :r!date +\%F<CR>
nmap pass :r!apg -n 1<CR>

nmap tt :tabnew<CR>
nmap tq :tabclose<CR>
nmap th :tabprev<CR>
nmap tl :tabnext<CR>

nmap ,dd :r! date +"\%a \%b \%d \%T \%Y"<CR>
"}}}
" autocmds {{{
" highlight text that is @ >80 chars
match ErrorMsg '\%>80v.\+'
let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

au BufRead,BufNewFile *.jade        set ft=jade
au BufRead,BufNewFile *.json        set ft=javascript
au BufRead,BufNewFile *.coffee      set ft=coffee

au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
au FileType ruby,eruby set fdm=syntax sw=2 ts=2
au FileType haml       set fdm=syntax sw=2 ts=2
au FileType coffee     setl fdm=indent nofoldenable sw=2

" Remove trailing spaces
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw
" let coffee_compile_vert = 1
"}}}
" bundles {{{
" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'Command-T'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Syntastic'
Bundle 'VimOrganizer'
Bundle 'ack.vim'
Bundle 'gnupg'
Bundle 'endwise.vim'
Bundle 'herald.vim'
Bundle 'tsaleh/vim-tmux'
"}}}
