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
nnoremap <leader>. :nohls <enter>

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
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'matze/vim-move'
Plug 'milkypostman/vim-togglelist'
Plug 'neomake/neomake'
Plug 'pbogut/fzf-mru.vim'
Plug 'phux/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ScrollColors'
" Plug 'w0rp/ale'
" golang
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
" git
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'int3/vim-extradite'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
" php
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': 'php' }
Plug 'nelsyeung/twig.vim'
Plug 'padawan-php/deoplete-padawan', {'for': 'php'}
Plug 'phux/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'phux/padawan-navigator', {'do': ':UpdateRemotePlugins'}
Plug 'phux/php-doc-modded', { 'for': 'php' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'sahibalejandro/vim-php', { 'for': 'php' }

"" plugins to check

" Plug 'amiorin/vim-project'
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'nvie/vim-flake8'
" Plug 'majutsushi/tagbar'
" Plug 'easymotion/vim-easymotion'
" Plug 'wincent/ferret'
" Plug 'tpope/vim-abolish'
" Plug 'janko-m/vim-test'

call plug#end()

if installing_vim_plug
    :PlugInstall
endif

" colorscheme evening

" gruvbox dark
set background=dark
colorscheme gruvbox

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
nnoremap <S-D> :call DeleteTrailingWS()<cr>

" next, prev buffer
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprev<cr>
nnoremap <leader><tab> :Buffers<cr>

" <tab>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"


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

let g:deoplete#sources#padawan#auto_update = 0
let g:deoplete#sources#padawan#add_parentheses = 1
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

" padawan navigator
let g:padawan_navigator#server_command='~/repos/padawan.php/bin/padawan-server'
nnoremap <leader>pp :call PadawanGetParents()<cr>
nnoremap <leader>pi :call PadawanGetImplementations()<cr>
nnoremap <leader>pc :call padawan_navigator#CloseWindow()<cr>

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
    autocmd FileType php nnoremap <Leader>u :PHPImportClass<cr>
    autocmd FileType php nnoremap <Leader>e :PHPExpandFQCNAbsolute<cr>
    autocmd FileType php nnoremap <Leader>E :PHPExpandFQCN<cr>

    au BufNewFile,BufRead,BufWinEnter *Test.php exe ":UltiSnipsAddFiletypes php.phpunit"
    au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &
    autocmd FileType php vnoremap <leader>e :call PHPExtractVariable()<cr>
    autocmd FileType php call PhpSyntaxOverride()
    autocmd FileType php nnoremap <leader>d :call UpdatePhpDocIfExists()<cr>
    autocmd FileType php nnoremap <leader>f :call PHPBreakLongLine()<cr>
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

function! PHPExtractVariable()
    let l:name = input("Name of new variable: $")
    normal! gvx
    execute "normal! i$".l:name
    execute "normal! O$".l:name." = "
    normal! pa;
endfunction

noremap <leader>rcm :call PHPMoveClass()<cr>
function! PHPMoveClass()
    :w
    let l:oldPath = expand('%')
    let l:newPath = input("New path: ", l:oldPath)
    execute "!phpactor class:move ".l:oldPath.' '.l:newPath
    execute "bd ".l:oldPath
    execute "e ". l:newPath
endfunction

noremap <leader>rd :call PHPMoveDir()<cr>
function! PHPMoveDir()
    :w
    let l:oldPath = input("old path: ", expand('%:p:h'))
    let l:newPath = input("New path: ", l:oldPath)
    execute "!phpactor class:move ".l:oldPath.' '.l:newPath
endfunction

noremap <leader>rcc :call PHPModify("complete_constructor")<cr>
noremap <leader>ri :call PHPModify("implement_contracts")<cr>
noremap <leader>ra :call PHPModify("add_missing_assignments")<cr>
function! PHPModify(transformer)
    :w
    normal! ggdG
    execute "read !phpactor class:transform ".expand('%').' --transform='.a:transformer
    normal! ggdd
    :w
    /construct
endfunction

noremap <leader>rei :call PHPExtractInterface()<cr>
function! PHPExtractInterface()
    :w
    let l:interfaceFile = substitute(expand('%'), '.php', 'Interface.php', '')
    execute "!phpactor class:inflect ".expand('%').' '.l:interfaceFile.' interface'
    execute "e ". l:interfaceFile
endfunction

" language-client
augroup lintcomplete
    autocmd! BufWritePost * Neomake
    autocmd FileType php LanguageClientStart
augroup end

nnoremap <leader>gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <leader>gr :call LanguageClient_textDocument_references()<CR>
nnoremap <leader>S :call LanguageClient_textDocument_documentSymbol()<cr>
nnoremap K :call LanguageClient_textDocument_hover()<cr>
let g:LanguageClient_selectionUI = 'fzf'

" vim-gp
let g:go_fmt_command = "goimports"

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

" vim-php-refactoring-toolbox
let g:vim_php_refactoring_use_default_mapping = 0

" extradite
nnoremap <leader>i :Extradite!<cr>
nnoremap <leader>I :Extradite<cr>

