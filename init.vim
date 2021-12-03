" neovim config

" vimplugged install
if empty(stdpath('data') . '/autoload/plug.vim')
    exec !curl -fLo "~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | exec 'source' stdpath('config') . '/init.vim'
endif

" vim plug install plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-plug'
Plug 'ibhagwan/fzf-lua'
Plug 'vijaymarupudi/nvim-fzf'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/gruvbox-material'
Plug 'wellle/targets.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/plenary.nvim'
Plug 'vhyrro/neorg'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()

" Determine filetype and enable auto-indent
filetype indent plugin on
filetype plugin on

" Enable Syntax highlighting
syntax enable
syntax on

" Add dictionary to complete
set complete-=k complete+=k

" Use True color
if has('termguicolors')
    set termguicolors
endif

" Colorscheme settings
set background=dark

" gruvbox-material settings
let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_visual = 'red background'
let g:gruvbox_material_menu_selection_background = 'orange'
let g:gruvbox_material_show_eob = 1
let g:gruvbox_material_statusline_style = 'material'

" colorscheme gruvbox-material
colorscheme gruvbox-material

function! StatuslineGit() abort
    if exists('g:plugs') && has_key(g:plugs, 'vim-fugitive')
        let l:branchname = FugitiveHead()
    else
        let l:branchname = ''
    endif

    return strlen(l:branchname) > 0 ? " \ue0a0".l:branchname.' ' : "\ue0a0"  " branch symbol
endfunction

function! ReducedCWD() abort
    let l:curr_dir = substitute(getcwd(), $HOME, '~', '')
    if l:curr_dir == "~"
        return l:curr_dir . "/"
    endif

    let l:curr_dir = split(l:curr_dir, '/')
    return join(map(l:curr_dir[:-2], {_, val -> val[0]}), '/') . '/' . l:curr_dir[-1]
endfunction

function! CheckModified() abort
    if !&modifiable
        return "|\uf83d|"  " lock symbol
    elseif &modified
        return "[\uf067]"  " plus symbol
    else
        return ''
    endif
endfunction

" "\u22c5\u22c5\u22c5"  " dot symbol
" " [\ufc85] "  " crossed sword symbol
" " [\uf071] "  " warning symbol
" " [\u2020] "  " cross symbol
" " [\u2E18] "   inverted bang symbol

function! GetFullMode() abort
    let l:mode_names = {
    \   'n': 'NORMAL',
    \   'no': 'PENDING',
    \   'nov': 'PENDING CHAR',
    \   'noV': 'PENDING LINE',
    \   'no\U0016': 'PENDING BLOCK',
    \   'niI': 'INSERT',
    \   'niR': 'REPLACE',
    \   'niV': 'VIRTUAL REPLACE',
    \   'v': 'VISUAL',
    \   'V': 'VISUAL',
    \   "\U0016": 'VISUAL BLOCK',
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

function! Rarrow() 
    return "\uE0B0"  " large rarrow symbol
endfunction

function! Larrow() 
    return "\uE0B2"  " large rarrow symbol
endfunction

function! LineNumSymbol()
    return "\uE0A1"  " line num symbol
endfunction

function! ColNumSymbol()
    return "\uE0A3"  " Column num symbol
endfunction

function! TripleLineSymbol()
    return "\u039E"  " Column num symbol
endfunction

augroup statusline
    " custom colors
    hi User1 ctermbg=239 ctermfg=167 cterm=bold guifg=#fb4934 guibg=#504945 gui=bold
    hi User2 ctermbg=109 ctermfg=237 cterm=bold guifg=#3c3836 guibg=#83a598 gui=bold
    hi User3 ctermbg=24 ctermfg=237 cterm=bold guifg=#3c3836 guibg=#076678 gui=bold
    hi User4 ctermbg=66 ctermfg=237 cterm=bold guifg=#3c3836 guibg=#458588 gui=bold
    hi User5 ctermbg=167 ctermfg=237 cterm=bold guifg=#3c3836 guibg=#fb4934 gui=bold
    hi User6 ctermbg=208 ctermfg=237 cterm=bold guifg=#3c3836 guibg=#fe8019 gui=bold
    hi User7 ctermbg=214 ctermfg=237 cterm=bold guifg=#3c3836 guibg=#fabd2f gui=bold
    hi User8 ctermbg=142 ctermfg=237 cterm=bold guifg=#3c3836 guibg=#b8bb26 gui=bold
    hi User9 ctermbg=108 ctermfg=237 cterm=bold guifg=#3c3836 guibg= gui=bold

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

    " set statusline+=\ %#WildMenu# " blue/grey
    set statusline+=\ %#TsMath# " blue/grey
    set statusline+=%{Rarrow()}  " large rarrow symbol
    set statusline+=%=
    set statusline+=%#Red# " grey/red
    set statusline+=%{Larrow()}  " large larrow symbol

    set statusline+=%5* " red
    set statusline+=\ %p%%⎮%l%{LineNumSymbol()}:%c%{ColNumSymbol()}⎮%L%{TripleLineSymbol()}
    set statusline+=\ 

    " set statusline+=%6* " orange
    " set statusline+=%{}

    set statusline+=%7* " yellow
    set statusline+=\ %{ReducedCWD()}
    set statusline+=\ 

    " set statusline+=%3* " teal
    " set statusline+=%{}
    " set statusline+=\ 

    set statusline+=%8* " green
    set statusline+=\ %y
    set statusline+=\ 

    " set statusline+=%9* " teal
    " set statusline+=\ 

    " set statusline+=%3* " blue
    " set statusline+=\ 
augroup END

" save backup, swap and undo in different directory
let g:tmpDir=$HOME. "/.local/share/tmp"
let g:backupDir=g:tmpDir . "/backup//"
let g:swapDir=g:tmpDir . "/swap//"
let g:undoDir=g:tmpDir . "/undo//"
let g:tagDir=g:tmpDir . "/tags//"

" create tmp session when closing all but current window (CTRL-W o) and CTRL-W u to undo
let g:sessionPath = g:tmpDir . "/session.vim"
nnoremap <C-w>o :mksession! g:sessionPath<CR>:wincmd o<CR>
nnoremap <C-w>u :source g:sessionPath<CR>

function! CreateTmpDirs()
    " create temporary directories if non-existing
    execute "silent !(mkdir -p " . g:backupDir . ")"
    execute "silent !(mkdir -p " . g:swapDir . ")"
    execute "silent !(mkdir -p " . g:undoDir . ")"
    execute "silent !(mkdir -p " . g:tagDir . ")"
endfunction

augroup create_tmp_dir
    autocmd!
    autocmd VimEnter * :call CreateTmpDirs()
augroup END

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_sizestyle = "H"

let &backupdir=g:backupDir
let &directory=g:swapDir
let &undodir=g:undoDir
silent set backup
silent set directory
silent set undofile

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

" Allow recursive search in cwd
set path+=**

" Allow backspace over autoindent
set backspace=indent,eol,start

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

" open new splits to right and bottom
set splitright
set splitbelow

" Indentation settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cindent

" set paste-toggle to leader(backslash)-z
set pastetoggle=<leader>z

" dont show mode or cmd in last line
set noshowmode
set noshowcmd


" highlight angle brackets, double- and single quotes
setglobal matchpairs+=<:>
setglobal matchpairs+=":"
setglobal matchpairs+=':'

" map // to search for visual selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

augroup completion_done
    autocmd CompleteDone * :pclose
augroup END

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
    \   ".sh": '# ',
    \   "rust": '\/\/ ',
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

" map increase/decrease width/height to Ctrl+arrows
map <silent> <C-left> :vertical resize +5<CR>
map <silent> <C-right> :vertical resize -5<CR>
map <silent> <C-up> :resize +5<CR>
map <silent> <C-down> :resize -5<CR>

" map ge to expand line
vnoremap ge :%j<CR>

" map <leader>+y/p to yank/paste into clipboard
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>Y "+y
vnoremap <leader>P "+p
nnoremap <leader>p "+p
nnoremap <leader>P "+p

" Modify path when opening term if in venv
function! SendVenv()
    let l:chanid = &channel
    if getenv("VIRTUAL_ENV") != v:null
        call chansend(l:chanid, ["export PATH=" . getcwd() . "/" . $VIRTUAL_ENV . "/bin:~PATH", "clear", ""])
    endif
    return l:chanid
endfunction

" Open terminal in split
nnoremap tt :sp term://$SHELL <CR> :call SendVenv() <CR>
nnoremap vtt :vs term://$SHELL <CR> :call SendVenv() <CR>

" Map debugger using &filetype and open debugger in new terminal
let g:debug_chan_id = -1
let g:debug_str = ""

function GetDebugStr()
    let l:debug_map = {
\       'python': 'python -m ipdb ' . expand("%p"),
\       'c': 'gdb ' . expand("%p"),
\       'cpp': 'gdb ' . expand("%p"),
\       'rust': 'gdb ' . expand("%p"),
\   }

    if has_key(l:debug_map, &filetype) == 0
        echo "No debugger available for filetype " . &filetype
        return ""
    endif

    return l:debug_map[&filetype]
endfunction

function InitializeDebugger()
    let g:debug_str = GetDebugStr()

    if g:debug_str != ""
        exec ":sp term://$SHELL"
        let g:debug_chan_id = SendVenv()
        wincmd p
        call chansend(g:debug_chan_id, [g:debug_str, ""])
    endif
endfunction

function RestartDebugger()
    if g:debug_str != ""
        call chansend(g:debug_chan_id, ["exit()", ""])
        :sleep 1m
        call chansend(g:debug_chan_id, [g:debug_str, ""])
    endif
endfunction

" Set breakpoint under currentline
function! SetDebugBreakPoint()
    if jobwait([g:debug_chan_id], 0)[0] != -1
        echo "Debugger not running"
    endif

    call chansend(g:debug_chan_id, ["break " . expand("%p") . ":" . line('.'), ""])
endfunction

" Debugger key-binds
noremap <silent> gtt :call InitializeDebugger() <CR>
noremap <silent> gb :call SetDebugBreakPoint() <CR>
noremap <silent> gr :call RestartDebugger() <CR>

" Send break in current file to term with debugger 

" make git ctags git hook works
set tags^=./.git/tags;

" tagbar options
augroup filetype_tagbar
    autocmd!
    autocmd FileType tagbar setlocal nocursorline nocursorcolumn
augroup END

" Convenient functions for compilation
let g:make_output_buf = -1
let g:make_jobs = []
function! s:OnEvent(job_id, data, event) dict
    call OpenMakeBuf()

    let out_lines = a:event == 'stdout' || a:event == 'stderr' ? a:data : [self.name . ' done']

    let l:curr_win_nr = bufwinnr("%")

    call writefile(out_lines, g:make_output_buf, "a")
    :exe bufwinnr(g:make_output_buf) . "wincmd w"
    execute ":edit"
    execute ":$"
    if l:curr_win_nr != bufwinnr(g:make_output_buf)
        execute ":wincmd p"
    endif
endfunction

function! OpenMakeBuf()
    if bufwinnr(g:make_output_buf) == -1
        let g:make_output_buf = tempname()
        execute 'split ' . g:make_output_buf
        execute 'setlocal bufhidden=hide'
        execute 'setlocal nobuflisted'
        execute 'setlocal buftype=nofile'
        execute 'res 10'
        execute ':wincmd p'
    endif
endfunction

function! AsyncCompile(cmd_list, name, exit_cmd)
    call OpenMakeBuf()

    let s:callbacks = {
    \   'name': a:name,
    \   'on_stdout': function('s:OnEvent'),
    \   'on_stderr': function('s:OnEvent'),
    \   'on_exit': a:exit_cmd != '' ? function(a:exit_cmd) : function('s:OnEvent')
    \ }
    call add(g:make_jobs, jobstart(a:cmd_list, s:callbacks))
endfunction

function! CloseMakeBufwinnr()
    " close make output buffer if open
    let output_buf_winnr = bufwinnr(g:make_output_buf)
    if output_buf_winnr != -1
        execute ':q ' . output_buf_winnr
    endif

    let g:make_output_buf = -1
endfunction

function! s:MakeFunc(job_id, data, event) dict
    call OpenMakeBuf()

    call AsyncCompile(["make", "-C", "build"], 'make', '')
endfunction

function! SetCompileBinding()
    let current_dir = getcwd()
    if filereadable(current_dir . "/CMakeLists.txt")
        let cmd_list = [
        \   "env",
        \   "CMAKE_BUILD_PARALLEL_LEVEL=" . system("nproc --all | awk '{print $1-1}'") . " ",
        \   "cmake",
        \   ".",
        \   "-B",
        \   "build"
        \ ]
        nnoremap <silent> <leader>c :call AsyncCompile(cmd_list, 'cmake', 's:MakeFunc')<CR>
    elseif filereadable(current_dir . "/Cargo.toml")
        nnoremap <silent> <leader>c :call AsyncCompile(["cargo", "build", "--release"], 'cargo', '')<CR>
    elseif filereadable(current_dir . "/pyproject.toml")
        nnoremap <silent> <leader>c :call AsyncCompile(["poetry", "install"], 'poetry', '')<CR>
    endif
endfunction

function TerminateCompile()
    " terminate all started jobs
    while !empty(g:make_jobs)
        for jobid in g:make_jobs
            call jobstop(jobid)
        endfor
    endwhile
endfunction

augroup compilefunc
    autocmd VimEnter * :call SetCompileBinding()
augroup END

" map leader+c to run AsyncMake and <leader>+qc to kill it
nnoremap <silent> <leader>qc :call TerminateCompile()<CR> :call CloseMakeBufwinnr()<CR>

" set python interpretor path
let g:python3_host_prog = expand("~") . "/.pyenv/versions/py3nvim/bin/python"

" Make saving tolarable
cnoremap W<CR> w<CR>
cnoremap Wq<CR> wq<CR>
cnoremap Wa<CR> wa<CR>

" Map <Tab>+<Space> to open netrw in vsplit (Vex)
noremap <Tab><Space> :Vex<CR> :vertical resize 30<CR>

" Autostart coq
let g:coq_settings = {'auto_start': v:true}

" fzf-lua configs
nnoremap <silent> <leader>f <cmd>lua require('fzf-lua').files()<CR>
nnoremap <silent> <leader>r <cmd>lua require('fzf-lua').grep()<CR>
nnoremap <silent> <leader>q <cmd>lua require('fzf-lua').quickfix()<CR>
nnoremap <silent> <leader>vr <cmd>lua require('fzf-lua').grep_cword()<CR>

" Enable treesitter and Neorg
lua <<EOF
local lsp_installer = require('nvim-lsp-installer')
local coq = require('coq')
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<C-w>gd', '<cmd>lua vim.lsp.buf.declaration()<CR> :sp<CR> :wincmd j<CR> :<C-o><CR>', opts)
    buf_set_keymap('n', '<C-w>gD', '<cmd>lua vim.lsp.buf.definition()<CR> :sp<CR> :wincmd j<CR> :<C-o><CR>', opts)
    buf_set_keymap('n', '<C-w>gi', '<cmd>lua vim.lsp.buf.implementation()<CR> :sp<CR> :wincmd j<CR> :<C-o><CR>', opts)
    buf_set_keymap('n', '<C-w>gr', '<cmd>lua vim.lsp.buf.references()<CR> :sp<CR> :wincmd j<CR> :<C-o><CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>n', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<space>p', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<space>t', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
end

lsp_installer.on_server_ready(function(server)
    local opts = {}
    
    server:setup(opts)
end)

require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.norg.concealer"] = {}, -- Allows for use of icons
        ["core.keybinds"] = { -- Configure core.keybinds
            config = {
                default_keybinds = true, -- Generate the default keybinds
                neorg_leader = "<Leader>o" -- This is the default if unspecified
            }
        },
    },
}

-- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>,
-- And allows you to shove every Neorg keybind under one "umbrella".
local neorg_leader = "<Leader>" -- You may also want to set this to <Leader>o for "organization"

-- Require the user callbacks module, which allows us to tap into the core of Neorg
local neorg_callbacks = require('neorg.callbacks')

-- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
-- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
-- needs to reevaluate all the bound keys is invoked
neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

	-- Map all the below keybinds only when the "norg" mode is active
	keybinds.map_event_to_mode("norg", {
		n = { -- Bind keys in normal mode

			-- Keys for managing TODO items and setting their states
			{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
			{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
			{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
			{ "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" }

		},
	}, { silent = true, noremap = true })

end)
EOF
