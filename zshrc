# Explicitly configured $PATH variable
PATH=$HOME/bin:$HOME/.bin:$HOME/.pyenv/shims:${PATH}:/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin:$HOME/.bun/bin

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="xiong-chiamiov-plus"
ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	git
	macos
	zsh-syntax-highlighting
	brew 
	repo 
	sudo 
	knife
	bundler
	web-search
	bower
	colorize
	docker
	docker-compose
	github
	httpie
	man
	mvn
	node
	npm
	pip
	perl 
	postgres
	python
	rsync
	scala
	z
)

source $ZSH/oh-my-zsh.sh
[ -f "$(brew --prefix)/share/zsh/site-functions/_todoist_peco" ] && source "$(brew --prefix)/share/zsh/site-functions/_todoist_peco"

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

# Shell Aliases
## Git Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '
fbd() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

## Miscellaneous Aliases
alias htop='sudo htop'

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi
# Go paths (Go itself comes from Homebrew — see install/golang.sh)
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# Docker
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Ruby: prefer rbenv (see install/rbenv-ruby.sh), fall back to Homebrew ruby
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
elif [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Conda: activate if installed (see install/conda-python.sh)
if command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.zsh hook)"
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun completions
[ -s "/Users/rio/.bun/_bun" ] && source "/Users/rio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
