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
set nowritebackup
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

" coc{{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}}}

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

nnoremap <leader><enter> :FZFMru<cr>
nnoremap <leader><leader><enter> :History<cr>
nnoremap <leader><backspace> :Files<cr>
nnoremap <leader>a :exec ':Ag '.expand('<cword>')<CR>
vnoremap <leader>a "hy:exec "Ag ".escape('<C-R>h', "/\.*$^~[()")<cr>
nnoremap <leader><tab> :Buffers<cr>
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

" colorschemes{{{
Plug 'arcticicestudio/nord-vim'

let g:nord_uniform_diff_background = 1

Plug 'flazz/vim-colorschemes'
"}}}

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

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'yssl/QFEnter'
Plug 'easymotion/vim-easymotion'
Plug 'milkypostman/vim-togglelist'

" go{{{
Plug 'sebdah/vim-delve'

autocmd FileType go set ts=4
"}}}

" git{{{
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'christoomey/vim-conflicted'
"}}}

" javascript{{{
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"}}}

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
Plug 'towolf/vim-helm'
Plug 'nelsyeung/twig.vim'
Plug 'saltstack/salt-vim'

let g:terraform_fmt_on_save=1

" keysound{{{
Plug 'skywind3000/vim-keysound'
let g:keysound_py_version = 3
let g:keysound_theme = 'typewriter'
let g:keysound_volume = 1000
"}}}

" arduino{{{
Plug 'stevearc/vim-arduino'
let g:arduino_dir = '/usr/share/arduino'
let g:arduino_board = 'archlinux-arduino:avr:uno'
let g:arduino_serial_baud = 9600
let g:arduino_auto_baud = 1
let g:arduino_serial_port = '/dev/ttyACM1'

autocmd FileType arduino nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
autocmd FileType arduino nnoremap <buffer> <leader>ap :ArduinoChoosePort<CR>
autocmd FileType arduino nnoremap <buffer> <leader>ar :ArduinoChooseProgrammer<CR>
autocmd FileType arduino nnoremap <buffer> <leader>au :ArduinoUpload<CR>
autocmd FileType arduino nnoremap <buffer> <leader>as :ArduinoUploadAndSerial<CR>
autocmd FileType arduino nnoremap <buffer> <leader>av :ArduinoVerify<CR>
autocmd FileType arduino set ts=2|set sw=2|set expandtab
"}}}

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

autocmd FileType ruby,json,javascript,javascript.jsx,sh,yaml,feature set ts=2|set sw=2|set expandtab
autocmd BufNewFile,BufRead *.jinja set filetype=twig

" wrapper for shell commands
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
