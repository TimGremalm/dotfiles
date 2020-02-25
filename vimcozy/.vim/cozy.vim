" Airline =====================================================================
" a colored statusline for vim that clearly shows current mode and stats
let g:airline_theme='badwolf'				" Set color theme
let g:airline_powerline_fonts=1				" Enable powerline arrows
let g:airline#extensions#tabline#enabled=1	" Enable top tab buffer bar

" NERDTree ====================================================================
" a file system explorer inside Vim
"			t - Open entry in a new tab
"			s - Open entry in a new split
map <C-n> :NERDTreeToggle<CR>

" CtrlP =======================================================================
" Full fuzzy file/buffer/MRU finder
"			c-t - Open entry in a new tab
"			c-v - Open entry in vertical split
"			c-x - Open entry in horizontal split
":CtrlP - Shows searchable files (Find-mode usually accessed via Ctrl+P)
":CtrlPBuffer - Shows open buffers
":CtrlPMixed - Shows both open buffers and open files
":CtrlPMRUFiles - Shows Most Recently Used files

" YouCompleteMe ===============================================================
" a autocomplete plugin for isnert mode in Vim

