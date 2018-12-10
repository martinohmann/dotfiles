" disable compat mode
if &compatible
    set nocompatible
endif

set encoding=utf-8
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything

" Don't fail, ask
set confirm

" enable mouse
set mouse=a

" use system clipboard
set clipboard=unnamedplus

" search and substitute
set gdefault " use global flag by default in s: commands
set hlsearch " highlight searches
set ignorecase
set smartcase " don't ignore capitals in searches

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nojoinspaces

" show line breaking character
set showbreak=↳

" buffers and split
set hidden " allow background buffers without saving
set splitbelow
set splitright

" set 10 lines to the cursor - when moving vertically using j/k
set so=10

set number
" relative line numbers
set relativenumber

" sets how many lines of history vim has to remember
set history=700

" disable file backups
set nobackup
set nowb
set noswapfile

" persistent undo
set undofile             " Save undo's after file closes
set undodir=~/.nvim-undo " where to save undo histories
set undolevels=1000      " How many undos
set undoreload=10000

" ctags
set tags+=tags
set tags+=.git/tags
set tags+=.tags
set tags+=../tags
"
" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c

" enable filetype plugins
filetype plugin on
filetype indent on

let installing_vim_plug = 0

" autoinstall vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    let installing_vim_plug = 1
endif

call plug#begin('~/.config/nvim/plugged')
" multi purpose
Plug 'ap/vim-buftabline'
Plug 'arcticicestudio/nord-vim'
Plug 'flazz/vim-colorschemes'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-colorscheme-switcher'
Plug 'lilydjwg/colorizer'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'milkypostman/vim-togglelist'
Plug 'neomake/neomake'
Plug 'pbogut/fzf-mru.vim'
Plug 'phux/vim-snippets'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-go'
Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'sheerun/vim-polyglot'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'simeji/winresizer'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'yssl/QFEnter'
" Plug 'w0rp/ale'
" golang
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'
Plug 'jodosha/vim-godebug'
" Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
" git
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'int3/vim-extradite'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
" php
" requires phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
" Plug 'roxma/ncm-phpactor'
Plug 'phpactor/ncm2-phpactor'
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': 'php' }
Plug 'nelsyeung/twig.vim'
" Plug 'padawan-php/deoplete-padawan', {'for': 'php'}
" Plug 'phux/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" Plug 'phux/padawan-navigator', {'do': ':UpdateRemotePlugins'}
Plug 'phux/php-doc-modded', { 'for': 'php' }
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"
" Plug 'roxma/nvim-completion-manager'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"" plugins to check

" Plug 'amiorin/vim-project'
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'nvie/vim-flake8'
" Plug 'majutsushi/tagbar'
" Plug 'easymotion/vim-easymotion'
" Plug 'wincent/ferret'
" Plug 'tpope/vim-abolish'
" Plug 'janko-m/vim-test'
"
Plug 'saltstack/salt-vim'

call plug#end()

if installing_vim_plug
    :PlugInstall
endif

let g:nord_uniform_diff_background = 1

" gruvbox dark
set background=dark
" colorscheme gruvbox
" colorscheme evening
colorscheme nord

hi Normal ctermbg=none

let g:colorizer_maxlines = 1000

" mappings
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Edit the vimrc file
nnoremap <silent> <leader><f5> :e $MYVIMRC<CR>

" fast save
nnoremap <silent> <leader>w :w!<CR>
nnoremap <silent> <leader>x :bdelete<CR>

" remap 0 to first non-blank char
noremap 0 ^

" clear highlighting
nnoremap <silent> <leader>. :nohl<CR><C-l>

augroup pre_post_hooks
    au!
    au BufWritePost $MYVIMRC nested source $MYVIMRC

    " return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
augroup END

" disable arrow keys to force usage of hjkl
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" navigate between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split
noremap <Bar> <C-W>v<C-W><Right>
noremap _ <C-W>s<C-W><Down>

" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" repeatable indent
vnoremap > >gv
vnoremap < <gv

" select pasted text
nnoremap gV `[v`]

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
nnoremap <C-M> :call DeleteTrailingWS()<cr>

" next, prev buffer
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprev<cr>
nnoremap <leader><tab> :Buffers<cr>

" <tab>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

autocmd FileType ruby,json,javascript,javascript.jsx,sh,yaml,feature set ts=2|set sw=2|set expandtab

" wrapper for shell commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

"" plugins


" nerdtree
noremap <c-n> :NERDTreeToggle<CR>

" Find current file in NERDTree
noremap <leader>n :NERDTreeFind<CR>

" show hidden files in nerdtree
let NERDTreeShowHidden = 1

" fzf
nnoremap <leader><enter> :FZFMru<cr>
nnoremap <leader><leader><enter> :History<cr>
nnoremap <leader><backspace> :Files<cr>

nnoremap <leader>a :exec ':Ag '.expand('<cword>')<CR>
vnoremap <leader>a "hy:exec "Ag ".escape('<C-R>h', "/\.*$^~[()")<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#syntax#min_keyword_length = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
" let g:deoplete#disable_auto_complete = 1
let g:deoplete#auto_refresh_delay = 100
" let g:deoplete#tag#cache_limit_size = 50000000
let g:deoplete#enable_auto_delimiter = 0
let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#max_list = 10
let g:deoplete#auto_complete_delay = 100

" let g:deoplete#sources#padawan#auto_update = 0
" let g:deoplete#sources#padawan#add_parentheses = 1
" needed for echodoc to work if add_parentheses is 1
let g:deoplete#skip_chars = ['$']

set completeopt-=preview

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['ultisnips', 'buffer']
let g:deoplete#sources.php = ['padawan', 'ultisnips', 'buffer']
let g:deoplete#sources.go = ['go', 'ultisnips', 'buffer']
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'

command! -bang PadawanGenerate call deoplete#sources#padawan#Generate(<bang>0)
command! -bang PadawanRestart call deoplete#sources#padawan#RestartServer()

let g:deoplete#sources#padawan#server_command='~/repos/padawan.php/bin/padawan-server'

" " padawan navigator
let g:padawan_navigator#server_command='~/repos/padawan.php/bin/padawan-server'
" nnoremap <leader>pp :call PadawanGetParents()<cr>
" nnoremap <leader>pi :call PadawanGetImplementations()<cr>
" nnoremap <leader>pc :call padawan_navigator#CloseWindow()<cr>

" ncm
let g:cm_sources_override = {
    \ 'cm-tags': {'enable':0}
    \ }

call neomake#configure#automake('w')

" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = '<c-h>'

" ultisnips
let g:ultisnips_php_scalar_types = 1
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips/'
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

" tabular
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t<Bar> :Tabularize /\|<CR>
vnoremap <Leader>t<Bar> :Tabularize /\|<CR>

" vim-php
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  " hi! def link phpDocParam phpType
endfunction

augroup vimphp
    autocmd!
    au BufNewFile,BufRead,BufWinEnter *Test.php exe ":UltiSnipsAddFiletypes php.phpunit"
    au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
    autocmd FileType php call PhpSyntaxOverride()
    autocmd FileType php nnoremap <leader>d :call UpdatePhpDocIfExists()<cr>
    autocmd FileType php nnoremap <leader>f :call PHPBreakLongLine()<cr>
    autocmd FileType php set ts=4|set sw=4|set expandtab
    " autocmd FileType php nnoremap <c-s> :update<cr>:Silent php-cs-fixer fix %:p > /dev/null 2>&1<cr>:e<cr>
    autocmd FileType php setlocal omnifunc=phpactor#Complete

    " Include use statement
    autocmd FileType php nnoremap <Leader>u :call phpactor#UseAdd()<CR>
    " Expand FQCN
    autocmd FileType php nnoremap <Leader>e :call phpactor#ClassExpand()<CR>
    " Invoke the context menu
    autocmd FileType php nnoremap <Leader>cm :call phpactor#ContextMenu()<CR>
    " Invoke the navigation menu
    autocmd FileType php nnoremap <Leader>nn :call phpactor#Navigate()<CR>
    " Goto definition of class or class member under the cursor
    autocmd FileType php nnoremap <Leader>gd :call phpactor#GotoDefinition()<CR>
    " Find references to class or class member under the cursor
    autocmd FileType php nnoremap <Leader>gr :call phpactor#FindReferences()<CR>
    " Transform the classes in the current file
    autocmd FileType php nnoremap <Leader>tt :call phpactor#Transform()<CR>
    " Extract expression (normal mode)
    autocmd FileType php nnoremap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
    " Extract expression from selection
    autocmd FileType php vnoremap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
    " Extract method from selection
    autocmd FileType php vnoremap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
    " Copy class
    autocmd FileType php nnoremap <Leader>rcc :call phpactor#CopyFile()<CR>
    " Move class
    autocmd FileType php nnoremap <Leader>rcm :call phpactor#MoveFile()<CR>
    " Move dir
    autocmd FileType php nnoremap <leader>rdm :call PHPMoveDir()<CR>
augroup end

" php-doc-modded
function! UpdatePhpDocIfExists()
    normal! k
    if getline('.') =~ '/'
        normal! V%d
    else
        normal! j
    endif
    call PhpDocSingle()
    normal! k^%k$
    if getline('.') =~ ';'
        exe "normal! $svoid"
    endif
endfunction

" tries to break long php lines correctly
function! PHPBreakLongLine()
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

" phpactor
function! PHPMoveDir()
    :w
    let l:oldPath = input("old path: ", expand('%:p:h'))
    let l:newPath = input("New path: ", l:oldPath)
    execute "!phpactor class:move ".l:oldPath.' '.l:newPath
endfunction

" language-client
augroup lintcomplete
    autocmd! BufWritePost * Neomake
    " autocmd FileType php LanguageClientStart
augroup end

" nnoremap <leader>gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <leader>gr :call LanguageClient_textDocument_references()<CR>
" nnoremap <leader>S :call LanguageClient_textDocument_documentSymbol()<cr>
" nnoremap K :call LanguageClient_textDocument_hover()<cr>
let g:LanguageClient_selectionUI = 'fzf'

" vim-gp
let g:go_fmt_command = "goimports"
let g:go_info_mode = 'gocode'

" pdv
let g:pdv_cfg_Uses = 0
let g:pdv_cfg_autoEndFunction = 0
let g:pdv_cfg_autoEndClass = 0
let g:pdv_cfg_annotation_Package = 0
let g:pdv_cfg_annotation_Version = 0
let g:pdv_cfg_annotation_Author = 0
let g:pdv_cfg_annotation_Copyright = 0
let g:pdv_cfg_php4always = 0
let g:pdv_cfg_annotation_License = 0
let g:pdv_cfg_InsertFuncName = 0
let g:pdv_cfg_InsertVarName = 0

" ale
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_php_phpmd_ruleset = 'cleancode,codesize,design,unusedcode'

" neomake

let g:neomake_php_phpcs_args_standard='PSR2'

let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
  " \   '--enable-gc',
  " \   '--concurrency=8',
  " \   '--enable=deadcode',
  " \   '--enable=dupl',
  " \   '--enable=errcheck',
  " \   '--disable=goconst',
  " \   '--enable=gocyclo',
  " \   '--enable=gotype',
  " \   '--enable=ineffassign',
  " \   '--enable=interfacer',
  " \   '--enable=maligned',
  " \   '--enable=megacheck',
  " \   '--enable=misspell',
  " \   '--enable=staticcheck',
  " \   '--enable=structcheck',
  " \   '--enable=unconvert',
  " \   '--enable=varcheck',
  " \   '--enable=vet',
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--disable-all',
  \   '--enable-gc',
  \   '--fast',
  \   '%:p:h',
  \ ],
  \ 'cwd': '%:h',
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
\ }

" vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0

" extradite
nnoremap <leader>i :Extradite!<cr>
nnoremap <leader>I :Extradite<cr>

" statusline
set statusline=
" " set statusline+=%#PmenuSel#
" set statusline+=%#LineNr#
" set statusline+=\ %f
" set statusline+=%m
" set statusline+=%=
" set statusline+=\ %y

" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" " set statusline+=\[%{&fileformat}\]
" set statusline+=%10(%l:%c%)\ 
" " set statusline+=\ %l:%c
" " set statusline+=\ %p%%
" set statusline+=%{StatuslineGit()}
" set statusline+=\ 

" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

au BufNewFile,BufRead *.jinja set filetype=twig
"
" convert url to markdown link
" usage: just paste the raw url, :call UrlToMarkdownLink()<cr>
function! UrlToMarkdownLink()
    normal! diW
    normal! i[]()
    " paste url twice
    normal! PBpT/
    " keep last part of url
    normal! dT[
    " titelize last part of url if abolish installed
    if exists('g:loaded_abolish')
        normal! crt
    endif
    " check for trailing slashes
    normal! f]h
    let l:lastChar = getline('.')[col('.')-1]
    if l:lastChar ==# '/'
        normal! x
    endif

endfunction

nnoremap gu :call UrlToMarkdownLink()<cr>

" set to 1, then nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0
