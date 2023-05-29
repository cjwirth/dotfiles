export LANG=en_US.UTF-8
# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="proze"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git macos)

# source $ZSH/oh-my-zsh.sh

# User configuration

# Prompt
autoload -U colors && colors
PROMPT="%{$fg[magenta]%}%n%{$reset_color%} %{$fg_bold[green]%}%~%{$reset_color%} $ "
RPROMPT='[%D{%Y-%m-%d %H:%M:%S}]'

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Local Tools
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# This is useful
sum() { awk '{ sum += $1 } END { print sum }' }

ZSHRC_LOCAL=$HOME/.zshrc_local
if [[ -e $HOME/.zshrc_local ]]; then
#    echo "Loading local config ($ZSHRC_LOCAL)"
    source $ZSHRC_LOCAL
fi 

encrypt() { gpg2 --symmetric --armor --force-mdc --batch -o $PWD/$2 $PWD/$1 }
decrypt() { gpg2 --decrypt --batch -o $PWD/$2 $PWD/$1 }

alias gittree='git log --oneline --graph --decorate --all'
alias prettyjson="pbpaste | jq -S '.' | pbcopy"
alias minijson="pbpaste | jq -c '.' | pbcopy"

# Show the latest updated date of all the files in the current directory
_git-ls() {
    for gitfile in $(git ls-tree --name-only HEAD);
    do
        echo "$( git log -1 --format="%ad %ae" --date=iso -- $gitfile ) $gitfile"
    done
}
git-ls() {
    _git-ls | column -t
}
timestamp() {
    date +%s
}

## Copy the oh-my-zsh custom directory into the submodule
update-oh-my-zsh-custom() {
    rm -rf ~/.oh-my-zsh/custom
    cp -r ~/dotfiles/oh-my-zsh.custom ~/.oh-my-zsh/custom
}

## Aliases
alias xcode="open -a '/Applications/Xcode.app'"
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
