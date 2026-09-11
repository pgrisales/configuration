" --- Defaults & Clean Behavior ---
syntax on
set number
set background=dark
set clipboard=unnamedplus " Uses system clipboard when available

" --- Indentation (2 spaces) ---
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" --- Search Improvements ---
set hlsearch
set ignorecase          " Case-insensitive search
set smartcase           " Case-sensitive if pattern contains capital letters
nnoremap <Esc> :noh<CR> " Press Esc to clear search highlights

" --- Remote / SSH Ergonomics ---
set visualbell          " Quiet errors without terminal beeping
set mouse=a             " Mouse support enabled
set undo-dir=~/.vim/undodir " Persistent undo across sessions
set undofile
