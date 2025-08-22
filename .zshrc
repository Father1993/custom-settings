# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# CUSTOM HISTORY
HISTFILE=~/.histfile                 # Location of the history file
HISTSIZE=10000                       # Maximum events in internal history
SAVEHIST=10000                       # Maximum events in history file
setopt HIST_IGNORE_ALL_DUPS          # Remove older duplicate commands
setopt INC_APPEND_HISTORY            # Add commands to history immediately
setopt EXTENDED_HISTORY              # Save timestamp and duration
setopt HIST_EXPIRE_DUPS_FIRST        # Remove duplicates first when trimming
setopt HIST_FIND_NO_DUPS             # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE             # Ignore commands starting with space
setopt SHARE_HISTORY                 # Share history between sessions
HISTORY_IGNORE='(vh|s|e|vz|n|d)'     # Ignore specific short commands

# Create and open custom history file
function vh {
    # Create a temporary file for initial processing
    temp_file=$(mktemp /tmp/histfile.XXXXXX)
    # Create a temporary file for viewing
    temp_view_file=$(mktemp /tmp/histfile_view.XXXXXX)
    
    # Process the history file using awk
    awk -F':' '
    # If line already starts with date-time format, print as is and move to next line
    /^[0-9]{2}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}/ { print; next }
    {
        # Extract command from third field
        cmd=$3
        # Remove leading "0;" if present
        sub(/^0;/, "", cmd)
        # Format timestamp to human-readable date
        date=strftime("%y-%m-%d %H:%M", $2)
        # Print formatted date and command
        print date "| " cmd
    }' ~/.histfile > "$temp_file" && mv "$temp_file" "$temp_view_file"

    # Open processed history in vim for viewing
    vim "$temp_view_file"
    # Clean up temporary file after viewing
    rm "$temp_view_file"
}

alias n=nvim
export EDITOR=vim
source $HOME/.config/zsh/env.zsh
source $HOME/.config/zsh/aliases.zsh
export PATH=$PATH:$HOME/.python3.13/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
