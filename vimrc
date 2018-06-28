"""""""""""""""""
" .vimrc by dm4 "
"               "
"""""""""""""""""

"language settings
set langmenu=none
language messages en_US

" vundle settings
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" bundles
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'


" Bundle 'msanders/snipmate.vim'
" Bundle 'tpope/vim-surround'
" Bundle 'sjl/gundo.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'AutoComplPop'
" Bundle 'nvie/vim-flake8'
" Bundle 'tpope/vim-fugitive'
" Bundle 'jiangmiao/auto-pairs'
Bundle 'Townk/vim-autoclose'
" Bundle 'klen/python-mode'

" Markdown support
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'

" Syntax Check
Bundle 'scrooloose/syntastic'

set clipboard^=unnamed

" vundle settings
filetype indent plugin on

" indent
set expandtab
set smarttab
set autoindent
set smartindent
set cindent
set ignorecase
set hls

" the WiLd menu
set wildmode=longest:full
set wildmenu

" tab and space
set shiftwidth=4
set tabstop=4
set softtabstop=4

" backup info
set backup
set backupdir=$HOME/.vim/backup/
if exists("*mkdir") && !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup")
endif

" function and alias to quick toggle number
function! NoNum()
         :set nornu
         :set nonu
endfunction

function! YesNum()
         :set rnu
         :set nu
endfunction

command! Nonu exec NoNum()
command! Nu exec YesNum()

" undo, need vim 7.3
" set undofile
" set undodir=$HOME/.vim/undo/
" if exists("*mkdir") && !isdirectory($HOME."/.vim/undo")
"    call mkdir($HOME."/.vim/undo")
" endif
set clipboard=unnamed

" set line break
set wrap
set linebreak
set showbreak=>>\
"" these two work with nowrap
" :set sidescroll=5
" :set listchars+=precedes:`,extends:`

" VIM 7.4
" set relativenumber
"set number

" other settings
set nu
syntax on
set ruler
set mouse=a
set bs=2
set nocompatible
set showcmd
set clipboard=unnamed
set hid
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

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" invisible character
set nolist
"set listchars=tab:▸\ ,trail:▝,eol:¬

" mininum split window size
set winminheight=0
set winminwidth=0

" auto reload vimrc
autocmd! BufWritePost *vimrc source %

" set filetype
autocmd BufReadPost,BufNewFile *.tt set filetype=html
autocmd BufReadPost,BufNewFile httpd*.conf set filetype=apache

" set indent
"autocmd BufReadPost,BufNewFile *.rb set sw=2 ts=2 softtabstop=2
"autocmd BufReadPost,BufNewFile *.html set sw=2 ts=2 softtabstop=2

" Show diff when git commit
autocmd FileType gitcommit DiffGitCached

" Save last postion
if has("autocmd")
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif
endif

" key mapping
" let mapleader=","
" nmap ; :
" vmap ; :
" nmap j gj
" nmap k gk
" vmap j gj
" vmap k gk
" imap <C-D>      <DEL>
" nmap <F6>       :w<CR>:call Flake8()<CR>
nmap <Leader>m  :set nu!<CR>
" imap <C-a>      <HOME>
" imap <C-e>      <END>
" imap <C-f>      <RIGHT>
" imap <C-b>      <LEFT>
" nmap <C-D>      ddkP==
" nmap <C-U>      ddp==

nnoremap <Leader>n  :NERDTreeToggle<CR>

" nmap <Leader>g  :GundoToggle<CR>
" nmap <Leader>b  :e ++enc=big5<CR>
" nmap <Leader>u  :e ++enc=utf-8<CR>
nmap <Leader>p  :set paste!<CR>
" nmap <Leader>r  :set wrap!<CR>
" nmap <Leader>ev :tabnew $MYVIMRC<CR>
nmap <Leader>h  :noh<CR>
nmap <Leader>s  :w<CR>:source %<CR>
" nmap <Leader>l  :set list!<CR>

" " for fakeclip
" vmap <Leader>v  "+y
"
" " ctrl-tab only works on gui
" nmap <C-Tab>    gt
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Show syntax highlighting groups for word under cursor
nmap <C-C> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Encoding
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" color setting
if $TERM == "xterm-256color" || $TERM == "screen-256color"
    " set 256 colors
    set t_Co=256
    colors dm4
    set cursorline
elseif $TERM == "xterm"
    set t_Co=16
endif

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Automatic Trim Whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call
            \ <SID>StripTrailingWhitespaces()

" set status line
set laststatus=2
set statusline=%{(&paste)?'[p]':''}
set statusline+=%m%f
set statusline+=%=
set statusline+=(%{mode()})
set statusline+=\ \
set statusline+=[%{&fenc}]
set statusline+=\ \
set statusline+=[%{&ft!=''?&ft:'none'}]
set statusline+=\ \
set statusline+=Col\ %c,\ Line\ %l/%L
set statusline+=\ \
set statusline+=%p%%

" " remove preview window from omni complete
" set completeopt-=preview
"
" " NERDTree
"" Beautify
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeHighlightCursorline = 1

"" run it until all initialization is finished.
" autocmd vimenter * NERDTree
"" don't automatically close NerdTree when you open a file:
let NERDTreeQuitOnOpen = 0 
"" close nerdTree when :q
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" open NERDTree to current file and move cursor to main window
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
autocmd VimEnter * if &modifiable | NERDTreeFind | wincmd p | endif
autocmd VimEnter * NERDTreeToggle
"" move cursor to main window
" autocmd VimEnter * wincmd p
"" Open NerdTree by default with no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



"
" " vimim
" let g:vimim_cloud = -1
" let g:vimim_custom_color = -1

" zencoding
let g:user_zen_settings = {
\  'indentation' : '    '
\}

" " clang_complete
" let g:clang_snippets = 1
" let g:clang_complete_copen = 0
" let g:clang_snippets_engine = 'snipmate'

if has("gui_running")
    " set colors
    colors dm4
    set cursorline
"    set guifont=Monaco:h17
    set guifont=Source\ Code\ Pro\ Light:h16

    " window size
    set lines=100
    set columns=90

    " hide tool bar
    set guioptions+=c
    set guioptions-=e
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L

    " disable input manager
    set imdisable
    set antialias

    if has("gui_macvim")
        " set CMD+ENTER fullscreen
        set fuopt=maxhorz,maxvert
    endif
endif

" if exists('+colorcolumn')
"       highlight ColorColumn ctermbg=91
"       set colorcolumn=80
"   else
"         au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"     endif
" :au BufWinEnter * let w:m1=matchadd('Search', '\%<80v.\%>77v', -1)
" :au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"ignore E501 when dooing flake8 tests
" let g:flake8_ignore="E501"
" autocmd BufWritePost *.py call Flake8()

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
" modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"hi Folded ctermbg=242
hi Folded ctermbg=235
set foldmethod=syntax
set foldlevelstart=20


" Don't autofold code
let g:pymode_folding = 0

let g:loaded_syntastic_python_python_checker = 1
" let g:syntastic_python_checkers = ['flake8 --ignore=E501']
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_checker = 'flake8 --ignore=E501'
let g:synstatic_cpp_checkers= ['clang_check']
let g:syntastic_cpp_compiler = 'clang++'
if !exists('g:synstatic_cpp_compiler_options')
    let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:flake8_ignore="E501,W293,E231"
