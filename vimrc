"Basic Settings
"
filetype plugin indent on "파일 형식 읽기 허용
syntax on 
set nocompatible "Vim 디폴트 기능들을 사용함
set nu "커서의 위치를 항상 보이게 함

set autoindent "자동 들여쓰기
set sm "자동 들여쓰기
set cindent "C언어 자동 들여쓰기

set tabstop=2 "간격
set softtabstop=2 ">> 또는 << 키로 들여 쓰기 할때 스페이스 갯수
set shiftwidth=2 "자동 들여쓰기 간격
set expandtab "Tab을 Space로 확장

autocmd FileType make setlocal noexpandtab "make 파일에선 Tab 사용

autocmd FileType python set tabstop=4 "python 간격
autocmd FileType python set softtabstop=4 "python >> 또는 << 키로 들여 쓰기 할때 스페이스 갯수
autocmd FileType python set shiftwidth=4 "python 자동 들여쓰기 간격

set number "줄번호
set title "타이틀바에 현재 편집중인 파일을 표시
set ruler "상태표시줄에 커서 위치 보여줌

set hlsearch "검색어 하이라이팅
set incsearch "점진적으로 찾기
set ignorecase "검색시 검색어의 대소문자 무시
set nowrapscan "검색시 파일 끝에서 되돌려 검색하지 않음

set laststatus=2 "상태바 표시 항상 
set encoding=utf-8

set hidden "히스토리 저장
set eol

" higlight column right after max textwidth
set colorcolumn=120

" Vundle
"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'pboettch/vim-cmake-syntax'
" Plugin 'Valloric/YouCompleteMe'
"
call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

"Colorscheme
"
"colorscheme jellybeans
colorscheme seoul256

" Key Mapping
" 
nmap <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F4> :nohlsearch<CR>

nnoremap <C-h> <C-w>h<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>

nnoremap <C-a> :bd<Enter>
nnoremap <C-e> :enew<Enter>         
nnoremap bp :bprevious!<Enter>    " 이전 버퍼로 이동
nnoremap bn :bnext!<Enter>        " 다음 버퍼로 이동
nnoremap <C-F4> :bp <BAR> bd #<Enter> " 현재 버퍼를 닫고 이전 버퍼로 이동

let mapleader=","

map <leader>q <ESC><ESC>:q<CR>
map <F2> <ESC><ESC>:w<CR>

nnoremap <C-o> i<CR><Esc>

" ctags
"
set tags=./tags,tags
set tags+=/home/darby/ros2_ws/src/tags
set tags+=/home/darby/nav2_ws/src/tags
set tags+=/home/darby/robotis_ws/src/tags

let g:easytags_async=1
let g:easytags_include_members = 1
let g:easytags_dynamic_files = 1

" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0

" vim-multi-cursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_quit_key='<Esc>'

" indentLine
let g:indentLine_color_term = 100

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
\ }

" bookmarks
let g:bookmark_sign = '♥'
" Brief Help
" mm : Bookmark Toggle
" mn : Bookmark Next
" mp : Bookmark Prev
" mc : Bookmark Clear

" nerdcommenter
let NERDSpaceDelims=1

" airline
let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

" rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
