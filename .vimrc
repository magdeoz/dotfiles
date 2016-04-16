,""""""""""""""""""""""""""""""""""""    
"   __     __ _                    "
"   \ \   / /(_)_ __ ___           "
"    \ \ / / | | '_ ` _ \          "      
"     \ V /  | | | | | | |         "
"      \_/   |_|_| |_| |_|         "
"                                  "
""""""""""""""""""""""""""""""""""""    
 
"""""""""""""""""""""""""""""""Configurações"""""""""""""""""""""""""""""""""""""""""""""
 
"Use the vim settings, not vi
set nocompatible
"
"Sets the size of vim's command history:
set history=1000
"
set rtp+=/home/gabriel/.local/lib/python3.5/site-packages/powerline/bindings/vim

"Enables the recognition files
filetype plugin on
filetype indent on
"
"Reloads the file if it is edited by an external program while open
set autoread
"
"Disable backups:
set nobackup
set noswapfile
set nowritebackup
"
"It shows the way you are 
set showmode
"
" Search:
set hlsearch
set ignorecase
set smartcase
set incsearch
"
"Clear the outstanding results:
nmap <silent> <C-C> :silent noh<CR>
"
" Clipboard system:
set clipboard=unnamed
"
"Height command bar
set cmdheight=2
"
"Enable regular expressions
set magic
"
"Enable syntax highlighting
syntax on
"
"Vim color scheme
colorscheme  gruvbox

set background=dark
"
"Ruler breaks and number of lines:
set nolinebreak
set number
set ruler
"
"It allows navigation within a long line with j and k
set wrap
"
"Insert spaces instead of tab characters
set expandtab
"
"Smart Tabs Use
set smarttab
"
"Sets a tab as eight spaces
set shiftwidth=8
set tabstop=8
"
"Every time you close a parenthesis, bracket or brace, Vi shows where it was opened. If there is no  pair.
set sm
"
"It shows the file name at the top of the prompt
set title

set laststatus=2

set encoding=utf-8

set showtabline=2 

set noshowmode 

set fillchars+=stl:\ ,stlnc:\

"Shortcuts

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Plugins

"Patogen
execute pathogen#infect()
"
" NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> :NERDTreeToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>
 
            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    " }
       
" YouCompleteMe
 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>     
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"          
"Python-mode
 
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
 endif
