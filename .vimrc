"==========================
""vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

"NERDTree - a file system explorer
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"t opens file in a new tab

"ctrlp - Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'ctrlpvim/ctrlp.vim'
"c-p Find-mode
"<c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.


"VimCompletesMe
Plugin 'ajh17/VimCompletesMe'
"Faster then YCM
"Tab, S-Tab to autocomplete

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"Turn off weird indentation
filetype plugin indent off
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"==========================

"Functions for moving tabs
function! MoveTabPageLeft()
    let l:x = tabpagenr()
    if l:x == 0
    else
        let l:x = l:x - 2
        exe 'tabmove ' . l:x
    endif
endfunction

function! MoveTabPageRight()
    let l:x = tabpagenr()
    if l:x == 0
    else
        exe 'tabmove ' . l:x
    endif
endfunction

"Use UTF-8
set encoding=utf-8

"Show line-numbering
:set nu

"Show matching bracket if cursor is on
:set showmatch

"Ignore case while searching
:set ignorecase

"Highlight search-results
:set hlsearch

"Search from beginning of file if find hits EOF
:set wrapscan

"Keep at least 5 lines above/below
:set scrolloff=5

"Follow indentation
:set autoindent

filetype indent on

"Set length of a tab
:set tabstop=4

":set softtabstop=4

"Set indentation tab width
:set shiftwidth=4

"Don't convert tabs into spaces
:set noexpandtab

"Import clipboard from PC/Terminal (Not available through remote-terminal)
:set clipboard=unnamed

"Set color-scheme
:colorscheme elflord

"Set syntax highlighting
:syntax enable

"Show statusbar
:set laststatus=2

"Highlight trailing spaces
:match Error /\s\+$/
"  Turn off :match Error none

"Toggle search highlight
:nmap <F3> :set hlsearch! hlsearch?<CR>

"Clear search result and highlighting
:nmap <c-f> :let @/=""<CR>

"Select next/previous tab
:nmap <F7> :tabp<CR>
:nmap <F8> :tabn<CR>

"Move tab left/right
:nmap <F5> :exe MoveTabPageLeft()<CR>
:nmap <F6> :exe MoveTabPageRight()<CR>

"Create new tab with open prompt for filename, leave empty for a new file
:nmap <c-t> :tabe

"Quit current tab/split
":nmap <c-w> :q<CR>

"Select pane down/up/left/right
:nmap <c-j> :wincmd j<CR>
:nmap <c-k> :wincmd k<CR>
:nmap <c-h> :wincmd h<CR>
:nmap <c-l> :wincmd l<CR>

"Split pane with open prompt for filename, leave empty for a new file
:map <c-s> :split
:map <c-d> :vsplit
":nmap " :split
":nmap % :vsplit

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"Scroll up/down with Shift+Up/Down
:nmap <F10> <c-y>
:nmap <F9> <c-e>

"Set relative line-numbering
:nmap <F4> :set rnu! rnu?<CR>

"Show whitespace
:nmap <F2> :set list! list?<CR>

"Show whitespace with these characters
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"Enable mouse select
":set mouse=a

"Enable scroll with mouse
":nmap <ScrollWheelUp> <c-y>
":nmap <ScrollWheelDown> <c-e>

"Set UTF-8
":set enc=utf-8
":set enc=iso-8859-1

"Set newline mode
":set ff=dos
":set ff=unix

"Set syntax language
":setf c
":setf php
":setf xml

"Set length of a tab
":set tabstop=4

"Set indentation tab width
":set shiftwidth=4

"Convert tabs into spaces
":set expandtab

"Convert all tabs to set indentation-parameters
":retab

"Import file after cursor
":r filename

"Write vim-opened file to file
":w Newfilename

"Write row 18 to EOF to file
":18, w! filerow

"Write row 18 to 22 to file
":18,22 w! filerow

"Paste-mode (paste from clipboard whithout autoindentation)
":set paste

"Insert at multiple lines
"Ctrl+V I insert text Esc

"Substitute "foo" for "bar" globally (replace)
":%s/foo/bar/g

"Record a macro
"qa - Start recording macro to register "a"
"C-a - Increment number
"q - Stop recording
"9@a - Playback macro from register "a" 9 times

"Navigate back in history
"C-o

"Navigate forward in history
"C-i

"Navigate to BOF
"gg
"1g

"Navigate to EOF
"G

"Close all windows
":qa

"Switch focus to other window
"C-ww

"Switch focus to window
"C-w<Up>
"C-w<Down>
"C-w<Left>
"C-w<Right>

"Switch focus to last window
"C-wr

"Rotate windows
"C-wR

"Move the current window to be at the very bottom/top
"C-wJ
"C-wK

"Resize height of window
"C-w+
"C-w-

"Resize width of window
"C-w<
"C-w>

"Find cahracter
"Hello world
"fw -find character "w"

"Find character while replacing
"Hello world
"cfo - change everything up to character "o"

"Work with vim grammer
"y2w - yank two words
"y3} - yank three paragrafes
"dap - delete a paragraf

"Start vim from the terminal
"vim - -p[N] Open N tab pages. When N is omitted, open one tab page for each file.
"vim -pN file1 file2 file3
"vim -d file1 file2 - Compare files in diff mode

"Powerline for Vim
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

