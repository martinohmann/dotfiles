
" Vim color file
" Maintainer:	Piotr Husiatyński <phusiatynski@gmail.com>

set background=dark
set t_Co=256
let g:colors_name="256-grayvim-gvim"

let python_highlight_all = 1
let c_gnu = 1


hi Normal	    guifg=#dadada         guibg=#262626        gui=none
hi Cursor       guifg=#ff0000                gui=none
hi SpecialKey	guifg=#5fffff                 gui=bold
hi Directory	guifg=#5fd700                 gui=none
hi ErrorMsg     guifg=#af0000         guibg=#ffffff      gui=none
hi PreProc	    guifg=#949494                gui=bold
hi Search	    guifg=#d70000         guibg=#080808        gui=bold
hi Type		    guifg=#5fafff                 gui=bold
hi Statement	guifg=#5fafff                 gui=none
hi Comment	    guifg=#808080                gui=none
hi Identifier	guifg=#87afff                gui=bold
hi DiffText	    guifg=#870000          guibg=#bcbcbc        gui=none
hi Constant	    guifg=#ff8700                gui=none
hi Todo         guifg=#121212         guibg=#87ff00        gui=bold
hi Error	    guifg=#121212         guibg=#af0000        gui=bold
hi Special	    guifg=#d70000                gui=bold
hi Ignore       guifg=#ffd700                gui=bold
hi Underline    guifg=#808080                gui=none

hi FoldColumn	guifg=#9e9e9e                gui=bold
hi StatusLineNC guifg=#9e9e9e         guibg=#1c1c1c        gui=none
hi StatusLine   guifg=#9e9e9e         guibg=#121212        gui=bold
hi VertSplit    guifg=#9e9e9e         guibg=#1c1c1c        gui=bold

hi LineNr	    guifg=#444444         guibg=#808080        gui=bold
hi LineNr	    guifg=#9e9e9e         guibg=#262626        gui=bold
hi NonText	    guifg=#5fffff                 gui=bold


hi Pmenu        guifg=#ffffff       guibg=DarkGray    gui=none
hi PmenuSel             guibg=Gray        gui=bold
hi PmenuSbar    guifg=DarkGray    guibg=DarkGray    gui=none
hi PmenuThumb   guifg=Gray        guibg=Gray        gui=none

"vim: sw=4
