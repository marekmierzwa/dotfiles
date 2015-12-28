call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate' | Plug 'marcweber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'

" Theme
" Plug 'nanotech/jellybeans.vim'
" Plug 'morhetz/gruvbox'
Plug 'jpo/vim-railscasts-theme'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'

" Syntax
Plug 'digitaltoad/vim-jade'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'digitaltoad/vim-jade'
call plug#end()

set nowrap
set noswapfile
set cursorline
set colorcolumn=80
set nowritebackup
set splitbelow
set splitright
set undodir=~/.vim/undodir
set undofile
set undolevels=1000

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'

set list                          " Display tabs and trailing spaces
set listchars=tab:»\ ,trail:·,nbsp:·


autocmd QuickFixCmdPost *grep* cwindow

if executable("ag")
  set grepprg=ag\ --vimgrep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_theme = 'zenburn'
" let g:syntastic_check_on_open = 1
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_ruby_checkers=['rubocop', 'mri']

let g:ctrlp_map = '<Leader>f'

vmap <Enter> <Plug>(EasyAlign)
nmap gs :Ag<Space>

let mapleader = ","
map <Leader> <Plug>(easymotion-prefix)

colorscheme railscasts
" set background = dark    " Setting dark mode

" nerd tree
map <silent> <leader>n :NERDTreeFind<CR>

" switch between two last open files faster
nmap <silent> <leader><leader> <c-^>      
