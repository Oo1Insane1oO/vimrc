runtime!archlinux.vim

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'wellle/targets.vim'
Plug 'w0rp/ale'
Plug 'junegunn/rainbow_parentheses.vim', {'for': ['clojure', 'scheme', 'racket']}

call plug#end()

" Determine filetype and enable auto-indent
filetype indent plugin on
filetype plugin on

" Enable Syntax highlighting
syntax enable
syntax on

" Set background dark
set background=dark

" Set colorscheme
set t_Co=256
"  colorscheme onedark
colorscheme gruvbox 

" gruvbox configuration
let g:gruvbox_contrast_dark = "medium"
" 
" Airline
" let g:airline_powerline_fonts = 1
" 
" if !exists('g:airline_symbols')
    " let g:airline_symbols = {}
" endif
" 
" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
" 
" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" 
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline_theme="gruvbox"
" 
" enable airline extensions
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#ale#enabled = 1
  " 
" disable airline extensions
" let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#ycm#enabled = 0

function! StatuslineGit()
  let l:branchname = FugitiveHead()
  return strlen(l:branchname) > 0 ? ' '.l:branchname.' ' : ''
endfunction

function! ReducedCWD()
    let l:curr_dir = substitute(getcwd(), $HOME, '~', '')
    if l:curr_dir == "~"
        return l:curr_dir . "/"
    endif

    let l:curr_dir = split(l:curr_dir, '/')
    return join(map(l:curr_dir[:-2], {_, val -> val[0]}), '/') . '/' . l:curr_dir[-1]
endfunction

function! CheckModified()
    if !&modifiable
        return '⎮⎮'
    elseif &modified
        return '⎮+⎮'
    else
        return ''
    endif
endfunction

function! GetTouchToggleStatus()
    return g:toggleTouch && job_info(g:ms_job)["exitval"] == 0 ? "\u211A\u0338" : "\u211A" 
endfunction

function! CheckBufferString()
    let l:curr_buffer_nr = bufnr("%")

    if ale#engine#IsCheckingBuffer(l:curr_buffer_nr)
        return "⋅⋅⋅"
    endif

    let l:error_dict = ale#statusline#FirstProblem(l:curr_buffer_nr, "error")
    if !empty(l:error_dict)
        return " " . l:error_dict["text"] . " [⚔] "
    endif
    
    let l:error_dict = ale#statusline#FirstProblem(l:curr_buffer_nr, "style_error")
    if !empty(l:error_dict)
        return " " . l:error_dict["text"] .  " [⚠] "
    endif
    
    let l:error_dict = ale#statusline#FirstProblem(l:curr_buffer_nr, "style_warning")
    if !empty(l:error_dict)
        return " " . l:error_dict["text"] . " [†] "
    endif
    
    let l:error_dict = ale#statusline#FirstProblem(l:curr_buffer_nr, "info")
    if !empty(l:error_dict)
        return " " . l:error_dict["text"] . " [⸘] "
    endif

    return "[✔]"
endfunction

function! GetFullMode()
    let l:mode_names = {
    \   'n': 'NORMAL',
    \   'no': 'PENDING',
    \   'nov': 'PENDING CHAR',
    \   'noV': 'PENDING LINE',
    \   'no': 'PENDING BLOCK',
    \   'niI': 'INSERT',
    \   'niR': 'REPLACE',
    \   'niV': 'VIRTUAL REPLACE',
    \   'v': 'VISUAL',
    \   'V': 'VISUAL',
    \   '': 'VISUAL BLOCK',
    \   's': 'SELECT CHAR',
    \   'S': 'SELECT LINE',
    \   'CTRL-S': '',
    \   'i': 'INSERT',
    \   'ic': 'COMPLETION INSERT',
    \   'ix': 'INSERT COMPLETION',
    \   'R': 'REPLACE',
    \   'Rc': 'REPLACE COMPLETION',
    \   'Rv': 'VIRTUAL REPLACE',
    \   'Rx': 'REPLACE COMPLETION',
    \   'c': 'COMMAND LINE EDIT',
    \   'cv': 'EX',
    \   'ce': 'NORMAL EX',
    \   'r': 'END PROMPT',
    \   'rm': 'MORE PROMPT',
    \   'r?': 'CONFIRM PROMPT',
    \   '!': 'EXTERNAL',
    \   't': 'TERMINAL',
    \}
    return l:mode_names[mode()]
endfunction

" custom colors
hi User1 ctermbg=239 ctermfg=167
hi User2 ctermbg=109 ctermfg=237 cterm=bold
hi User3 ctermbg=24 ctermfg=237 cterm=bold
hi User4 ctermbg=66 ctermfg=237 cterm=bold
hi User5 ctermbg=167 ctermfg=237 cterm=bold
hi User6 ctermbg=208 ctermfg=237 cterm=bold
hi User7 ctermbg=214 ctermfg=237 cterm=bold
hi User8 ctermbg=142 ctermfg=237 cterm=bold
hi User9 ctermbg=108 ctermfg=237 cterm=bold

hi TabLine ctermfg=214 ctermbg=237 cterm=bold term=none
hi TabLineFill ctermfg=237 ctermbg=237 cterm=bold term=none
hi TabLineSel ctermfg=237 ctermbg=109 cterm=bold term=none

" statusline settings
set laststatus=2

set statusline=

set statusline+=%3* " blue3 / grey
set statusline+=\ %{StatuslineGit()}
set statusline+=\ 

set statusline+=%4* " blue2 / grey
set statusline+=\ %f
set statusline+=\ 

set statusline+=%5* " red
set statusline+=%{CheckModified()}

set statusline+=%2* " blue
set statusline+=\ %{GetFullMode()}

set statusline+=\ %#WildMenu# " blue/grey
set statusline+=
set statusline+=%=
set statusline+=%1* " grey/red
set statusline+=

set statusline+=%5* " red
set statusline+=\ %p%%⎮%l:%c⎮%LΞ
set statusline+=\ 

set statusline+=%6* " orange
set statusline+=%{CheckBufferString()}

set statusline+=%7* " yellow
set statusline+=\ %{ReducedCWD()}
set statusline+=\ 

set statusline+=%8* " green
set statusline+=\ %y
set statusline+=\ 

" set statusline+=%9* " teal
" set statusline+=\ 

set statusline+=%3* " blue
set statusline+=\ %{GetTouchToggleStatus()}
set statusline+=\ 

" set linebreak to 100 chars
set textwidth=100

" dont automatically break text, but rather wrap
set wrap linebreak nolist
set formatoptions-=t

" Awesomeness
set hidden

" Command-line completion
set wildmenu
set wildmode=longest,list,full

" Show partial commands
set showcmd

" Highlighted search
set hlsearch

" Turn hlsearch off when enter is clicked
nnoremap <CR> :noh<CR><CR>

" Incremental search
set incsearch

" Disable auto commenting
augroup filetype_local
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Case insensitive search
set ignorecase
set smartcase

" Allow recursive search in cwd
set path+=**

" Allow backspace over autoindent
set backspace=indent,eol,start

" Keep same indent as current line
set autoindent

" Set display cursor on last line
set ruler

" Always display status line
set laststatus=2

" Set command window height to 2 line
set cmdheight=2

" Display line number
set number

"  Buffer screen updates (instead of all the time)
set lazyredraw

" use ttyfast
set ttyfast

" set clipboard options
set clipboard+=unnamed
set go+=a

" open new splits to right and bottom
set splitright
set splitbelow

" make git ctags git hook works
set tags^=./.git/tags;

" fix slow tagbar
augroup filetype_tagbar
    autocmd!
    autocmd FileType tagbar setlocal nocursorline nocursorcolumn
augroup END

" touchpad behavior
let g:toggleTouch = 1
set mouse-=a

function! Ms(mode)
    "set touchpad (mode=enable/disable)
    if g:toggleTouch
        let l:touch_id_command = '$(xinput list | grep -i touchpad | sed -nE "s/^.+id=([0-9]+).+$/\1/p")'
        let g:ms_job = job_start(["/bin/sh", "-c", "xinput --" . a:mode . " " . touch_id_command],
                               \ {"in_io": "null", "out_io": "null", "err_io": "null",
                               \  "in_mode": "raw", "out_mode": "raw", "err_mode": "raw"})
    endif
endfunction

" Toggle BPM when subshelling (hook ctrl-z)
function! SetBPM(mode)
    " (Re)Set Bracketed Paste Mode
    let job = job_start(["echo", "-ne", "'\033[?2004" . a:mode . "'"],
	                    \ {"in_io": "null", "out_io": "null", "err_io": "null"})
endfunction

function! ToggleDisableTouch()
    " toggle global which determines toggling of touchpad
    if g:toggleTouch
        call Ms("enable")
        g:toggleTouch = 0
    else
        call Ms("disable")
        g:ToggleTouch = 1
    endif
endfunction

function! AsyncToggleMs(bpm, mode)
    " wrapper for calling bpm and ms routines
    call SetBPM(a:bpm)
    call Ms(a:mode)
endfunction

" toggle touchpad behaviour
nnoremap <silent> <C-z> :call AsyncToggleMs("l", "enable")<CR> :suspend<bar> :call AsyncToggleMs("h", "disable") <CR> :redraw!<CR>

augroup ms_enable_disable
    autocmd!
    autocmd VimEnter * :call Ms("disable")
    autocmd VimLeave * :call Ms("enable")
augroup END

nnoremap <leader>ms :call ToggleDisableTouch()<CR>

" Indentation settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#

" save backup, swap and undo in different directory
let g:tmpDir=$HOME. "/.vim/tmp"
let g:backupDir=g:tmpDir . "/backup//"
let g:swapDir=g:tmpDir . "/swap//"
let g:undoDir=g:tmpDir . "/undo//"

function! CreateTmpDirs()
    " create temporary directories if non-existing
    execute "silent !(mkdir -p " . g:backupDir . ")"
    execute "silent !(mkdir -p " . g:swapDir . ")"
    execute "silent !(mkdir -p " . g:undoDir . ")"
endfunction

augroup create_tmp_dir
    autocmd!
    autocmd VimEnter * :call CreateTmpDirs()
augroup END

let &backupdir=g:backupDir
let &directory=g:swapDir
let &undodir=g:undoDir
silent set backup
silent set directory
silent set undofile

" use tt to toggle tagbar
nmap <Space><Space> :TagbarToggle<CR>

" file explorer settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 50

" use Tab+space-space to toggle netrw
nmap <Tab><Space> :Lexplore<CR>

" use Space+t to jump to tagbar
nnoremap <Space>t :TagbarOpen fj<CR>

" set paste-toggle to leader(backslash)-z
set pastetoggle=<leader>z

" dont show mode or cmd in last line
set noshowmode
set noshowcmd

" use ctrl+h/l to switch between tabs
nnoremap <C-o> gT
nnoremap <C-p> gt

" use ctrl+h/l/j/k to cycle through panes
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-l> :wincmd l<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-k> :wincmd k<CR>

"  make saving easier
cnoremap W<CR> w<CR>
cnoremap Wq<CR> wq<CR>
cnoremap Wa<CR> wa<CR>

" use shift+j/k to move pages in normal and visual mode
nnoremap <S-k> 
nnoremap <S-j> 
vnoremap <S-k> 
vnoremap <S-j> 

" use shift+h/l to move word in normal and visual mode
nnoremap <S-h> b
nnoremap <S-l> w
vnoremap <S-h> b
vnoremap <S-l> w

" use ctrl+j/k to move window one line
"  nnoremap <C-j> <C-e>
"  nnoremap <C-k> <C-y>

" set <TAB><TAB> as additional 'ENTER'
nmap <TAB><TAB> <CR>

" bind move to beginning of line command mode
cnoremap <C-a> <C-b>

" use standard commenting 
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
    \   "lammps": '# ',
    \   "yaml": '# ',
    \   "lua": '-- ',
    \   ".vimrc": '" ',
    \ }

" function for toggling comment 
function! CommentLine(toggle)
    if has_key(s:comment_map, &filetype)
        let l:comment_leader = s:comment_map[&filetype]
        if (a:toggle == 1) && (getline('.') =~ "^ *" . l:comment_leader)
            " Uncomment the line
            execute 'silent s/' . l:comment_leader . '\+//'
        elseif (a:toggle == 0) && (getline('.') !~ "\s*" . l:comment_leader)
            execute 'silent s/\S\|$/' . l:comment_leader . '&/'
        elseif  (a:toggle == 1) && (getline('.') !~ "\s\+" . l:comment_leader)
            " Comment the line
            execute 'silent s/\S\|$/' . l:comment_leader . '&/'
        endif
    else
        echo "No comment leader found for filetype"
    end
endfunction

" use leader(\)->Space to call ToggleComment
nnoremap <leader><Space> :call CommentLine(1)<cr>
vnoremap <leader><Space> :call CommentLine(1)<cr>
nnoremap <leader><leader><Space> :call CommentLine(0)<cr>
vnoremap <leader><leader><Space> :call CommentLine(0)<cr>

" make ultisnips and YCM friends
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

" use python3 interpreter
"  let g:ycm_server_python_interpreter = 'usr/bin/python3'
"  let g:ycm_python_binary_path = '/usr/local/bin/python3'

" YCM semantic support
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" Disable error
let g:ycm_show_diagnostics_ui = 0

set shell=/bin/zsh

" set tmp directory (used by tempname etc.)
let $TMP = g:tmpDir . "/bin"

" function to find current user
function! GetUser()
    let currUser = substitute(system('whoami'), '\n', '', '')
    return currUser
endfunction

" set automatic preamble in .tex files (on linux)
augroup buf_new_file_tex
    autocmd!
    autocmd BufNewFile *.tex :r "/home/" . GetUser() . "/.vim/texPreamble"
    autocmd BufNewFile *.tex :set filetype=tex
augroup END

" function for setting tex directory
function! FindCurrDir()
    let currDir = getcwd()
    return currDir
endfunction

" function for setting specific tex directory
function! GetTexDir()
    let curLine = getline('.')
    call inputsave()
    let specDir = input('Enter tex dir: ')
    return specDir
endfunction

" function for setting specific tex file (split compile) 
function! GetTexFile()
    let curLine = getline('.')
    call inputsave()
    let specFile = input('Enter tex file: ')
    return specFile
endfunction

" set leader(\)->l to call pdflatex on current file (using pdflatex)
let g:dirTest = "none"
let g:locCurrDir = FindCurrDir()
let g:texDir = "none"
function! CompileTex()
    " function for running pdflatex silent
    let locCurrDir = "none"
    if g:dirTest == "none"
        let g:texDir = GetTexDir()
        let g:texFile = GetTexFile()
        let g:dirTest = "notNone"
    endif
    let texDirectory = g:texDir
    execute "!(latexmk -pdf --jobname=" . texDirectory . "/" . g:texFile . " --shell-escape --interaction=nonstopmode --file-line-error " .  texDirectory . "/" . g:texFile . " | egrep -i '*:[0-9]*:.*\|error\|undefined')"
endfunction
nnoremap <leader>l :call CompileTex()<CR>

" function for resetting directory variable
function! ReInitDir()
    let g:dirTest = "none"
endfunction

" function for cleaning temp-files
function! CleanTemp()
    let currUser = GetUser()
    execute "silent !(rm /home/" . currUser . "/.vim/tmp/backup/*)"
    execute "silent !(rm /home/" . currUser . "/.vim/tmp/swap/*)"
    execute "silent !(rm /home/" . currUser . "/.vim/tmp/undo/*)"
endfunction

" map <ctrl-ctrl> to copy to clipboard using xclip
vnoremap <C>yc :!xclip -i -sel clip<CR><CR>

" map <S-insert> to xterm
map <S-Insert> <MiddleMouse>

" map increase/decrease width/height to Ctrl+arrows
map <C-left> :vertical resize +5<CR>
map <C-right> :vertical resize -5<CR>
map <C-up> :resize +5<CR>
map <C-down> :resize -5<CR>

" map leader+r to rotate window columns
noremap <leader>r <C-w>r

" map ge to expand line
vnoremap ge :%j<CR>

" list of file extentions with headers
let s:extensions = {
    \   'cpp' : ['.h', '.hpp'],
    \   'c' : ['.h'],
    \   'h' : ['.c', '.cpp'],
    \   'hpp' : ['.cpp']
\ }

function! ToggleHeaderSource(mode)
    let l:path = expand('%:h') . "/"
    let l:filename = expand('%:t:r')
    let l:extension = expand('%:e')
    if has_key(s:extensions, l:extension)
        for l:k in s:extensions[l:extension]
            let l:fileExtendedPath = l:path . l:filename . l:k
            if filereadable(l:fileExtendedPath)
                execute a:mode . " " . l:fileExtendedPath
                break
            endif
        endfor
    endif
endfunction

" map ToggleHeaderSource to <leader>s
nnoremap <leader>s :call ToggleHeaderSource("e")<CR>
nnoremap <leader>vs :call ToggleHeaderSource("vsplit")<CR>
nnoremap <leader>hs :call ToggleHeaderSource("split")<CR>

" map ctrl+md to show markdown
function! ShowFile()
    execute "!(firefox " . expand('%') . ")"
endfunction
cmap md :call ShowFile()<CR>

" Ale settings
let b:ale_linters = {
\    'python': ['pylint'],
\    'cpp': ['clang'],
\ }
let g:ale_pattern_options = {
\   '\.hpp$': {
\       'ale_linters' : ['clangcheck'],
\       'ale_fixers' : ['clangformat'],
\   },
\   '\.cpp$': {
\       'ale_linters' : ['clangcheck'],
\       'ale_fixers' : ['clangformat'],
\   },
\ }
let g:ale_lint_on_enter=0
let g:ale_c_parse_compile_commands=1

nmap <silent> <leader>n <Plug>(ale_previous_wrap)
nmap <silent> <leader>m <Plug>(ale_next_wrap)

" functions for running compilation with cmake in async
let g:makeOutputBuf = -1
let g:cmakeJob = -1
let g:makeJob = -1
function! CloseMakeBufwinnr()
    " close make output buffer if open
    let l:makeOutputBufWinnr = bufwinnr(g:makeOutputBuf)
    if l:makeOutputBufWinnr != -1
        execute ':q ' . l:makeOutputBufWinnr
    endif
    let g:makeOutputBuf = -1
endfunction
function! MakeExit(channel, msg)
    " call make when Cmake is done and show output in same buffer
    let g:testJob = job_start(["env", "CTEST_OUTPUT_ON_FAILURE=1", "make", "-C", "build", "test", "ARGS=-j" . system("nproc --all")],
                               \ {"in_io": "null",
                                \ "out_io": "buffer",
                                \ "out_name": g:makeOutputBuf,
                                \ "err_io": "buffer",
                                \ "err_name": g:makeOutputBuf})
endfunction
function! CmakeExit(channel, msg)
    " call make when Cmake is done and show output in same buffer
    let g:makeJob =  job_start(["make", "-C", "build"],
                               \ {"in_io": "null",
                                \ "out_io": "buffer",
                                \ "out_name": g:makeOutputBuf,
                                \ "err_io": "buffer",
                                \ "err_name": g:makeOutputBuf,
                                \ "exit_cb": "MakeExit"})
endfunction
function! AsyncMake()
    " function for running cmake and make in async and show output in buffer
    " silent call CloseMakeBufwinnr()
    if g:makeOutputBuf == -1
        let g:makeOutputBuf = tempname()
    endif
    let g:cmakeJob = job_start(["env", "CMAKE_BUILD_PARALLEL_LEVEL=".system("nproc --all")." ", "cmake", ".", "-B", "build"],
                             \ {"in_io": "null",
                              \ "out_io": "buffer",
                              \ "out_name": g:makeOutputBuf,
                              \ "err_io": "buffer",
                              \ "err_name": g:makeOutputBuf,
                              \ "exit_cb": "CmakeExit"})
    if bufwinnr(g:makeOutputBuf) == -1
        execute 'setlocal buftype="quickfix"'
        execute 'sbuf ' . g:makeOutputBuf
        execute 'setlocal bufhidden=hide'
        execute 'setlocal nobuflisted'
        execute 'setlocal buftype=nofile'
        execute 'res 10'
        execute ':wincmd p'
    endif
endfunction
function! TerminateMake()
    " either stop make job(either one of cmake and make) if still active or close buffer if jobs
    " are finished
    if job_status(g:cmakeJob) == "run"
        call job_stop(g:cmakeJob)
    elseif job_status(g:makeJob) == "run"
        call job_stop(g:makeJob)
    elseif job_status(g:testJob) == "run"
        call job_stop(g:testJob)
    else
        silent call CloseMakeBufwinnr()
    endif
endfunction

" map leader+c to run AsyncMake and <leader>+qc to kill it
nnoremap <silent> <leader>c :call AsyncMake()<CR>
nnoremap <silent> <leader>qc :call TerminateMake()<CR> :call CloseMakeBufwinnr()<CR>

" highlight angle brackets, double- and single quotes
setglobal matchpairs+=<:>
setglobal matchpairs+=":"
setglobal matchpairs+=':'

" open terminal with tt (hsplit) and vtt (vsplit)
nnoremap tt :terminal <CR>
nnoremap vtt :vertical terminal <CR>

" rainbow parantheses settings
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['<', '>']]
let g:rainbow#blacklist = [233, 234]

function! ToggleSnakeCamel()
    " toggle between snake- and camel case
    execute 'silent s/_\u*/&U/'
    execute 'silent s/\u\S*/_&u/'
endfunction

if &term =~ '256color'
    "Disable Background Color Erase (BCE) so hat color schemes
    "work properly when Vim is used inside tmus and GNU screen
    set t_ut=
endif

" map // to search for visual selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
