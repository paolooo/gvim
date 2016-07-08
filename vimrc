scriptencoding utf-6
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"Forget compatibility with Vi. Who cares.
set nocompatible

execute pathogen#infect()
call pathogen#helptags()

"Enable filetypes
filetype plugin indent on
syntax on

"Write the old file out when switching between files.  set autowrite 
"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
" set mapleader = ,
:let mapleader = ","

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"Set font type and size. Depends on the resolution. Larger screens, prefer h15
set guifont=Monaco:h11

"Tab stuff
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Scroll bind
set noscrollbind

" File Specific Settings
" ------------------------------------------------------------

au FileType php,xml,*.twig,json,yaml set tabstop=4|set shiftwidth=4|set softtabstop=4
au FileType js set tabstop=2|set shiftwidth=2|set softtabstop=2


"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
"set relativenumber"

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=8

"Better line wrapping 
set wrap
set textwidth=12
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide
set mouse=a " allow mouse"


"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

" Create dictionary for custom expansions
set dictionary+=~/.vim/dict.txt

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow

"Session settings
" set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,Helpeful

" wrapping off
set nowrap

" don't auto-insert linebreaks
set tw=0

" Don't continue comments onto new line
au Bufread, BufNewFile * set fo=cqt

" store vim lock files in a centralized directory
set backupdir=/tmp
set directory=/tmp
set ttyscroll=0

" show whitespace chars
set listchars=tab:»\ ,trail:·,extends:>,precedes:<
set list

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"Load the current buffer in Firefox - Mac specific.
abbrev ff :! open -a firefox.app %:p<cr>

"Map a change directory to the desktop - Mac specific
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>
nmap <leader>app :tabedit www/js/app.js<cr>
nmap <leader>ep :tabedit ~/.vim/bundle/vim-snippets/snippets/php.snippets<cr>
nmap <leader>vla :tabedit vendor/laravel/framework/src/Illuminate<cr>

"Change zen coding plugin expansion key to shift + e
" let g:user_zen_expandabbr_key = '<C-e>'

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
"autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
"
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"------------------------"
"NERDTREd PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"autopen NERDTree and focus cursor in new document
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
iab met public function() {<CR>}<ESC>kf(i

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

"--------------------------"
" PERSONAL SETTINGS 
" -------------------------"
"Example for adding abbreviations - triggered by the spacebar.
iabbrev mysite ftp://jeff-way.com@jeffrey-way.com/domains/

"Shortcut for logging into my server
nmap <leader>server :Nread ftp://jeff-way.com@jeffrey-way.com/domains/<cr>

"Shortcut directly to my theme files on server
nmap <leader>theme :Nread ftp://jeff-way.com@jeffrey-way.com/domains/jeffrey-way.com/html/wp-content/themes/magazineJW/<cr>

"For autocompletion of Snipmate plugin
"let g:acp_behaviorSnipmateLength = 1

"Peep open
if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  map <c-o> <Plug>PeepOpen
endif

"-- tabs like Firefox
"---- ctrl+t new tab
"nnoremap <C-t> :tabnew<CR> " conflicts with ctags

"-- FuzzyFinder
nnoremap <C-t> :<C-u>FufFile **/<cr>
nnoremap <C-b> :<C-u>FufBuffer<cr>
"---- ctrl+tab next tab
nmap <C-Tab> :tabn<CR>
imap <C-Tab> <Esc><C-Tab>i
"---- ctrl+shift+tab previous tab
nmap <C-S-Tab> :tabp<CR>
imap <C-S-Tab> <Esc><C-S-Tab>i
"---- ctrl+w close tab or window
"nmap <C-w> :confirm :q<CR>
"imap <C-w> <Esc><C-w>
"---- ctrl+q close tab or window
nmap <C-q> :confirm :q<CR>
nmap <S-q> <C-S-q>
imap <C-q> <Esc><C-q>

"-- editing like Eclipse
"---- ctrl+alt+up duplicate block up
imap <C-M-Up> <Esc>yy<Up>pi
nmap <C-M-Up> yy<Up>p
vmap <C-M-Up> yPV'[']
"---- ctrl+alt+down duplicate block down
imap <C-M-Down> <Esc>yypi
vmap <C-M-Down> y'>pV'[']
nmap <C-M-Down> yyp
"---- alt+up move block up
nmap <M-Up> :m-2<CR>
imap <M-Up> <Esc>:m-2<CR>gi
vmap <M-Up> :m-2<CR>gv
nmap [1;3A :m-2<CR>
imap [1;3A <Esc>:m-2<CR>gi
vmap [1;3A :m-2<CR>gv
"---- alt+down move block down
nmap <M-Down> :m+<CR>
imap <M-Down> <Esc>:m+<CR>gi
vmap <M-Down> :m'>+<CR>gv
nmap [1;3B :m+<CR>
imap [1;3B <Esc>:m+<CR>gi
vmap [1;3B :m'>+<CR>gv
"---- ctrl+d delete a line (without yanking)
nmap <C-d> "_dd
imap <C-d> <Esc><C-d>i
"---- ctrl+s save current file
nmap <C-s> :confirm :w<CR>
imap <C-s> <Esc><C-s>
vmap <C-s> <Esc><C-s>

"-- editing like Notepad2
"---- alt+z chop one char from front of block
nmap <silent> <M-z> :let _s=@/<Bar>:s/^.//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <silent> <M-z> :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/^.//e<Bar>:let @/=_s<Bar>:nohl<CR>gv
imap <M-z> <Esc><M-z>i
"---- alt+u chop one char from back of block
nmap <silent> <M-u> :let _s=@/<Bar>:s/.$//e<Bar>:let @/=_s<Bar>:nohl<CR>
vmap <silent> <M-u> :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/.$//e<Bar>:let @/=_s<Bar>:nohl<CR>gv
"nmap <silent> <M-u> :let _s=@/<Bar>:s/.$//e<Bar>:let @/=_s<Bar>:nohl<CR>
imap <M-u> <Esc><M-u>i

"-- visual mode hacks
"---- tab indent block
vmap <Tab> >gv
nmap <Tab> >>
" shift-tab unindent block
vmap <S-Tab> <gv
nmap <S-Tab> <<
""---- period comment block
"nmap <silent> . :let _s=@/<Bar>:s/^/# /e<Bar>:let @/=_s<Bar>:nohl<CR>
"vmap <silent> . :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/^/# /e<Bar>:let @/=_s<Bar>:nohl<CR>gv
""---- comma uncomment block
"nmap <silent> , :let _s=@/<Bar>:s/# //e<Bar>:let @/=_s<Bar>:nohl<CR>
"vmap <silent> , :<Backspace><Backspace><Backspace><Backspace><Backspace>let _s=@/<Bar>:'<,'>s/# //e<Bar>:let @/=_s<Bar>:nohl<CR>gv
"---- shift+up/down begins visual line mode
nmap <S-Up> kV
imap <S-Up> <Esc><S-Up>
vmap <S-Up> <Up>
nmap <S-Down> V
imap <S-Down> <Esc><S-Down>
vmap <S-Down> <Down>
map <C-S-Home> v<Home>gg
imap <C-S-Home> <Esc><C-S-Home>
map <C-S-End> v<End>G
imap <C-S-End> <Esc>l<C-S-End>
"---- shift+left/right/home/end begins visual mode
nmap <S-Left> v
imap <S-Left> <Esc>v
vmap <S-Left> h
nmap <S-Right> vl
imap <S-Right> <Esc>l<S-Right>
vmap <S-Right> l
map <S-Home> v<Home>
imap <S-Home> <Esc><S-Home>
map <S-End> v<End>
imap <S-End> <Esc>l<S-End>
"--- ctrl+a select all
map <C-a> ggVG
"--- ctrl+left or ctrl+right move word
map <C-Right> e
map <C-Left> b


"-- completely custom key mappings
nmap o o<Esc>
nmap <S-o> <S-o><Esc>
"---- Up to increment a number selected in visual mode
vnoremap <C-S-Up> <Esc><C-a>gv
"---- Down to decrement a number selected in visual mode
vnoremap <C-S-Down> <Esc><C-x>gv
"---- ctrl+z undo
nmap <C-z> u
imap <C-z> <Esc>ui
vmap <C-z> <Esc>u
"---- ctrl+y redo
nmap <C-y> <C-r>
imap <C-y> <Esc><C-r>i
vmap <C-y> <Esc><C-r>
"---- ctrl+f find
map <C-f> <Esc>/
"map <C-f> <Esc>:promptfind<CR>
"---- ctrl+h regex find/replace
map <C-h> <Esc>:%s!!!g<Left><Left><Left>
"map <C-h> <Esc>:promptrepl<CR>
"---- f3 find next
"map <F3> <Esc>/<CR>
map <F3> <Esc>:Ack 
"---- alt+d delete whitespace multi-line
map <M-d> <Esc>i<Right><Space><Esc>d/\S<CR>:noh<CR>i<Space><Esc>

" easy block selection with alt+click/drag mouse
noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>

" vim plugins
"-- NERDTree
" map <silent> <C-b> :NERDTreeFind<CR>
"let g:NERDTreeKeepTree = 1

"-- Run last command
nmap <C-F9> :<Up><CR>

"-- Ctrl+W, Ctrl+O to toggle maximize/minimize of current window
nnoremap <C-W>O :call MaximizeToggle ()<CR>
nnoremap <C-W>o :call MaximizeToggle ()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle ()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction


"Load the current buffer in Chrome
nmap <leader>ch :!open -a Google\ Chrome<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

" Create split below
nmap :sp :rightbelow sp<cr>

" Run PHPUnit tests
map <leader>pt :!clear && phpunit %<cr>
map <leader>pp :!clear && phpunit<cr>
map <leader>pu :!clear && phpunit --stderr --testsuite unittest<cr>

" Run Behat
map <leader>pb :!clear && vendor/bin/behat<cr>
map <leader>ps :!clear && vendor/bin/behat --append-snippets<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = '>>'
" let g:airline#extensions#tabline#left_alt_sep = '>'

" Indent Guidelines
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2A2A2A ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#111111 ctermbg=4
nmap :ig <Plug>IndentGuidesToggle
nmap :ie <Plug>IndentGuidesEnable
nmap :id <Plug>IndentGuidesDisable

" tagbar
nmap <F8> :TagbarToggle<CR>

" resize window
" http://vim.wikia.com/wiki/VimTip427
" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>

function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
endfunction
autocmd VimEnter * call AirlineInit()

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap <leader>todo :e todo.txt<cr>

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }

    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap <leader>lf :call FacadeLookup()<cr>

" CtrlP Stuff

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')

    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';'
    else
        exec 'normal i<?php'
    endif

    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['

    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['

    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g'
endfunction
nmap ,2  :call AddDependency()<cr>

" Paolo
set t_Co=256

if has("gui_running")
  "Set the color scheme. Change this to your preference. 
  "Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
  colorscheme darkspectrum
else
  colorscheme desert
endif

"Shortcut for editing  vimrc file in a new tab
nmap <leader>es :tabedit ~/.vim/bundle/vim-snippets/snippets/php.snippets<cr>

" para iterm2

" syntastic - for error checker
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" ctags tips and tricks
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" plantuml
let g:plantuml_executable_script='java -jar ~/Workspace/bin/plantuml.jar'
