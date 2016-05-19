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
":ser ff=dos
":ser ff=unix

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

"Substitute "foo" for "bar" globally
":%s/foo/bar/g

"Record a macro
"qa - Start recording macro to register "a"
"C-a - Increment number
"q - Stop recording
"9@a - Playback macro from register "a" 9 times

"vim - -p[N] Open N tab pages. When N is omitted, open one tab page for each file.
"vim -pN file1 file2 file3

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

