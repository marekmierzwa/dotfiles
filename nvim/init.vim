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
Plug 'maximbaz/lightline-ale'

" Git
Plug 'tpope/vim-fugitive'

" Utils
" Plug 'scrooloose/nerdtree'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'javascriptreact', 'typescriptreact', 'typescript', 'css', 'less', 'scss',
  \ 'json', 'graphql', 'markdown', 'yaml', 'html'] }

Plug 'kylef/apiblueprint.vim'

" Nvim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

"Ale config"
let b:ale_fixers = {'javascript': ['prettier', 'eslint'], 'css': ['prettier', 'eslint'] }
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
})

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
    "markdown",
    "lua"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF

" vim settings

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
set fillchars=eob:\               " remove ~ sign on empty line


set list                          " Display tabs and trailing spaces
set listchars=tab:»\ ,trail:·,nbsp:·
set nospell
" lightline handles it
set noshowmode

autocmd QuickFixCmdPost *grep* cwindow

" let g:jsx_ext_required = 0

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

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" nerd tree
" nmap <silent> <leader>n :NERDTreeFind<CR>
nmap <silent> <leader>n :NvimTreeFindFile<CR>


" switch between two last open files faster
nmap <silent> <leader><leader> <c-^>
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" nvim
set scrolloff=15    " Number of lines above/below cursor while scrolling
set signcolumn=number  " Shows column with errors icons
set numberwidth=4

nnoremap <esc><esc> :noh<return>
