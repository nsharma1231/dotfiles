set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

call plug#begin('~/.vim/plugged')

Plug 'valloric/YouCompleteMe'
Plug 'rhysd/vim-grammarous'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mcmartelle/vim-monokai-bold'
Plug 'pseewald/vim-anyfold'
Plug 'preservim/nerdcommenter'
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'gregsexton/matchtag'
Plug 'ap/vim-css-color'

call plug#end()

set spelllang=en
set spellfile=$HOME/Dropbox/vim/spell/en.utf-8.add

colorscheme monokai-bold

"Switch between different windows by their direction`
no <C-j> <C-w>j| "switching to below window
no <C-k> <C-w>k| "switching to above window
no <C-l> <C-w>l| "switching to right window
no <C-h> <C-w>h| "switching to left window

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

let NERDTreeMapActivateNode='<right>'
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"autocmd vimenter * NERDTree

map <C-n> :NERDTreeToggle<CR>
map gt :GitGutterToggle<CR>
map <C-c> :set<space>syntax=c<CR>
map <tab> V>
map <S-tab> V<
map :W<CR> :w<CR>
map <C-a> ggVG
map :kq<CR> <C-k>:q<CR>
map <leader><space> :source<space>~/.vimrc<CR>
map ff :Autoformat<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

set splitright
set splitbelow

set mouse=a

filetype plugin indent on " required
syntax on                 " required

autocmd Filetype * AnyFoldActivate               " activate for all filetypes

let g:airline_theme='base16_snazzy'
let g:rainbow_active = 1
