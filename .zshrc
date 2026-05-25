# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/nottnott/.zsh/completions:"* ]]; then export FPATH="/home/nottnott/.zsh/completions:$FPATH"; fi
DISABLE_UNTRACKED_FILES_DIRTY="true"

if [[ ":$FPATH:" != *":/home/nott_eucalyptus/.zsh/completions:"* ]]; then export FPATH="/home/nott_eucalyptus/.zsh/completions:$FPATH"; fi
# =========================
# PATH & ENVIRONMENT SETUP
# =========================

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

# Java & Android (commented out, activate if needed)
# export ANDROID_HOME=$HOME/Android/Sdk
# export JAVA_HOME=/usr/lib/jvm/java-24-openjdk
# export PATH=$PATH:$JAVA_HOME/bin
# export PATH=$PATH:$ANDROID_HOME/emulator/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/default
# export MAVEN_OPTS="--enable-native-access=ALL-UNNAMED"
export MAVEN_OPTS="--sun-misc-unsafe-memory-access=allow --enable-final-field-mutation=ALL-UNNAMED"

# =========================
# ZSH THEME & BEHAVIOR
# =========================

# ZSH_THEME="robbyrussell"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13

# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

# =========================
# PLUGINS
# =========================

plugins=(
	# git
  gitfast
	z
	zsh-autosuggestions
	# zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# =========================
# FZF CONFIGURATION
# =========================

source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'

export FZF_DEFAULT_OPTS="\
  --color=fg:#ebdbb2,bg:#1d2021,hl:#b16286 \
  --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b \
  --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 \
  --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# =========================
# EDITOR / LANGUAGE / FLAGS (optional, all commented)
# =========================

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
# export ARCHFLAGS="-arch $(uname -m)"

# =========================
# ALIASES
# =========================

alias ls='eza -1 -F --icons'
alias g='git'
alias fetch='fastfetch'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias kicat='kitten icat'
alias py='python3'
alias t='tmux'
alias lg='lazygit'
alias cd..='cd ../'
alias myhelpers='cd ~/MyHelpers/'
alias mytest='cd ~/MyTestingProjects/'
alias rusttest='cd ~/MyTestingProjects/rust_testings/'
alias jstest='cd ~/MyTestingProjects/javascript_testings/'
alias javatest='cd ~/MyTestingProjects/java_testings/'
alias dbtest='cd ~/MyTestingProjects/db_testings/'
alias mypj='cd ~/MyProjects/'
alias mydots='cd ~/MyCinnamonDots/'
alias phpdir='cd /var/www/html/'
alias brave='brave-browser'
alias calendar='calcurse'
alias less='less -NRX'
alias gitfiles='cd ~/MyGitFiles/'
alias rain='terminal-rain --rain-color white --lightning-color yellow'
alias lzd='lazydocker'
alias gg='google-chrome'

# =========================
# FUNCTIONS
# =========================

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# =========================
# FINAL INIT
# =========================

# colorscript -r

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Initialize zsh completions (added by deno install script)
# . "/home/nott_eucalyptus/.deno/env"

autoload -Uz compinit
compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Override the slow system handler with a fast local one
command_not_found_handler() {
    echo "zsh: $1: command not found" >&2
    return 127
}
. "/home/nottnott/.deno/env"
