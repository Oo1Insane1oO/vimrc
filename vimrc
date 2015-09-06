set nocompatible "required for Vundle
filetype off "required for Vundle

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required To ignore plugin indent changes, instead use:
filetype plugin on

"Enable syntax highlighting
syntax enable

"Set background dark
set background=dark

"Set colorscheme
set t_Co=256
"colorscheme solarized
colorscheme molokai

"Determine filetype and enable auto-indent
filetype indent plugin on

"Enable Syntax highlighting
syntax on

"Awesomeness
set hidden

"Command-line completion
set wildmenu

"Show partial commands
set showcmd

"Highlighted search
set hlsearch

"Turn hlsearch off when enter is clicked
nnoremap <CR> :noh<CR><CR>

"Incremental search
set incsearch

"Case insensitive search
set ignorecase
set smartcase

"Allow backspace over autoindent
set backspace=indent,eol,start

"Keep same indent as current line
set autoindent

"Set display cursor on last line
set ruler

"Always display status line
set laststatus=2

"Set command window height to 2 line
set cmdheight=2

"Display line number
set number

"Disable TouchPad on startup, reenable on exit
set mouse-=a
autocmd VimEnter * silent !(xinput --disable 'SynPS/2 Synaptics TouchPad')
autocmd VimLeave * silent !(xinput --enable 'SynPS/2 Synaptics TouchPad')

"apply Touchpad behaviour on suspend
function SetBPM(mode)
    "(Re)Set Bracketed Paste Mode
    execute "silent !echo -ne '\033[?2004" . a:mode . "'"
endfunction
function Ms(mode)
    "set touchpad (mode=enable/disable)
    execute "silent !(xinput --" . a:mode . " 'SynPS/2 Synaptics TouchPad')"
endfunction

"Toggle BPM when suspending (hook ctrl-z)
nnoremap <silent> <C-z> :call SetBPM("l")<bar>:call Ms("enable")<CR>:suspend<bar>:call SetBPM("h")<bar>:call Ms("disable")<CR>

"Indentation settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

"save backup in different directory
set backupdir=~/.vim/tmp/backup
set backup

"save swap in different directory
set directory=~/.vim/tmp/swap
set directory

"save undo in different directory
set undodir=~/.vim/tmp/undo
set undofile

"use shift+h/l to switch between tabs
nnoremap <A-h> gT
nnoremap <A-l> gt

"Set color of tab bar
hi TabLineFill ctermfg=Black ctermbg=DarkGreen
hi TabLine ctermfg=Grey ctermbg=Black
hi TabLineSel ctermfg=DarkCyan ctermbg=DarkRed

"use Alt+F9 to open tagbar
nmap tt :TagbarToggle<CR>

"set paste-toggle to leader(backslash)-z
set pastetoggle=<leader>z

"use ctrl+hjkl to shift panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"use shift+j/k to move pages in normal and visual mode
nnoremap <S-k> 
nnoremap <S-j> 
vnoremap <S-k> 
vnoremap <S-j> 

"use shift+h/l to move word
nnoremap <S-h> b
nnoremap <S-l> w

"use standard commenting 
let s:comment_map = {
    \   "c": '\/\/ ',
    \   "cpp": '\/\/ ',
    \   "go": '\/\/ ',
    \   "java": '\/\/ ',
    \   "javascript": '\/\/ ',
    \   "php": '\/\/ ',
    \   "python": '# ',
    \   "ruby": '# ',
    \   "vim": '" ',
    \   "tex": '% ',
    \ }

"function for toggling comment 
function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^" . comment_leader
            " Uncomment the line
            execute "silent s/^" . comment_leader . "//"
        else
            " Comment the line
            execute "silent s/^/" . comment_leader . "/"
        endif
    else
        echo "No comment leader found for filetype"
    end
endfunction

"use leader(\)->Space to call ToggleComment 
nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>

"fix UltiSnippets
let g:UltisnipsExpandTrigger="<CR>"
let g:UltiSnipsJumpForwardTrigger="<S-b>"
let g:UltiSnipsJumpBackwardTrigger="<S-z>"

set shell=/bin/bash

"set W as w in command mode
cnoremap W w

"set Q as q in command mode
cnoremap Q q

"set <TAB><TAB> as additional 'ENTER'
nmap <TAB><TAB> <CR>
