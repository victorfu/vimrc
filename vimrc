"***************************
" Victor Fu
"***************************

" Install Vundle automatically
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

"-----------------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'

" Theme foor vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/molokai'
Plugin 'flazz/vim-colorschemes'

" Display indention
Plugin 'nathanaelkane/vim-indent-guides'

" Code static check
Plugin 'scrooloose/syntastic'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'kien/ctrlp.vim'

" Insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'

" Default snippets
Plugin 'honza/vim-snippets'

" Great file system explorer
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/nerdcommenter'

" Improve javascript syntax higlighting, needed for good folding and good-looking javascript code
Plugin 'jelera/vim-javascript-syntax'

"Improved json syntax highlighting
Plugin 'elzr/vim-json'

" Syntax highlighting for .jsx (js files for react js)
Plugin 'mxw/vim-jsx'

" Syntax highlighting for typescript
Plugin 'leafgarland/typescript-vim'

"Add Support css3 property
Plugin 'hail2u/vim-css3-syntax'

" Syntax highlighting for mustache & handlebars
Plugin 'mustache/vim-mustache-handlebars'

"Syntax highlighting for Stylus
Plugin 'wavded/vim-stylus'

" Add support for taltoad/vim-jadeumarkdown
Plugin 'tpope/vim-markdown'

" Highlights the matching HTML tag when the cursor is positioned on a tag.
Plugin 'gregsexton/MatchTag'

" Automatically add closing tags in html-like formats
Plugin 'alvan/vim-closetag'"

" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
Plugin 'othree/html5.vim'

" Auto format tool
Plugin 'Chiel92/vim-autoformat'

" Lang specific syntax
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'jaxbot/syntastic-react'
Plugin 'justinj/vim-react-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'moll/vim-node'
Plugin 'othree/es.next.syntax.vim'
Plugin 'toyamarinyon/vim-swift'
Plugin 'klen/python-mode'
Plugin 'hynek/vim-python-pep8-indent'

" Plugin 'othree/yajs.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'skammer/vim-css-color'
" Plugin 'pangloss/vim-javascript'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required, enable filetype-specific indenting and plugins
"-----------------------------------------------------------------------------------------

" Install plugins automatically
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
    :qall
endif

" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode

"
" Settings
"

" store 100 lines of history
set history=100
" display the current mode
set showmode
" always show current position
set ruler
" set scroll offset to 7 lines above/below cursor
set scrolloff=7
" auto read when file is changed from outsidu
set autoread
" display line numbers
set number
" yank to the system register (*) by default
set clipboard=unnamedplus
" hide abandon buffers in order to not lose undo history
set hid
" cursor shows matching ) and }
set showmatch
" incremental search
set incsearch
" ignore case when searching
set ignorecase
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" start wild expansion in the command line using <TAB>
set wildchar=<TAB>
" wild char completion menu
set wildmenu
set mouse=a
set ttyfast

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc,*/tmp/*

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,b,s,h,l,[,]

" disable annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" formatting
set autoindent
set smartindent
" copy the previous indentation on autoindenting
set copyindent
" insert tabs on line start according to context
set smarttab
" replace <TAB> with spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set ffs=unix,dos,mac

" colors
syntax on
" highlight search results
set hlsearch
set background=dark
set t_Co=256
set term=screen-256color

if has("gui_running")
  colorscheme moria
else
  colorscheme wombat256mod
endif

" no *~ backup files
set nobackup

" statusline
set laststatus=2

" encoding
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
  set encoding=utf-8
  set termencoding=big5
endfun

fun! UTF8()
  set encoding=utf-8
  set termencoding=big5
  set fileencoding=utf-8
  set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
  set encoding=big5
  set fileencoding=big5
endfun

" enable function folding
let javaScript_fold=1
" set foldmethod=indent
set foldlevelstart=99
set nofoldenable

" tab and space
set lcs=tab:>-,trail:-
set list

" set leader to ,
let mapleader=","
let g:mapleader=","

" move around tabs
map <S-H> gT                     " go to prev tab
map <S-L> gt                     " go to next tab
map <C-t><C-t> :tabnew<CR>       " new tab
map <C-t><C-w> :tabclose<CR>     " close tab
map vs :vsplit

" spell check
let b:myLang=0
let g:myLangList=["nospell","en_gb"]
function! ToggleSpell()
    let b:myLang=b:myLang+1
    if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
    if b:myLang==0
        setlocal nospell
    else
        execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    endif
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction
nmap <silent> <F7> :call ToggleSpell()<CR>])"

" change cursor shape for insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" vimtp#80 restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" highlight current line in the current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

autocmd BufRead,BufNewFile *.gradle set filetype=groovy
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" auto reload vimrc when editing it
autocmd! BufWritePost .vimrc source ~/.vimrc

" filetype settings
autocmd FileType Makefile set noexpandtab
autocmd FileType coffee,javascript,json,yaml,jade setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType typescript setlocal omnifunc=typescriptcomlete#CompleteTS
au FileType htmldjango set ft=html.htmldjango
au FileType scss set ft=scss.css
au FileType less set ft=less.css


"""
" Plugins
"""

" Enable for files with this extensions
let g:closetag_filenames = "*.handlebars,*.html,*.xhtml,*.phtml"

" autoformat
noremap <F3> :Autoformat<CR>

" vim-jsx
" allow JSX in normal JS files
let g:jsx_ext_required = 0

" syntastic
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_ignore_files = ['\.py$']
let g:syntastic_python_checkers = ['flake8']

" python-mode
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_checkers = ['python', 'pyflakes', 'pep8']

" syntastic-react
let g:syntastic_javascript_checkers = ['eslint']

" vim-airline
set timeout timeoutlen=1000 ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tmuxline#enabled = 0
" uncomment lines below to define straight tab separators
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" toggle nerdtree drawer
nnoremap <leader>d :NERDTreeToggle<CR>
" open nerdtree to the current file
nnoremap <leader>s :NERDTreeFind<CR>
"let NERDTreeMapOpenInTab='\r'

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<F3>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe
" map <C-j> :YcmCompleter GoToDefinition<CR>
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_max_files = 500
let g:ctrlp_working_path_mode = 'c'
