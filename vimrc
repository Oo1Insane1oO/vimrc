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
Plugin 'bling/vim-airline'

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
" colorscheme onedark
colorscheme gruvbox 
let g:globalColor = g:colors_name
autocmd BufNewFile,BufRead *.tex colorscheme meta5 | let g:texColor = g:colors_name

" gruvbox configuration
let g:gruvbox_contrast_dark = "medium"

" Enable buffer list from airline
let g:airline#extensions#tabline#enabled = 1

" function for setting color
function! SetColor()
    " set colorscheme (to be used with setBPM and Ms)
    if &filetype == 'tex'
        set background=dark
        execute "silent colorscheme " . g:texColor
    else
        set background=dark
        execute "silent colorscheme " . g:globalColor
    endif
endfunction

" call SetColor on entering a new tab
autocmd TabEnter * :call SetColor()

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

"Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

"Buffer screen updates (instead of all the time)
set lazyredraw

"set clipboard options
set clipboard+=unnamed
set go+=a

" open new splits to right and bottom
set splitright
set splitbelow

"fix slow tagbar
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

"close preview window after autocomplete
autocmd CompleteDone * pclose

"Disable TouchPad on startup, reenable on exit
set mouse-=a

autocmd VimEnter * :silent !(xinput list | if grep -i 'TouchPad'; then xinput --disable 'SynPS/2 Synaptics TouchPad'; fi)
autocmd VimLeave * :silent !(xinput list | if grep -i 'TouchPad'; then xinput --enable 'SynPS/2 Synaptics TouchPad'; fi)

"apply Touchpad behaviour on suspend
function! SetBPM(mode)
    "(Re)Set Bracketed Paste Mode
    execute "silent !echo -ne '\033[?2004" . a:mode . "'"
endfunction

function! Ms(mode)
    "set touchpad (mode=enable/disable)
    execute "silent !(xinput list | if grep -i 'TouchPad'; then xinput --" . a:mode . " 'SynPS/2 Synaptics TouchPad'; fi)"
endfunction

"Toggle BPM when suspending (hook ctrl-z)
nnoremap <silent> <C-z> :call SetBPM("l")<bar>:call Ms("enable")<CR>
            \:suspend<bar>:call SetBPM("h")<bar>:call Ms("disable")<CR>
            \:call SetColor()<CR>

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

"Set color of tab bar
hi TabLineFill ctermfg=Black ctermbg=DarkGreen
hi TabLine ctermfg=Grey ctermbg=Black
hi TabLineSel ctermfg=DarkCyan ctermbg=DarkRed

"use Alt+F9 to open tagbar
nmap tt :TagbarToggle<CR>

"set paste-toggle to leader(backslash)-z
set pastetoggle=<leader>z

"use shift+h/l to switch between tabs
unmap <C-l>
unmap <C-h>
nnoremap <C-h> gT
nnoremap <C-l> gt

"use ctrl+po to cycle through panes
noremap <C-p> <C-w>wl
noremap <C-o> <C-w>Wh
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k

"use shift+j/k to move pages in normal and visual mode
nnoremap <S-k> 
nnoremap <S-j> 
vnoremap <S-k> 
vnoremap <S-j> 

"use shift+h/l to move word in normal and visual mode
nnoremap <S-h> b
nnoremap <S-l> w
vnoremap <S-h> b
vnoremap <S-l> w

"use ctrl+j/k to move window one line
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

"set W as w in command mode
cnoremap W w

"set Q as q in command mode
cnoremap Q q

"set <TAB><TAB> as additional 'ENTER'
nmap <TAB><TAB> <CR>

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
    \   "lisp": '; ',
    \   "zsh": '# ',
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

"make ultisnips and YCM friends
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

"use python3 interpreter
" let g:ycm_server_python_interpreter = 'usr/bin/python3'
" let g:ycm_python_binary_path = '/usr/local/bin/python3'

set shell=/bin/bash

"function to find current user
function! GetUser()
    let currUser = substitute(system('whoami'), '\n', '', '')
    return currUser
endfunction

"set automatic preamble in .tex files (on linux)
let currUser = GetUser()
execute "autocmd BufNewFile *.tex :r /home/" . currUser . "/.vim/texPreamble"
autocmd BufNewFile *.tex :set filetype=tex

"function for setting tex directory
function! FindCurrDir()
    let currDir = getcwd()
    return currDir
endfunction

"function for setting specific tex directory
function! GetTexDir()
    let curLine = getline('.')
    call inputsave()
    let specDir = input('Enter tex dir: ')
    return specDir
endfunction

"set leader(\)->l to call pdflatex on current file (using pdflatex)
let g:dirTest = "none"
let g:locCurrDir = FindCurrDir()
let g:texDir = "none"
function! CompileTex()
    " function for running pdflatex silent
    let locCurrDir = "none"
    if g:dirTest == "none"
        let g:texDir = GetTexDir()
        let g:dirTest = "notNone"
    endif
    let texDirectory = g:locCurrDir . "/" . g:texDir
    execute "!(pdflatex -output-directory " . texDirectory . " -shell-escape -interaction=nonstopmode -file-line-error % | egrep -i '*:[0-9]*:.*\|error\|undefined')"
endfunction
nnoremap <leader>l :call CompileTex()<CR>

"function for resetting directory variable
function! ReInitDir()
    let g:dirTest = "none"
endfunction

"function for cleaning temp-files
function! CleanTemp()
    let currUser = GetUser()
    execute "silent !(rm /home/" . currUser . "/.vim/tmp/backup/*)"
    execute "silent !(rm /home/" . currUser . "/.vim/tmp/swap/*)"
    execute "silent !(rm /home/" . currUser . "/.vim/tmp/undo/*)"
endfunction

"map <ctrl-ctrl> to copy to clipboard using xclip
vnoremap <C>yc :w !xclip -i -sel c<CR><CR>

"map <S-insert> to xterm
map <S-Insert> <MiddleMouse>
