"***************************
" Victor Fu
"***************************

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" === Themes ===
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/molokai'
Plug 'flazz/vim-colorschemes'

" === Syntax ===
Plug 'HerringtonDarkholme/yats.vim'          " TypeScript
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'mustache/vim-mustache-handlebars'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'keith/swift.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" === UI ===
Plug 'nathanaelkane/vim-indent-guides'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" === Editing ===
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
Plug 'editorconfig/editorconfig-vim'
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'

" === Git ===
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" === LSP & Completion ===
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" === Lint & Format ===
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

" =============================================================================
" General Settings
" =============================================================================

filetype plugin indent on
syntax on

set history=200
set autoread
augroup autoReadCheck
  autocmd!
  " autoread only fires on certain events in a terminal; check on focus/buffer switch
  autocmd FocusGained,BufEnter * silent! checktime
augroup END

" :W saves the file with sudo (for files opened without permission)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
set hidden                    " allow unsaved buffers in background
set backspace=indent,eol,start
set whichwrap+=<,>,b,s,h,l,[,]
set mouse=a
set ttyfast
set scrolloff=7
set number
set showmode
set ruler
set showmatch

" Clipboard
set clipboard^=unnamed,unnamedplus

" Disable bells
set noerrorbells novisualbell
set t_vb=
set tm=500

" No backup / swap
set nobackup
set noswapfile

" Persistent undo
if !isdirectory(expand('~/.vim/undodir'))
  call mkdir(expand('~/.vim/undodir'), 'p', 0700)
endif
set undofile
set undodir=~/.vim/undodir

" Faster CursorHold & sign column
set updatetime=300
set signcolumn=yes

" =============================================================================
" Search
" =============================================================================

set incsearch
set hlsearch
set ignorecase
set smartcase

" Clear search highlight
nnoremap <silent> <leader><CR> :nohlsearch<CR>

" In visual mode, * / # search for the current selection
function! s:VisualSearch() abort
  let l:saved = @"
  normal! gvy
  let @/ = '\V' . substitute(escape(@", '\/'), '\n', '\\n', 'g')
  let @" = l:saved
endfunction
xnoremap <silent> * :<C-u>call <SID>VisualSearch()<CR>/<C-r>=@/<CR><CR>
xnoremap <silent> # :<C-u>call <SID>VisualSearch()<CR>?<C-r>=@/<CR><CR>

" =============================================================================
" Indentation & Formatting
" =============================================================================

set autoindent
set smartindent
set copyindent
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set ffs=unix,dos,mac

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" =============================================================================
" Wildmenu
" =============================================================================

set wildchar=<TAB>
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.class,*.pyc,*/tmp/*,*/node_modules/*,*/.git/*

" =============================================================================
" Appearance
" =============================================================================

set background=dark
set t_Co=256

" Colorscheme with fallback
try
  colorscheme wombat256mod
catch /^Vim\%((\a\+)\)\=:E185/
  silent! colorscheme molokai
endtry

" Highlight current line in active window only
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Statusline
set laststatus=2

" Show tabs and trailing spaces
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set list

" =============================================================================
" Encoding
" =============================================================================

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

" =============================================================================
" Folding
" =============================================================================

set foldmethod=indent
set foldlevelstart=99
set nofoldenable

" =============================================================================
" Tabs & Navigation
" =============================================================================

nnoremap <S-H> gT
nnoremap <S-L> gt
nnoremap <C-t><C-t> :tabnew<CR>
nnoremap <C-t><C-w> :tabclose<CR>
" <leader>-prefixed so they don't shadow `v` (visual mode) and `te` (till-e motion)
nnoremap <leader>vs :vsplit<Space>
" :tabedit starting in the current file's directory
nnoremap <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<CR>/

" Move between splits with Ctrl+h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" =============================================================================
" Spell Check
" =============================================================================

let g:myLangList = ["nospell", "en_gb"]

function! ToggleSpell()
  let b:myLang = get(b:, 'myLang', 0) + 1
  if b:myLang >= len(g:myLangList) | let b:myLang = 0 | endif
  if b:myLang == 0
    setlocal nospell
  else
    execute "setlocal spell spelllang=" . get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction
nmap <silent> <F7> :call ToggleSpell()<CR>

" =============================================================================
" Cursor Shape (tmux-aware)
" =============================================================================

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" =============================================================================
" Restore Cursor Position
" =============================================================================

set viminfo='10,"100,:20,%,n~/.viminfo

function! ResCur()
  " Commit messages / rebase todos should always start at the top
  if &filetype =~# '^\(gitcommit\|gitrebase\)$'
    return
  endif
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" =============================================================================
" Filetype Associations
" =============================================================================

augroup filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.gradle   set filetype=groovy
  autocmd BufRead,BufNewFile *.fdoc     set filetype=yaml
  autocmd BufRead,BufNewFile *.md       set filetype=markdown | set spell
  autocmd FileType Makefile             set noexpandtab
  autocmd FileType coffee,typescript,typescriptreact,javascript,javascriptreact,json,yaml,jade
    \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
  autocmd FileType python
    \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
  autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript,javascriptreact setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType typescript,typescriptreact setlocal omnifunc=typescriptcomplete#CompleteTS
  au FileType htmldjango      set ft=html.htmldjango
  au FileType scss            set ft=scss.css
  au FileType less            set ft=less.css
augroup END

augroup vimrcMisc
  autocmd!
  " Auto-rebalance splits on resize
  autocmd VimResized * wincmd =
  " Auto-reload vimrc on save (matches both ~/.vimrc and ~/.vim/vimrc)
  autocmd BufWritePost .vimrc,vimrc ++nested source $MYVIMRC
augroup END

" =============================================================================
" Plugin: vim-closetag
" =============================================================================

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.handlebars,*.js,*.jsx,*.tsx"

" =============================================================================
" Plugin: vim-prettier
" =============================================================================

let g:prettier#config#print_width = 100
let g:prettier#autoformat = 0             " plugin's own pragma-based autoformat off; the autocmd below formats on save
let g:prettier#exec_cmd_async = 1
" Format on save. Synchronous so the formatted text is what gets written
" (PrettierAsync finishes after the write and leaves the buffer modified).
" Set g:prettier_on_save = 0 to turn it off.
let g:prettier_on_save = get(g:, 'prettier_on_save', 1)
augroup prettierOnSave
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html
    \ if g:prettier_on_save && exists(':Prettier') == 2 | execute 'Prettier' | endif
augroup END

" =============================================================================
" Plugin: ALE
" =============================================================================

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'python':     ['flake8'],
  \ }
let g:ale_fixers = {
  \ '*':          ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'python':     ['black'],
  \ }
let g:ale_fix_on_save = 0   " set to 1 if you want auto-fix on save
let g:ale_sign_error   = '✖'
let g:ale_sign_warning = '⚠'
nmap <silent> <leader>a <Plug>(ale_next_wrap)

" =============================================================================
" Plugin: vim-airline
" =============================================================================

set timeout timeoutlen=1000 ttimeoutlen=50
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:airline_left_sep  = '▶'
let g:airline_right_sep = '◀'
let g:airline#extensions#tabline#enabled     = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod    = ':t'
let g:airline#extensions#tmuxline#enabled    = 0

" =============================================================================
" Plugin: NERDTree
" =============================================================================

augroup nerdtreeAuto
  autocmd!
  " Open NERDTree only if no files specified
  autocmd VimEnter * if !argc() | NERDTree | endif
  " Close vim if NERDTree is the only window
  autocmd BufEnter * if winnr("$") == 1
    \ && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif
augroup END

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>s :NERDTreeFind<CR>
let NERDTreeShowHidden = 1

" =============================================================================
" Plugin: fzf
" =============================================================================

nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<CR>
nnoremap <leader>b :Buffers<CR>

" Quickfix navigation (e.g. :Rg results sent to quickfix)
nnoremap <leader>cc :botright copen<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>

" =============================================================================
" Plugin: vim-cpp-enhanced-highlight
" =============================================================================

let g:cpp_class_scope_highlight      = 1
let g:cpp_member_variable_highlight  = 1
let g:cpp_class_decl_highlight       = 1

" =============================================================================
" Plugin: vim-jsx / vim-javascript
" =============================================================================

let g:jsx_ext_required = 0    " allow JSX in .js files

" =============================================================================
" Plugin: vim-lsp
" =============================================================================

let g:lsp_diagnostics_enabled = 0          " use ALE for diagnostics instead
let g:lsp_document_code_action_signs_enabled = 0

nmap gd <plug>(lsp-definition)
nmap gr <plug>(lsp-references)
nmap gi <plug>(lsp-implementation)
nmap K <plug>(lsp-hover)
nmap <leader>rn <plug>(lsp-rename)

" =============================================================================
" Plugin: asyncomplete
" =============================================================================

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c
