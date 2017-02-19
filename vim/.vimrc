"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
"
" Sections:
"    -> Plugins
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> Colorscheme and GUI
"    -> Airline/Powerline
"    -> Syntastic
"    -> Neocomplete
"    -> UltiSnips
"    -> Omni completion
"    -> PHPComplete
"    -> PHP QA
"    -> Filetype rules
"    -> Fzf
"    -> NERDTree
"    -> Misc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neocomplete.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-syntastic/syntastic'
" Plug 'tomtom/tlib_vim'
" Plug 'joonty/vdebug'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'nishigori/vim-php-dictionary'
Plug 'joonty/vim-phpqa'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'stephpy/vim-yaml'
" Plug 'Raimondi/delimitMate'
" Plug 'amiorin/vim-project'
Plug 'SirVer/ultisnips'
Plug 'phux/vim-snippets'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'nvie/vim-flake8'
Plug 'Shougo/echodoc.vim'
Plug 'jacoborus/tender.vim'
Plug 'gregsexton/gitv'

set noshowmode

" Initialize plugin system
call plug#end()
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Projects
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" " before call project#rc()
" let g:project_enable_welcome = 1
" " if you want the NERDTree integration.
" let g:project_use_nerdtree = 1

" call project#rc("~/work/repos")

" File '~/work/TODO', 'Todo-List'

" Project '~/work/chef-repo', 'chef-repo'
" Project 'lesara'
" Project 'dwh'
" Project 'logistic', 'logistics'
" Project 'sourcing-tool'
" Project 'marketing-system'

" Project 'ongr/lesara-ongr', 'lesara-ongr'
" Project 'ongr/lesara-ongr-router', 'lesara-ongr-router'
" Project 'ongr/lesara-ongr-indexer', 'lesara-ongr-indexer'

" Project 'staging-scripts'

" File '~/.vimrc', 'vimrc'
" File '~/.zshrc', 'zshrc'
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files and archives
set wildignore+=*.o,*~,*.pyc,*.pyo,*.so,*.zip,*.gz,*.tar

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
" set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 'breakat' characters
set lbr

" automatic wordwrap at 79 chars
set tw=79

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>. :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make moving via <C-ArrowKey> work
map Oa <C-Up>
map Ob <C-Down>
map Oc <C-Right>
map Od <C-Left>
map! Oa <C-Up>
map! Ob <C-Down>
map! Oc <C-Right>
map! Od <C-Left>
map <C-Up> <C-W>k
map <C-Down> <C-W>j
map <C-Right> <C-W>l
map <C-Left> <C-W>h
map <leader>OA <C-W>K
map <leader>OB <C-W>J
map <leader>OC <C-W>L
map <leader>OD <C-W>H

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" next, prev, delete buffer
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" switch to buffer with <leader><number>
nnoremap <Leader>1 :buffer 1<CR>
nnoremap <Leader>2 :buffer 2<CR>
nnoremap <Leader>3 :buffer 3<CR>
nnoremap <Leader>4 :buffer 4<CR>
nnoremap <Leader>5 :buffer 5<CR>
nnoremap <Leader>6 :buffer 6<CR>
nnoremap <Leader>7 :buffer 7<CR>
nnoremap <Leader>8 :buffer 8<CR>
nnoremap <Leader>9 :buffer 9<CR>
nnoremap <Leader>0 :buffer 10<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}
set statusline+=%F " file name
set statusline+=%m%r%h%w " modified, read-only, help and preview flags
set statusline+=\ \ cwd:\ %{getcwd()} " cwd
set statusline+=%=%{fugitive#statusline()} " git wrapper status line
set statusline+=\ %y " file type
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'} " file encoding
set statusline+=\|%{&ff}] " file format
set statusline+=\ [col\ %c] " col
set statusline+=\ [line\ %l/%L\ %p%%] " current/total lines, % through file
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Tries to break long php lines correctly
function! FormatPHPLineLength()
    let l:currentLine = getline('.')
    let l:isFunctionCallOrDefinitionOrArray = l:currentLine =~ ',' || l:currentLine =~ ';' || l:currentLine =~ ' array(' || l:currentLine =~ '(['
    let l:isConditional = l:currentLine =~ '\s*&&' || l:currentLine =~ ' and ' || l:currentLine =~ '\s*||' || l:currentLine =~ ' or ' || l:currentLine =~ '\s*?'

    normal! $
    normal! ma
    if l:isConditional
        normal! F)
    elseif l:isFunctionCallOrDefinitionOrArray
        if l:currentLine =~ ';'
            normal! h
        else
            normal! Jh
        endif
    endif

    execute "normal! i\n"
    normal! mb
    normal! k

    if l:isConditional
        :s/\(\s*&&\| and \|\s*||\| or \| ?\| :\)/\r\1/g
    elseif l:isFunctionCallOrDefinitionOrArray
        execute "normal! 0f(a\n"
        if l:currentLine =~ ','
            :s/,\s/,\r/g
        endif
    endif
    'b
    normal! V
    'a
    normal! =
endfunction

" Use ranger as vim file manager
function! Ranger()
  " Get a temp file name without creating it
  let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
  " Launch ranger, passing it the temp file name
  silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
  " If the temp file has been written by ranger
  if filereadable(tmpfile)
    " Get the selected file name from the temp file
    let filetoedit = system('cat '.tmpfile)
    exec 'edit '.filetoedit
    call delete(tmpfile)
endif
  redraw!
endfunction
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme and GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
set guifont=Inconsolata\ 10

" make gvim look like vim
set guioptions+=c " console dialogs
set guioptions-=e " console tabs
set guioptions-=m " no menu bar
set guioptions-=T " no toolbar
set guioptions-=l " no left scrollbar
set guioptions-=r " no right scrollbar
set guioptions-=L " no left vsp scrollbar
set guioptions-=R " no right vsp scrollbar
set guioptions-=b " no bottom scrollbar

set background=dark

" Theme
colorscheme tender
" colorscheme badwolf
" colorscheme hybrid

" make vim transparent
" hi Normal       ctermbg=none
hi NonText      ctermbg=none
hi TabLineFill  ctermbg=none

" darker tabs
hi TabLine      ctermfg=244   ctermbg=234   cterm=none
hi TabLineSel   ctermfg=255   ctermbg=238   cterm=bold
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline/Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" set airline theme
let g:airline_theme = 'tender'
" let g:airline_theme = 'powerlineish'

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = 'ln'
let g:airline_symbols.branch = '->'
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = 'ws'
let g:airline_symbols.readonly = 'ro'
let g:airline_symbols.space = "\ua0"

" tmuxline config
let g:tmuxline_powerline_separators = 0
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = []
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Neocomplete Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 30

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['default'] = '\.,\h,\w,\b,\u,\t,\k'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

" function! s:my_cr_function()
"   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction

function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" donot showpreview
set completeopt-=preview

" Disable completion in commit messages
autocmd FileType gitcommit NeoCompleteLock

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.php = 
  \ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.ruby =
	\ '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.python =
	\ '[^. *\t]\.\w*\|\h\w*'

noremap <leader>m :NeoCompleteToggle<cr>

au BufEnter *.php :NeoCompleteBufferMakeCache
au BufNewFile,BufRead,BufWinEnter *Test.php exe ":let g:neocomplete#sources#omni#input_patterns.php = '\\h\\w*'"
au BufWinLeave,BufLeave *Test.php exe ':let g:neocomplete#sources#omni#input_patterns.php = "[^. \\t]->\\%(\\h\\w*\\)\\?\\|\\h\\w*::\\%(\\h\\w*\\)\\?"'
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
let g:ultisnips_php_scalar_types = 1
let g:UltiSnipsSnippetsDir = '~/.vim/plugged/vim-snippets/UltiSnips/'
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Enable omni completion for file types
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PHPComplete Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
let g:phpcomplete_complete_for_unknown_classes = 0
let g:phpcomplete_relax_static_constraint=1
let g:phpcomplete_search_tags_for_variables = 0
let g:phpcomplete_parse_docblock_comments = 0
let g:phpcomplete_enhance_jump_to_definition = 1
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PHP QA Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=PSR2"
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0
" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 1
" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype rules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
augroup vimrc
  au BufRead,BufNewFile *.upc set filetype=c
  au BufRead,BufNewFile *.uph set filetype=c
  au BufRead,BufNewFile Capfile,Gemfile,Vagrantfile set filetype=ruby
augroup end

" update ctags when saving php files
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" tabstop setup
autocmd FileType php,python set ts=4|set sw=4|set expandtab

" phpunit file type
au BufNewFile,BufRead *Test.php setlocal ft=php.php-phpunit

" update ctags when saving python files
au BufWritePost *.py silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" update ctags when saving ruby files
au BufWritePost *.rb silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" reload vimrc when saving it
nmap <silent> <leader><f5> :e $MYVIMRC<CR>
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup end
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fzf Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '40%' }
"
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"   * Preview script requires Ruby
"   * Install Highlight or CodeRay to enable syntax highlighting
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
" autocmd VimEnter * command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)

" Fzf key mappings
nmap <C-D>g :GFiles?<CR>
nmap <C-D>G :GFiles<CR>
nmap <C-D>c :Commits<CR>
nmap <C-D>C :BCommits<CR>
nmap <C-D>l :Lines<CR>
nmap <C-D>L :BLines<CR>
" nmap <C-D>t :Tags<CR>
" nmap <C-D>T :BTags<CR>

nmap <leader>h :History/<CR>
nmap <leader>H :History:<CR>
nmap <leader><enter> :History<CR>

nnoremap <C-A> :Ag<CR>
nnoremap <leader>a :AgE<CR>
nnoremap <C-P> :Files<CR>
nnoremap <C-S> :Buffers<CR>

" Ag mappings
nnoremap * :exec ':Ag '.expand('<cword>')<CR>
vnoremap * "hy:exec "Ag ".escape('<C-R>h', "/\.*$^~[()")<cr>
nnoremap + :exec ':Ag '.expand('<cword>')<CR>
vnoremap + "hy:exec "Ag ".escape('<C-R>h', "/\.*$^~[()")<cr>

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

autocmd VimEnter * command! -nargs=* AgE call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--exact --ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '40%'
\ })

autocmd VimEnter * command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '40%'
\ })
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" NERDTree toggle key mapping
map <c-n> :NERDTreeToggle<CR>
"
" Find current file in NERDTree
map <c-m> :NERDTreeFind<CR>
"
" unmap default NERDTreeFind binding as it is annoying
" unmap <CR>
"
" show hidden files in nerdtree
let NERDTreeShowHidden=1
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
" map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" Activate mouse
set mouse=a

" Set linebreak
set linebreak

" Show line breaking character
set showbreak=↳

" Line Numbers
set number
set numberwidth=1

set formatoptions+=l
set formatoptions-=t

" fold using markers
set foldmethod=marker

" Toggle line numbering
nmap <leader>n :set number!<CR>

" Source file in buffer
nmap <leader>s :source %<CR>

" chmod +x file in buffer
nmap <leader>X :w<CR>:silent !chmod +x "%"<CR>:redraw!<CR>

" rebuild git ctags
nmap <leader>c :silent !update-git-ctags<CR>:redraw!<CR>

" Use system clipboard Shift+Insert to insert stuff into vim
set clipboard=unnamedplus

" " save and load folds automatically
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview

" " remap vim-unimpaired [ and ] to < and >
" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]

" select pasted text
nnoremap gV `[v`]

" repeatable indent
vnoremap > >gv
vnoremap < <gv

" Refactor names easily (hit <leader>[ with cursor on the word you'd like to rename
nnoremap <Leader>[ :%s/<c-r><c-w>/<c-r><c-w>/g<left><left>

" " unmap arrow keys to force usage of hjkl
" inoremap  <Up>     <esc>:echo 'COCK'<cr>
" inoremap  <Down>   <esc>:echo 'FUCKER'<cr>
" inoremap  <Left>   <esc>:echo 'CUNT'<cr>
" inoremap  <Right>  <esc>:echo 'JIZZBAG'<cr>
" noremap   <Up>     <esc>:echo 'WINDOWS USER'<cr>
" noremap   <Down>   <esc>:echo 'FUCKTARD'<cr>
" noremap   <Left>   <esc>:echo 'DICKHEAD'<cr>
" noremap   <Right>  <esc>:echo 'MANIAC'<cr>

" faster splitting and moving between windows
" map <Tab> <C-W>w
map \| <C-W>v<C-W><Right>
map _ <C-W>s<C-W><Down>
map <leader>x <C-W>c

" format long php lines
nmap <leader>i :call FormatPHPLineLength()<cr>

" open ranger file manager
nmap <leader>r :call Ranger()<cr>
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 0
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Flake8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"{{{
let g:flake8_show_in_file=1
let g:flake8_show_in_gutter=1

autocmd BufWritePost *.py call Flake8()
"}}}

" vim: set ts=2 sw=2 et:
