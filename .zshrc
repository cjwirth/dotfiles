export LANG=en_US.UTF-8

# Prompt
autoload -U colors && colors
PROMPT="%{$fg[magenta]%}%n%{$reset_color%} %{$fg_bold[green]%}%~%{$reset_color%} $ "
RPROMPT='[%D{%Y-%m-%d %H:%M:%S}]'

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
alias glog='git log --oneline'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'


# Go back and forth in shell history with prefix
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Duolingo CLI - https://github.com/duolingo/cli
. "${HOME}/.duolingo/init.sh"
