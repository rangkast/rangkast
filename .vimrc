set number
set fileformats=unix
set encoding=utf-8
"set noexpandtab
" expandtab : 탭 대신 스페이스
set expandtab 
" tabstop : 탭을 4칸으로
set tabstop=4
"set shiftwidth=8
" shiftwidth : 자동 들여쓰기 4칸
set shiftwidth=4
set sts=4
set autoindent
set cindent
set background=dark
colorscheme koehler
set number
set ruler
syntax on
filetype plugin indent on
set helplang=ko
set smartindent
set history=1000
set incsearch
set hlsearch
set showmatch
" Display commands in the bottomg right corner as they are typed
set showcmd
set ttyfast
set lazyredraw


" ==============================
" " cscope
" " ==============================
set cst
set csto=0
if filereadable("./GTAGS")
set csprg=gtags-cscope
cscope add ./GTAGS
elseif filereadable("./cscope.out")
cscope add ./cscope.out
endif

"set csprg=/usr/bin/cscope
"set csto=0
"set cst
set nocsverb
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
endif
set csverb
set ru " 커서의 위치를 항상 보이게
set sol " 여러가지 이동 동작 시 줄의 시작으로 자동이동함

set sm " 새로 추가된 괄호의 짝을 보여주는 기능
set ignorecase "찾기에서 대/소문자 구별하지 않음
set title "타이틀바에 현재 편집중인 파일 표시
set wmnu "Tab 자동완성 시 가능한 목록을 보여줌

"show cursorline
""highlight CursorLine cterm=none ctermbg=black ctermfg=none
highlight CursorLine cterm=bold ctermbg=none ctermfg=none
set cursorline



"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" My Bundle
Plugin 'fugitive.vim'
Plugin 'Mark'
Plugin 'unite.vim'
Plugin 'gtags.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'The-NERD-tree'
Plugin 'SrcExpl'
"Plugin 'davidhalter/jedi-vim'
call vundle#end() " required

"Tlist Setting
autocmd VimEnter * Tlist "Auto open
"nmap <F7> :TlistToggle<CR>
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_Inc_Winwidth = 1
"let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick=1
"let Tlist_Use_Right_Window = 1

"NERDTree Settings
"autocmd VimEnter * NERDTree "Auto open
autocmd StdinReadPre * let s:std_in=1 "Auto open if no files were specified.
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "Auto open if no files were specified.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"let loaded_nerd_tree = 1
let NERDTreeMapOpenSplit='h'
let NERDTreeMapJumpNextSibling = '<C-9>'
let NERDTreeMapJumpPrevSibling = '<C-0>'
let NERDChristmasTree = 1 "Decorated
let NERDTreeHighlightCursorline = 1
let NERDTreeChDirMode = 2 "Change Directory and change Tree root
"let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks = 1
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 30
let NERDTreeMouseMode = 2 "Directory click, file double click

"Source Explorer Setting
let g:SrcExpl_winHeight = 12
let g:SrcExpl_refreshTime = 50
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_"
    \ ]
let g:SrcExpl_searchLocalDef = 1
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey = "<F12>"
"let g:SrcExpl_prevDefKey = "<F3>"
"let g:SrcExpl_nextDefKey = "<F4>"

"let g:jedi#force_py_version = auto
"let g:jedi#show_call_signatures=0       " 자세히 설명하는 창을 보여준다 1=활성화, 0=비>활성화
"let g:jedi#popup_select_first="0"       " 자동완성시 자동팝업 등장 x
"let g:jedi#force_py_version=3           " 자동완성 3 = python3 , 2 = python2



" ==============================
" autocmd
" ==============================
if has("autocmd")
autocmd FileType c,cpp,h    set cindent
endif


"nmap <F2> :tabclose<CR>

nmap <F1> :set nu<CR>
nmap <F2> :set nonu<CR>
nmap <F3> :set mouse=a<CR>
nmap <F4> :set mouse=c<CR>
nmap <F5> :vsplit<CR>
nmap <F6> :split<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :SrcExplToggle<CR>
nmap <F9> :tabnew<CR>:Tlist<CR>:NERDTree<CR>

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l


" coding style - Linux Kernel
let g:loaded_linuxsty=1
syn keyword cOperator likely unlikely
syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
highlight default link LinuxError ErrorMsg
if has("autocmd")
autocmd FileType c,cpp,h        match LinuxError        " \+\t"         " spaces before tab
autocmd FileType c,cpp,h        match LinuxError        "\s\+$"         " trailing whitespaces
autocmd FileType c,cpp,h        match LinuxError        /\%81v.\+/      " virtual column 81 and more
endif


