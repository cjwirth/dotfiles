export LANG=en_US.UTF-8

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Ruby
if which rbenv > /dev/null; then
  eval "$(rbenv init - --no-rehash zsh)"
fi

# Python
if which pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)";
fi

# Node
if which nodenv > /dev/null; then
  export PATH="$HOME/$(npm get prefix)/bin:$PATH"
  eval "$(nodenv init -)";
fi


# Java
if which jenv > /dev/null; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Swift Mint (not exactly the same)
export PATH="$PATH:$HOME/.mint/bin"

ZPROFILE_LOCAL=$HOME/.zprofile_local
if [[ -e $HOME/.zprofile_local ]]; then
    source $ZPROFILE_LOCAL
fi