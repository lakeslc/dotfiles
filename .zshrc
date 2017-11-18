alias tmux="TERM=screen-256color-bce tmux"

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    if {rvm gemdir | grep -q "@"}; then
      echo "%{$fg[red]%}$(rvm_prompt_info)%{$reset_color%}"
    fi
  fi
}

cdpath=(~/dev/)

export GOROOT=/usr/local/go
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export CDPATH=.:$GOPATH/src/github.com:$CDPATH

export EDITOR=nvim

# Setup employer specific environment
COMPANY_FILE="$HOME/.companyrc"
if [ -f $COMPANY_FILE ]; then
  . $COMPANY_FILE
fi

. ~/dotfiles/.aliasrc

# AWS cli python path
export PATH=~/Library/Python/3.5/bin/:$PATH
