" disable compat mode
if &compatible
    set nocompatible
endif

set noshowmode
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

" folding
set foldmethod=marker

" enable filetype plugins
filetype plugin on
filetype indent on

" mappings
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

let installing_vim_plug = 0

" autoinstall vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!

    let installing_vim_plug = 1
endif
command! PU PlugUpdate | PlugUpgrade
call plug#begin('~/.config/nvim/plugged')

" lightline{{{
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }
"}}}

" tmux{{{
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
"}}}

" fzf{{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
"}}}

" nerdtree{{{
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }

" toggle NERDTree
noremap <c-n> :NERDTreeToggle<CR>

" Find current file in NERDTree
noremap <leader>n :NERDTreeFind<CR>

" show hidden files in NERDTree
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
"}}}

" echodoc{{{
Plug 'Shougo/echodoc.vim'

let g:echodoc#enable_at_startup = 1
" let g:echodoc#enable_force_overwrite = 1
let g:echodoc#highlight_arguments = 'Number'
"}}}

Plug 'simeji/winresizer'
Plug 'ap/vim-buftabline'

" nord-vim{{{
Plug 'arcticicestudio/nord-vim'

let g:nord_uniform_diff_background = 1
"}}}

Plug 'flazz/vim-colorschemes'

" tagbar{{{
Plug 'majutsushi/tagbar'

nnoremap <Leader>T :TagbarToggle<CR>
"}}}

" colorizer{{{
Plug 'lilydjwg/colorizer'

let g:colorizer_maxlines = 1000
"}}}

" tabular{{{
Plug 'godlygeek/tabular'

nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t<Bar> :Tabularize /\|<CR>
vnoremap <Leader>t<Bar> :Tabularize /\|<CR>
"}}}

" auto-pairs{{{{{{
Plug 'jiangmiao/auto-pairs'

let g:AutoPairsFlyMode = 0
let g:AutoPairsMapSpace = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = '<c-h>'
"}}}}}}

Plug 'milkypostman/vim-togglelist'

" ultisnips{{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:ultisnips_php_scalar_types = 1
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips/'
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit='vertical'
"}}}

" ncm2{{{
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" set completeopt-=preview
au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
au User Ncm2PopupClose set completeopt=menuone

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-jedi'

let g:ncm2_go#gocode_path = $GOPATH.'/bin/gocode-gomod'

Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }
"}}}

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'yssl/QFEnter'
Plug 'easymotion/vim-easymotion'

" vim-go{{{
Plug 'fatih/vim-go'

let g:go_fmt_command = "goimports"
let g:go_info_mode = 'gocode-gomod'

autocmd FileType go set ts=4
"}}}

Plug 'godoctor/godoctor.vim'
Plug 'sebdah/vim-delve'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'christoomey/vim-conflicted'

Plug 'phpactor/phpactor' ,  { 'do': 'composer install', 'for': 'php' }
Plug 'phpactor/ncm2-phpactor', { 'for': 'php' }
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }
Plug 'phux/php-doc-modded', { 'for': 'php' }

" vim-php-refactoring-toolbox{{{
Plug 'adoy/vim-php-refactoring-toolbox', { 'for': 'php' }

let g:vim_php_refactoring_use_default_mapping = 0
"}}}

" vim-php{{{
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

function! PHPMoveDir()
    :w
    let l:oldPath = input("old path: ", expand('%:p:h'))
    let l:newPath = input("New path: ", l:oldPath)
    execute "!phpactor class:move ".l:oldPath.' '.l:newPath
endfunction
"}}}

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" markdown{{{
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app & yarn install' }
Plug 'plasticboy/vim-markdown'

" set to 1, then nvim will auto close current preview window when change from
" markdown buffer to another buffer, default: 1
let g:mkdp_auto_close = 0

let g:vim_markdown_folding_disabled = 1

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

autocmd FileType markdown nnoremap gu :call UrlToMarkdownLink()<cr>
"}}}

Plug 'nelsyeung/twig.vim'
Plug 'saltstack/salt-vim'

" neomake{{{
Plug 'neomake/neomake'

augroup lintcomplete
    autocmd! BufWritePost * Neomake
augroup end

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
"}}}

Plug 'davidhalter/jedi-vim'
Plug 'rodjek/vim-puppet'
Plug 'hashivim/vim-terraform'

let g:terraform_fmt_on_save=1

call plug#end()

if installing_vim_plug
    :PlugInstall
endif

" neomake
call neomake#configure#automake('w')

" colorscheme
set background=dark
colorscheme nord
" colorscheme gruvbox
" colorscheme evening
" hi Normal ctermbg=none

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
nnoremap gy `[v`]y

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
nnoremap <C-M> :call DeleteTrailingWS()<cr>

" next, prev buffer
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprev<cr>

" <tab>: completion.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" fzf
nnoremap <leader><enter> :FZFMru<cr>
nnoremap <leader><leader><enter> :History<cr>
nnoremap <leader><backspace> :Files<cr>
nnoremap <leader>a :exec ':Ag '.expand('<cword>')<CR>
vnoremap <leader>a "hy:exec "Ag ".escape('<C-R>h', "/\.*$^~[()")<cr>
nnoremap <leader><tab> :Buffers<cr>

autocmd FileType ruby,json,javascript,javascript.jsx,sh,yaml,feature set ts=2|set sw=2|set expandtab
autocmd BufNewFile,BufRead *.jinja set filetype=twig

" wrapper for shell commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
