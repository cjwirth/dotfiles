export LANG=en_US.UTF-8

# History
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
# setopt APPEND_HISTORY
# setopt EXTENDED_HISTORY

# Don't save lines that begin with spaces
setopt HIST_IGNORE_SPACE

###############################################################################
# Prompt
###############################################################################
autoload -U colors && colors
# enable getting git info
autoload -Uz vcs_info

# always load before displaying the prompt
precmd () { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:*' enable git  # Enable git info
zstyle ':vcs_info:*' check-for-changes true  # Detect changes
zstyle ':vcs_info:*' stagedstr '^'
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' formats '@%F{magenta}%b%f%c%u'
zstyle ':vcs_info:*' actionformats '@%F{magenta}%b%f%c%u (%a)'

# The c makes it just the current directory, ~ would be expanded from home.
PROMPT='%{$fg_bold[green]%}%c%{$reset_color%}${vcs_info_msg_0_} $ '

# RPROMPT='[%D{%Y-%m-%d %H:%M:%S}]'
RPROMPT='[%D{%H:%M:%S}]'

# Makes autocomplete work in a case-insensitive way
# I don't really know how it works
# https://superuser.com/questions/1680124/macos-tab-completion-to-be-case-insensetive-terminal-zsh
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' matcher-list 'm:{A-Z}={a-z}'

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Local Tools
export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSHRC_LOCAL=$HOME/.zshrc_local
if [[ -e $HOME/.zshrc_local ]]; then
    source $ZSHRC_LOCAL
fi 

## Aliases
alias be="bundle exec"
alias bef="bundle exec fastlane"

# Git aliases
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit .'
alias gca!='git commit . --amend'
alias gc!='git commit --amend'
alias gcm='git checkout master'
alias gco='git checkout'
alias gst='git status'
alias gl='git pull'
alias ggp='git push'
alias grb='git rebase'
alias grbo='git rebase --onto'
# alias glog='git log --oneline'
alias glog="git log --date=format:'%e %b, %Y (%a)' --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cd%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph"
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

alias gunignore='git ls-files -v | grep '^S' | cut -c3- | xargs git update-index --no-skip-worktree'


# Go back and forth in shell history with prefix
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Duolingo CLI - https://github.com/duolingo/cli
. "${HOME}/.duolingo/init.sh"
