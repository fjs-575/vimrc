" Forget being compatible with good ol' vi
set nocompatible

" start pahtogen for easy handling of plugins
execute pathogen#infect()

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

syntax on  " Turn on that syntax highlighting

set wrapscan            " Set the search scan to wrap lines.
set hidden              " Why is this not a default.
set cpoptions=ces$      " Make the 'cw' and like commands put a $ at the end.
set nocursorline        " Don't Highlight the line which has the cursor
set background=dark     " Tell vim to set the background to dark or light, when there is an option.
set lazyredraw          " Don't update the display while executing macros.
set number              " Set linenumbers on.
set showmode            " At least let yourself know what mode you're in.
set showcmd             " Don't show the current command in the lower right corner.
set wildmenu            " Enable enhanced command-line completion.
set shellslash          " Set the forward slash to be the slash of note.
set ch=2                " Make command line two lines high.
set showtabline=1       " Show tabbar only when more tabs are present (its here for easy editing)
set vb                  " Set visual bell -- I hate that damned beeping.
set backspace=2         " Allow backspacing over indent, eol, and the start of an insert.
set scrolloff=3         " Distance from top and bottom when scrolling.
set laststatus=2        " Always show a status line. Even when there's only one window.
set virtualedit=all     " Allow the cursor to go in to invalid places.
set mousehide           " Hide the mouse pointer while typing.
set guioptions=acm      " Set of all visual stuff when using gvim.
set incsearch           " Incrementally match the search.
set hlsearch            " Set highlighting on when searching.
set synmaxcol=2048      " Syntax coloring lines that are too long just slows down the world.
set fillchars = ""      " get rid of the silly characters in separators.
set diffopt+=iwhite     " Add ignorance of whitespace to diff.
set clipboard+=unnamed  " Add the unnamed register to the clipboard.
set autoread            " Automatically read a file that has changed on disk.
set listchars=tab:▻\ ,eol:¬,trail:· " Show whitespace as symbol instead of control character.

" Set the status line the way I like it.
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]\ fo:\ [%{&fo}]

" Set the default colorscheme, font and layout
:colorscheme default
":colorscheme xoria256_fjs
if has("gui_running")
    ":colorscheme xoria256_fjs
    ":colorscheme montz
    :colorscheme github
    set gfn=Liberation\ Mono\ 10
    "set gfn=Inconsolata\ 10
    set columns=110 lines=64
endif
" Set the font on windows (yuk)
if has("win32")
    set guifont=Consolas:h11:cANSI
    set columns=94 lines=68
endif

" Whatever wrapping mode I'm in, always treat the j and k keys the same for
" scrolling
map j gj
map k gk

" Wipe out all buffers
nmap <silent> <leader>wa :1,9000bwipeout<CR>
        
" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Toggle paste mode
nmap  <leader>p :set invpaste

" Turn off that stupid highlight search
nmap <silent> <leader>n :set invhls<CR>

" Set text wrapping toggles
nmap <leader>w :setl invwrap<CR>

" Set text wrapping toggles
nmap <leader>ww :setl invlinebreak<CR>

" Set up retabbing on a source file
nmap  <leader>rr :1,$retab

" cd to the directory containing the file in the buffer
nmap  <leader>cd :lcd %:h

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap  <leader>md :!mkdir -p %:p:h

" Set Ctrl-n to toggle NerdTree On/Off
nmap <silent> <C-n> :NERDTreeToggle<CR>

" Make the current file executable
nmap <leader>x :w<CR>:!chmod 755 %<CR>:e<CR>

" Write current file as root
nmap <leader>W :w !sudo tee %

" Call the function to remove the trailing whitespace from file
noremap <leader>rw :call DeleteTrailingWS()<CR>

" --- CUSTOM FUNCTIONS ---------------------------------------------------{{{1
"
"
" Word Processor Mode for editing text in vim this I took from the following
" website: www.drbunsen.org/writing-in-vim/
" I don't know if I like it? :/
" and now enabled again
func! WordProcessorMode()
     setlocal formatoptions=1
     setlocal noexpandtab
     setlocal spell spelllang=nl
     set complete+=s
     set formatprg=par
     setlocal wrap
     setlocal linebreak
endfunc
com! WP call WordProcessorMode()

" FUNCTION Remove trailing whitespace from file
function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction
" ------------------------------------------------------------------------}}}1
