" Vim color file
" Maintainer:	Masque (mod of David Schweikert <dws@ee.ethz.ch> delek scheme)
" Last Change:	2014-09-09

hi clear

let colors_name = "sobrio"

" Normal should come first
hi Normal	guibg=#121212	guifg=#888888
hi Cursor	guibg=fg	guifg=bg

hi CursorLine   cterm=NONE   ctermbg=0		guibg=#222222
hi CursorLineNr cterm=bold  ctermfg=11   ctermbg=0		guibg=#222222 guifg=#CCAA66
hi DiffAdd	ctermbg=0 ctermfg=6		guibg=#222222 guifg=#2b4780
hi DiffChange	ctermbg=0 ctermfg=5		guibg=#222222 guifg=#665980 
hi DiffDelete	cterm=bold ctermbg=0 ctermfg=1	guibg=#222222 guifg=#802b41
hi DiffText	cterm=bold ctermbg=0 ctermfg=11	guibg=#222222 guifg=#CCAA66
hi Directory	ctermfg=12			guifg=#6687cc
hi ErrorMsg	ctermbg=none ctermfg=9		guifg=#cc6681
hi FoldColumn	ctermbg=8 ctermfg=7		guibg=#222222 guifg=#999999
hi Folded	ctermbg=8 ctermfg=7		guibg=#222222 guifg=#999999
hi IncSearch	cterm=reverse			gui=reverse
hi LineNr	ctermbg=none ctermfg=8		guibg=#121212 guifg=#444444
hi ModeMsg	cterm=bold			gui=bold
hi MoreMsg	ctermfg=2			gui=bold guifg=#6d8059
hi NonText	ctermfg=5			gui=bold guibg=#121212 guifg=#665980
hi Pmenu	ctermbg=8 ctermfg=none		guibg=#999999 guifg=#222222
hi PmenuSel	ctermbg=0 ctermfg=11		guibg=#222222 guifg=#CCAA66
hi Question	ctermfg=2			gui=bold guifg=#6d8059
hi Search	ctermbg=3 ctermfg=8		guibg=#80632c guifg=#444444
hi SpecialKey	ctermfg=12			guifg=#b1a3cc
hi StatusLine	cterm=none ctermbg=8 ctermfg=15	guifg=#cccccc guibg=#444444
hi StatusLineNC	cterm=none ctermbg=0 ctermfg=7	guifg=#999999 guibg=#222222
hi TabLine      cterm=none ctermbg=0 ctermfg=none	gui=none guifg=#888888 guibg=#222222
hi TabLineFill  cterm=none ctermbg=0 ctermfg=none	gui=none guifg=#888888 guibg=#222222
hi TabLineSel   cterm=bold ctermbg=1 ctermfg=15	guifg=#cccccc guibg=#802b41
hi Title	ctermfg=5 			gui=bold guifg=#665980
hi VertSplit	cterm=NONE ctermbg=none ctermfg=0	guifg=#222222 gui=NONE
hi Visual	cterm=reverse ctermbg=0		gui=reverse guibg=#222222
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=1			guifg=#802b41
hi WildMenu	ctermbg=8 ctermfg=none		guibg=#444444 guifg=#999999

" syntax highlighting
hi Comment	cterm=NONE ctermfg=4	gui=NONE guifg=#2b4780
hi Constant	cterm=NONE ctermfg=1	gui=NONE guifg=#802b41
hi Identifier	cterm=NONE ctermfg=10	gui=NONE guifg=#afcc8f
hi PreProc	cterm=NONE ctermfg=5	gui=NONE guifg=#665980
hi Special	cterm=NONE ctermfg=7	gui=NONE guifg=#999999
hi Statement	cterm=NONE ctermfg=14	gui=NONE guifg=#8fbbcc
hi Type		cterm=NONE ctermfg=2	gui=NONE guifg=#6d8059

" spell check
hi SpellLocal	cterm=underline ctermfg=6	ctermbg=none	guifg=#4c7180
hi SpellBad	cterm=underline ctermfg=1	ctermbg=none	guifg=#802b41
hi SpellCap	cterm=underline ctermfg=4	ctermbg=none	guifg=#2b4780
hi SpellRare	cterm=underline ctermfg=5	ctermbg=none	guifg=#665980
" vim: sw=2
