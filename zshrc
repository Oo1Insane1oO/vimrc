# Path to your oh-my-zsh installation.
  export ZSH=/home/saintz/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="miloshadzic"
# ZSH_THEME="pygmalion-virtualenv"
ZSH_THEME="alien-minimal/alien-minimal"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv zsh-autosuggestions)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# alien-minimal settings
export AM_SHOW_FULL_DIR=1    # shows the full dir path
export AM_GIT_STASH_SYM='@'  # Git Stash Count Symbbol
export AM_GIT_BARE_SYM='☢'   # Git bare repo Symbbol

export am_vcs_color=6           # color for VCS (G: M: V:)
export am_ssh_color=11          # color for ssh indicaator
export am_normal_color=14       # color for normal text
export am_error_color=14        # color for ERROR (same as normal)
export am_rev_color=13          # color for VCS Revision number
export am_branch_color=41       # color for VCS BRANCH name
export am_left_right_color=3    # color for GIT Left-Right status
export am_stash_color=3         # color for GIT stash count
export am_bare_color=3          # color for GIT bare repo indicator
export am_commit_since_color=11 # color for last commit time
export am_fade_color=8          # color for fade text color
export am_venv_color=6          # color for virtual environment
export am_timer_color=14        # color for command execution time
export am_viins_color=39        # color for viins mode
export am_vicmd_color=208       # color vicmd mode

# promtlib settings
export PLIB_GIT_ADD_SYM='+'  # Git New Tracked File Symbol
export PLIB_GIT_DEL_SYM='-'  # Git Deleted File Symbol
export PLIB_GIT_MOD_SYM='*'  # Git Modified File Symbol
export PLIB_GIT_NEW_SYM='?'  # Git New Untracked File Symbol
export PLIB_GIT_PUSH_SYM='↑' # Git Unpushed Commit Symbol
export PLIB_GIT_PULL_SYM='↓' # Git New Commit Symbol

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
#export EDITOR=/usr/bin/nano
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                                                       # Home key
bindkey '^[[H' beginning-of-line                                                        # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                                        # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                                             # End key
bindkey '^[[F' end-of-line                                                              # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                                               # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                                          # Insert key
bindkey '^[[3~' delete-char                                                             # Delete key
bindkey '^[[C'  forward-char                                                            # Right key
bindkey '^[[D'  backward-char                                                           # Left key
bindkey '^[[5~' history-beginning-search-backward                                       # Page up key
bindkey '^[[6~' history-beginning-search-forward                                        # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                                             # [Ctrl-Left]  - go to next word
bindkey '^[Od' backward-word                                                            # [Ctrl-Right] - go to previous word
bindkey '^[[1;5C' forward-word                                                          # [Ctrl-Left]  - go to next word
bindkey '^[[1;5D' backward-word                                                         # [Ctrl-Right] - go to previous word
bindkey '^H' backward-kill-word                                                         # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                                                     # Shift+tab undo last action

## Alias section 
alias cp="cp -i"                                                                        # Confirm before overwriting something
alias df='df -h'                                                                        # Human-readable sizes
alias free='free -m'                                                                    # Show sizes in MB
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"    # force ipython to use virtualenv python

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold'
source ~/.oh-my-zsh/plugins/


export PYTHONDONTWRITEBYTECODE=1

# always create venv in .venv within project
export PIPENV_VENV_IN_PROJECT=1

# disble prompt for showing venv
# export VIRTUAL_ENV_DISABLE_PROMPT=1

# dont download lfs files by default when cloning
export GIT_LFS_SKIP_SMUDGE=1

export TERM=xterm-256color
export TERMINAL=urxvt

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
