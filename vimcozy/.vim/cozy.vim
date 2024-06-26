" Airline =====================================================================
" a colored statusline for vim that clearly shows current mode and stats
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" git clone --depth 1 git@github.com:vim-airline/vim-airline.git ~/.vim/pack/vendor/start/vim-airline
" git clone --depth 1 git@github.com:vim-airline/vim-airline-themes.git ~/.vim/pack/vendor/start/vim-airline-themes
let g:airline_theme='badwolf'				" Set color theme
let g:airline_powerline_fonts=1				" Enable powerline arrows
let g:airline#extensions#tabline#enabled=1	" Enable top tab buffer bar

" NERDTree ====================================================================
" a file system explorer inside Vim
"			t - Open entry in a new tab
"			s - Open entry in a new split
" https://github.com/preservim/nerdtree
" git clone --depth 1 git@github.com:preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
map <C-S-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeFocus<CR>

" CtrlP =======================================================================
" Full fuzzy file/buffer/MRU finder
"			c-t - Open entry in a new tab
"			c-v - Open entry in vertical split
"			c-x - Open entry in horizontal split
":CtrlP - Shows searchable files (Find-mode usually accessed via Ctrl+P)
":CtrlPBuffer - Shows open buffers
":CtrlPMixed - Shows both open buffers and open files
":CtrlPMRUFiles - Shows Most Recently Used files
" https://github.com/kien/ctrlp.vim
" git clone --depth 1 git@github.com:kien/ctrlp.vim.git ~/.vim/pack/vendor/start/ctrlp

" YouCompleteMe ===============================================================
" a autocomplete plugin for insert mode in Vim
" https://github.com/ycm-core/YouCompleteMe

" VimCompletesMe ==============================================================
" a autocomplete plugin alternative.
"Without any configuration, the Tab key will, depending on the context, offer:
" * Vim's local keyword completion (Ctrl-X_Ctrl-N)
" * File path completion when typing a path (Ctrl-X_Ctrl-F)
" * Omni-completion after typing a character specified by g:vcm_omni_pattern (Ctrl-X_Ctrl-O)
" https://git.sr.ht/~ackyshake/VimCompletesMe.vim
" https://www.vim.org/scripts/script.php?script_id=4902
" # https://github.com/ackyshake/VimCompletesMe
" git clone --depth 1 https://git.sr.ht/~ackyshake/VimCompletesMe.vim ~/.vim/pack/vendor/start/VimCompletesMe

