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
    call dein#add('joshdick/onedark.vim')

    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

syntax enable Color Scheme

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
endif

colorscheme onedark

set tabstop=4
set softtabstop=4
set expandtab

set number
set showcmd
set cursorline

filetype indent on

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


