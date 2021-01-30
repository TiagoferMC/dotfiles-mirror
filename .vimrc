if &compatible
    set nocompatible               " Be iMproved
endif

set runtimepath+=/home/tiagofer/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/tiagofer/.vim/bundles')
    call dein#begin('/home/tiagofer/.vim/bundles')

    " Let dein manage dein
    call dein#add('/home/tiagofer/.vim/bundles/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')

    " Add or remove your plugins here like this:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#add('sonph/onehalf', {'rtp': 'vim'})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
filetype indent on

syntax enable
"syntax enable Color Scheme
syntax on

if dein#check_install()
    call dein#install()
endif

if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
    if(exists('+termguicolors'))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[38;2;%lu;%lu;%lum"
        set termguicolors
    endif
endif

colorscheme onehalfdark

set tabstop=4
set softtabstop=4
set expandtab

set t_Co=256
set number
set showcmd
set cursorline

set wildmenu
set lazyredraw
set showmatch

set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10
nnoremap <space> za
set foldmethod=indent

nnoremap j gj
nnoremap k gk

"let g:airline_theme='onehalfdark'
