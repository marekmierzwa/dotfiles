"==========================================================
"
" Psyho's .vimrc
"
" heavily inspired by Peepcode screencast, Sickill 
" and Derek Wyatt
"
"==========================================================

"----------------------------------------------------------
" VUNDLE
"----------------------------------------------------------

set guifont=Osaka-Mono:h17  " Font family and font size. "

set nocompatible                  " Must come first because it changes other options.
filetype off                      " required by Vundle

" setup Vundle
set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"----------------------------------------------------------
" PLUGINS
"----------------------------------------------------------

" ack - use ack to search through files
Bundle 'rking/ag.vim'

" javascript indentation in vim sucks
Bundle 'Better-Javascript-Indentation'

" CSS
Bundle 'Better-CSS-Syntax-for-Vim'

" Fuzzy file searching
Bundle 'wincent/Command-T'

" NerdCommenter - comment blocks of code
Bundle 'The-NERD-Commenter'

" NerdTree - displays a neat file explorer window
Bundle 'scrooloose/nerdtree'

" csapprox - make gvim colorschemes work in console
Bundle 'CSApprox'

" Cofeescript support
Bundle 'vim-coffee-script'

" Coffeescript
Bundle 'vim-coffee-script'

" cucumber support
Bundle 'tpope/vim-cucumber'

" greplace.vim - plugin that allows search and replace across all of the project files
Bundle 'greplace.vim'

" jslint .js files automatically
Bundle 'jslint.vim'

" syntastic - plugin for displaying syntax errors
Bundle 'Syntastic'

" vim-endwise - wisely add 'end' in ruby
Bundle 'endwise.vim'

" vim-fugitive - vim-git integration
Bundle 'fugitive.vim'

" vim-git - a couple more basic commands to work with git
Bundle 'tpope/vim-git'

" vim-bundler to include gems from Gemfile.lock in ctags
Bundle 'tpope/vim-bundler'

" vim-markdown - syntax highlighting for markdown
Bundle 'Markdown'

" vim-matchit - better pair matching for the % command
Bundle 'matchit.zip'

" vim-rake - :Rake, :A, :R like in rails.vim, but without rails
Bundle 'tpope/vim-rake'

" vim-rails - awesome vim-rails integration
Bundle 'tpope/vim-rails'

" vim-repeat - repeat stuff done in vim-surround
Bundle 'tpope/vim-repeat'

" haml
Bundle "tpope/vim-haml"

" vim-ruby - ruby integration
Bundle 'ruby.vim'

" vim-ruby-refactoring - automatic refactorings for ruby
Bundle 'ecomba/vim-ruby-refactoring'

" A nice color scheme
Bundle 'Solarized'

" Light table inspired color scheme
" Bundle 'chmllr/vim-colorscheme-elrodeo'

" cuztomizable tab completion, continued is the newer version
Bundle 'SuperTab-continued.'

" vim-surround - surrounding text with braces, quotes, html tags...
Bundle 'tpope/vim-surround'

" Snipmate - the new version
Bundle "git://github.com/MarcWeber/vim-addon-mw-utils.git"
Bundle "git://github.com/tomtom/tlib_vim.git"
Bundle "git://github.com/vim-scripts/snipmate-snippets.git"

Bundle "git://github.com/garbas/vim-snipmate.git"

" vim-textobj - dependency of rubyblock
Bundle 'textobj-user'

" vim-textobj-rubyblock - allow selecting blocks in ruby as text objects
Bundle 'textobj-rubyblock'

" zencoding-vim - plugin for expanding css-like syntax to html
Bundle 'ZenCoding.vim'

" LESS CSS syntax support
Bundle "vim-less"

" automatically close parens
Bundle 'Townk/vim-autoclose'

"----------------------------------------------------------

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set encoding=utf-8                " Default encoding

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight the current line

set history=1000                  " remember more commands and search history
set undolevels=1000               " use many muchos levels of undo

set virtualedit=block             " allow the cursor to go into invalid places only in visual block mode

" Display tabs and trailing spaces
set list
set listchars=tab:»\ ,trail:·,nbsp:·

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set splitbelow splitright         " Splitting behavior

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set shiftround                    " use multiple of shiftwidth when indenting with '<' and '>'
set laststatus=2                  " Show the status line all the time

set confirm                       " confirm on quit, etc.
set autoread                      " automatically read changes from disk

set diffopt+=iwhite               " ignore whitespace in vimdiff

" Folding settings
set foldmethod=indent             " indent based on syntax
set foldnestmax=3                 " deepest fold is 3 levels
set foldlevel=3
set nofoldenable                  " don't fold by default

set matchpairs+=<:>               " add < and > to the chars that can be navigated with %

set spell                         " enable spell check
set spelllang=en_us               " default spell check language

set shell=/bin/bash

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" change the mapleader from \ to ,
let mapleader=","

" j and k will navigate correctly in the wrapped lines
nnoremap j gj
nnoremap k gk

" map .md files fo markdown
au BufNewFile,BufRead *.md set filetype=markdown

" HAMLC support "
au BufRead,BufNewFile *.hamlc set ft=haml

" automatically strip trailing whitespace for some file types
autocmd FileType c,cpp,java,php,javascript,html,ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Easy window navigation
map <C-h> <C-w>h:wa<cr>
map <C-j> <C-w>j:wa<cr>
map <C-k> <C-w>k:wa<cr>
map <C-l> <C-w>l:wa<cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['eruby']

" nerd tree
map <silent> <leader>n :NERDTreeFind<CR>

" zencoding-vim
let g:user_zen_expandabbr_key = '<c-e>' 
let g:use_zen_complete_tag = 1

" command-t
let g:CommandTMaxFiles = 100000

" spell-checking related shortcuts
nmap <silent> <leader>lp :set spelllang=pl_pl<CR>
nmap <silent> <leader>le :set spelllang=en_us<CR>

" ignore gems bundled in the project directory
set wildignore+=vendor/gems,vendor/bundle

" ignore target directory in clojure projects
set wildignore+=target

" ignore _deploy and output in nanoc sites
set wildignore+=_deploy,output

" some Git mappings
nmap <silent> <leader>gt :Gstatus<cr>
nmap <silent> <leader>gl :Git pull --rebase<cr>
nmap <silent> <leader>gp :Git push<cr>
nmap <silent> <leader>gs :Git stash<cr>
nmap <silent> <leader>gsp :Git stash pop<cr>

" Don't indent midje facts
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', 'fact']

map <leader>tsj :CommandTFlush<cr>\|:CommandT spec/javascripts<cr>
map <leader>tj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
map <leader>tg :topleft 100 :split Gemfile<cr>
map <leader>tt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>s :call RunTestFile()<cr>
map <leader>S :call RunNearestTest()<cr>
map <leader>A :call RunTests('')<cr>
" map <leader>c :w\|:!script/features<cr>
" map <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" switch between two last open files faster
nmap <silent> <leader><leader> <c-^>

" create directory for current file
nmap <silent> <leader>d :!mkdir -p %:h<cr>:w<cr>

nmap <silent> <LocalLeader>f :Ggrep <c-r><c-w> **/*rb<cr>
nmap <silent> <LocalLeader>F :Ggrep <c-r><c-a> **/*rb<cr>

"solarized settings
"set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

" Colors for console
if !has("gui_running")
  set t_Co=256
endif

" Scheme
"colorscheme solarized
colorscheme railscasts

" don't search coverage reports and vcr cassettes
set wildignore+=spec/reports
set wildignore+=spec/cassettes

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'


" set some different setting for the diff mode
if &diff
  colorscheme fu_patched " different scheme
  set nonumber " no line numbers
endif
