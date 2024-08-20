"""""""""""""""""""
" .vimrc by u932b "
"                 "
"""""""""""""""""""

" TODO:
" 1. Refactoring: rope?
" 2. Debugging: pudb?
" 3. map more ALE commands
" 4. Folds:
" 5. use airline?
" 6. Motion scrolling? vim-smoothie?
" 7. What is NERDComment?
" 8. figure out git
" 9. figure out markdowm

"language settings
set langmenu=none
language messages en_US

" vundle settings
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'                  " Vundle Plugin Manager

"-------------------=== Code/Project navigation ===-------------
" Project and file navigation
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'                  " Class/module browser
Plugin 'Xuyuanp/nerdtree-git-plugin'        " NerdTree git functionality

"-------------------=== Sytax Checking/completion ===-------------
"Plugin 'Valloric/YouCompleteMe' " Code Completion
Plugin 'dense-analysis/ale' " Async Lint Engine
Plugin 'jiangmiao/auto-pairs'

"-------------------=== Snippets support ===--------------------
"Plugin 'SirVer/ultisnips' " Track the engine.
"Plugin 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:


"-------------------=== Other ===-------------
Plugin 'tpope/vim-fugitive'

"-------------------=== Markdown support ===-------------
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()

" vundle settings
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
"
set clipboard=unnamed " use system clipboard

" indent
set expandtab " tabs are spaces
set smarttab " set tabs for a shifttabs logic
set autoindent " indent when moving to the next line while writing code
set smartindent
set cindent
set ignorecase
set hls

" the WiLd menu
set wildmode=longest:full
set wildmenu " visual autocomplete for command menu

" tab and space
set shiftwidth=4 " shift lines by 4 spaces
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing

" backup info
set backup
set backupdir=$HOME/.vim/backup/
if exists("*mkdir") && !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup")
endif

" undo, need vim 7.3
set undofile
set undodir=$HOME/.vim/undo/
if exists("*mkdir") && !isdirectory($HOME."/.vim/undo")
   call mkdir($HOME."/.vim/undo")
endif

" set line break
set wrap
set linebreak  " Causes vim to not wrap text in the middle of a word
" set showbreak=>>\
"" these two work with nowrap
" :set sidescroll=5
" :set listchars+=precedes:`,extends:`

" Encoding
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1

" other settings
set nu
syntax on " enable syntax processing
set ruler
set mouse=a
set bs=2
set nocompatible
set showcmd
set clipboard=unnamed
set hid
set ignorecase
set smartcase
set hlsearch " highlight matches
set incsearch " search as characters are entered
set lazyredraw " redraw only when we need to.
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them

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
augroup highLightSpace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

" set status line
set laststatus=2
set statusline=%{(&paste)?'[p]':''}
set statusline+=%m%f
set statusline+=%=
set statusline+=(%{mode()})
" set statusline+=\ \
set statusline+=[%{&fenc}]
" set statusline+=\ \
set statusline+=[%{&ft!=''?&ft:'none'}]
" set statusline+=\ \
set statusline+=Col\ %c,\ Line\ %l/%L
" set statusline+=\ \
set statusline+=%p%%

" folds settings
"hi Folded ctermbg=242
" hi Folded ctermbg=235
" set foldmethod=syntax
" set foldlevelstart=20

"=====================================================
"" key mappings
"=====================================================
nnoremap ; :
vnoremap ; :
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" imap <C-D>      <DEL>
" nmap <F6>       :w<CR>:call Flake8()<CR>
" imap <C-a>      <HOME>
" imap <C-e>      <END>
" imap <C-f>      <RIGHT>
" imap <C-b>      <LEFT>
" nmap <C-D>      ddkP==
" nmap <C-U>      ddp==
nnoremap <leader>a :ALEFix<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <Leader>d :DiffLS<CR>
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>m :set nu!<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>p :set paste!<CR>
nnoremap <Leader>t :TagbarToggle<CR>


" Map the arrow keys to do absolutely nothing.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>



"=====================================================
"" custom functions
"=====================================================
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

" show diff between current unsaved version and the saved version.
function! DiffLastSave()
    :w !diff % -
endfunction
command! DiffLS exec DiffLastSave()

" Automatic Trim Whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call
            \ <SID>StripTrailingWhitespaces()

" Show syntax highlighting groups for word under cursor, from dm4 and i dont
" know how to use this yet
nmap <C-C> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Save last postion
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

"=====================================================
"" NERDTree settings
"=====================================================
"" Beautify
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40

" autocmd vimenter * NERDTree  " run it until all initialization is finished.
" let NERDTreeQuitOnOpen = 0  " don't automatically close NerdTree when you open a file:

" Automatically close the tab is the last window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" open NERDTree to current file and move cursor to main window
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"autocmd VimEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"" autocmd VimEnter * NERDTreeToggle
"autocmd VimEnter * wincmd p " move cursor to main window

""" Open NerdTree by default with no command line arguments
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open just NERDTree if vim on a directory
if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
endif

""" hotfix for https://github.com/preservim/nerdtree/issues/911
"let g:NERDTreeNodeDelimiter = "\u00a0"



" "=====================================================
" "" GUI settings
" "=====================================================
" " These are from dm4
" if has("gui_running")
"     " set colors
"     colors dm4
"     set cursorline
"     "    set guifont=Monaco:h17
"     set guifont=Source\ Code\ Pro\ Light:h16
" 
"     " window size
"     set lines=100
"     set columns=90
" 
"     " hide tool bar
"     set guioptions+=c
"     set guioptions-=e
"     set guioptions-=T
"     set guioptions-=m
"     set guioptions-=r
"     set guioptions-=R
"     set guioptions-=l
"     set guioptions-=L
" 
"     " disable input manager
"     set imdisable
"     set antialias
" 
"     if has("gui_macvim")
"         " set CMD+ENTER fullscreen
"         set fuopt=maxhorz,maxvert
"     endif
" endif


"=====================================================
"" vim-markdown settings
"=====================================================
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_math = 1

"=====================================================
"" ale settings
"=====================================================

let g:ale_linters = { "python": ["ruff", "pyright"]}
let g:ale_fixers = { "python": ["black", "isort"]}
let g:ale_python_isort_options = '-m 3 -tc'
let b:ale_fix_on_save = 1

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

""=====================================================
""" ycm settings
""=====================================================
"let g:ycm_autoclose_preview_window_after_completion=1
"
"" function! DisableYCM()
""     :let g:ycm_auto_trigger=0
"" endfunction
"" function! EnableYCM()
""     :let g:ycm_auto_trigger=1
"" endfunction
"" command! Yycm exec EnableYCM()
"" command! Nycm exec DisableYCM()
"" nnoremap <F9> :Yycm<CR>
"" nnoremap <F10> :Nycm<CR>
""
""=====================================================
""" UltiSnips settings
""=====================================================
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"
"" let g:UltiSnipsExpandTrigger="<c-j>"
"function! g:UltiSnips_Complete()
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res == 0
"    if pumvisible()
"      return "\<C-n>"
"    else
"      call UltiSnips#JumpForwards()
"      if g:ulti_jump_forwards_res == 0
"        return "\<TAB>"
"      endif
"    endif
"  endif
"  return ""
"endfunction
"
"function! g:UltiSnips_Reverse()
"  call UltiSnips#JumpBackwards()
"  if g:ulti_jump_backwards_res == 0
"    return "\<C-P>"
"  endif
"
"  return ""
"endfunction
"
"
"if !exists("g:UltiSnipsJumpForwardTrigger")
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif
"
"if !exists("g:UltiSnipsJumpBackwardTrigger")
"  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif
"" 
"" au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
"" au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
"
"=====================================================
"" autopairs settings
"=====================================================
let g:AutoPairs={'(':')', '[':']', '{':'}',"`":"`", '```':'```', '"""':'"""', "'''":"'''"}

