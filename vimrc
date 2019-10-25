call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate' | Plug 'marcweber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'

" fuzzy search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Comments
Plug 'tpope/vim-commentary'

" Theme
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'


" Utils
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'

" Syntax
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

set nowrap
set noswapfile
set cursorline
set colorcolumn=110
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
set nospell
" lightline handles it
set noshowmode

set termguicolors

autocmd QuickFixCmdPost *grep* cwindow

let g:syntastic_check_on_open = 0
let g:jsx_ext_required = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['']
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_javascript_checkers = ['eslint', 'jsxlint']
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#parser = 'babel'
let g:prettier#config#print_width = 110
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#tabWidth = 2
let g:prettier#config#useTabs = 'false'

let mapleader = ","

" ensure that editorconfig works with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" fzf settings
nmap <Leader>f :GFiles<CR>

" open at last line
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

vmap <Enter> <Plug>(EasyAlign)

map <Leader> <Plug>(easymotion-prefix)

set background=dark
colorscheme solarized8

let g:lightline = {
      \'colorscheme': 'solarized',
      \ }


" nerd tree
nmap <silent> <leader>n :NERDTreeFind<CR>

" switch between two last open files faster
nmap <silent> <leader><leader> <c-^>
