# Init starship prompt
starship init fish | source

# Init zoxide
zoxide init fish | source

# Greeting 
# function fish_greeting
#     colorscript -r
# end

function fish_command_not_found
    __fish_default_command_not_found_handler $argv
end

set fish_greeting ""

# Yazi function to update PWD
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Set universal env variables
set -gx FZF_DEFAULT_OPTS \
    '--color=fg:#ebdbb2,bg:#1d2021,hl:#b16286' \
    '--color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b' \
    '--color=info:#d65d0e,prompt:#458588,pointer:#fe8019' \
    '--color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f'

set -gx fish_user_paths ~/.config/composer/vendor/bin $fish_user_paths

set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
set -gx PATH $JAVA_HOME/bin $PATH

# set -gx MAVEN_OPTS "--enable-native-access=ALL-UNNAMED"
set -x MAVEN_OPTS "--sun-misc-unsafe-memory-access=allow --enable-final-field-mutation=ALL-UNNAMED"

# Set global env variables
#set -gx ANDROID_HOME ~/Android/Sdk
set -gx EDITOR nvim
#set -gx TERM xterm-kitty
set -gx ZED_WINDOW_DECORATIONS server

# Set FZF behavior
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set -gx FZF_CTRL_T_OPTS '
  --walker-skip .git,node_modules,target
  --preview "bat -n --color=always {}"
  --bind "ctrl-/:change-preview-window(down|hidden|)"'

set -gx FZF_CTRL_R_OPTS '
  --color header:italic
  --header "find the command"'

set -gx FZF_ALT_C_OPTS '
  --walker-skip .git,node_modules,target
  --preview "eza --icons --tree --color=always {}"'

# FZF key bindings
fzf --fish | source

# Aliases
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
alias mytest='cd ~/Testings/'
alias rusttest='cd ~/Testings/rust_testings/'
alias jstest='cd ~/Testings/javascript_testings/'
alias javatest='cd ~/Testings/java_testings/'
alias dbtest='cd ~/Testings/db_testings/'
alias mypj='cd ~/Projects/'
alias mydots='cd ~/MyHyprDots/'
alias phpdir='cd /var/www/html/'
alias brave='brave-browser'
alias calendar='calcurse'
alias less='less -NRX'
alias gitfiles='cd ~/MyGitFiles/'
alias rain='terminal-rain --rain-color white --lightning-color yellow'
alias lzd='lazydocker'
alias gg='google-chrome'

# Optional: for interactive-specific commands
if status is-interactive
    # Interactive session setup
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Fish vi key bindings
fish_vi_key_bindings

# pnpm
set -gx PNPM_HOME "/home/nott_eucalyptus/.local/share/pnpm"

if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# opencode
fish_add_path /home/nott_eucalyptus/.opencode/bin

set --universal nvm_default_version latest

export PATH="/home/nottnott/.lando/bin:$PATH"
#landopath
