export LANG=en_US.UTF-8
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="proze"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

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
