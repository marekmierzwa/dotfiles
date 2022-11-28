syntax on
call plug#begin()

" Search in files
Plug 'rking/ag.vim' 

" Syntax check
Plug 'dense-analysis/ale'

" fuzzy search
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Comments
Plug 'tpope/vim-commentary'

" Theme
Plug 'overcache/NeoSolarized'
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'

" Utils
Plug 'scrooloose/nerdtree'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }

Plug 'kylef/apiblueprint.vim'

" Nvim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"Ale config"
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 0

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "json",
    "html",
    "scss",
    "ruby",
    "graphql",
    "python",
    "markdown"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF

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

autocmd QuickFixCmdPost *grep* cwindow

let g:jsx_ext_required = 0

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#parser = 'babel'
let g:prettier#config#print_width = 110
let g:prettier#config#trailing_comma = "none"
let g:prettier#config#tabWidth = 2
let g:prettier#config#useTabs = 'false'
let g:prettier#config#quote_props = 'consistent'

let mapleader = ","

" ensure that editorconfig works with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" fzf settings
nmap <Leader>f :GFiles<CR>

" open at last line
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

vmap <Enter> <Plug>(EasyAlign)

map <Leader> <Plug>(easymotion-prefix)

set termguicolors
set background=dark
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" colorscheme solarized
colorscheme NeoSolarized

let g:lightline = { 'colorscheme': 'solarized' }

" nerd tree
nmap <silent> <leader>n :NERDTreeFind<CR>

" switch between two last open files faster
nmap <silent> <leader><leader> <c-^>
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" nvim
set scrolloff=15    " Number of lines above/below cursor while scrolling
set signcolumn=number  " Shows column with errors icons
set numberwidth=4

nnoremap <esc><esc> :noh<return>
