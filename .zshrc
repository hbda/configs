# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="amuse"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
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

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby bundler capistrano gem osx zeus rvm ssh-agent rake brew command-not-found compleat composer cp history history-substring-search git-remote-branch git git-flow git-extras github pow)

HISTSIZE=100000
HISTFILESIZE=200000
TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
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

# RVM
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source /home/yoda/.rvm/scripts/rvm

alias r='rails'
alias g='git status'
alias finalize='git rebase --interactive --autosquash develop'
#alias gl='git log --pretty=format:"%Cred%h%Creset %ad | %s%d [%an]" --graph --date=short'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gput="git push origin HEAD"
#alias gup="git pull --rebase --stat"
alias gu="git-up" # https://github.com/aanand/git-up
alias ll='ls -l'
#alias hetzner='ssh -t morr@178.63.23.138 zsh'
alias files='find . -maxdepth 1 -type f | wc -l'
alias update='git add -A && git commit -m "updates"'
alias bugfix='git add -A && git commit -m "bugfixes"'
#alias deploy='git push origin master && git push origin develop && cap deploy'
#alias deploy='git push origin develop && cap production deploy'
fpath=(path/to/zsh-completions/src $fpath)
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
git_commit_m() {
git add -A && git commit -m "$1"
}
alias gcm=git_commit_m
myfind() {
find . -type f \( -name "*.rb" -or -name "*.erb" -or -name "*.rss" -or -name "*.xml" -or -name "*.slim" -or -name "*.haml" -or -name "*.js" -or -name "*.coffee" -or -name "*.ejs" -or -name "*.jst" -or -name "*.eco" -or -name "*.css" -or -name "*.scss" -or -name "*.yml" -or -name "*.vim" -or -name "*.rabl" -or -name "*.builder" -or -name "*.txt" \) -exec grep -l "$1" {} \;
}
alias f=myfind
#alias fvim="mvim \`myfind $1\`"
grep_find() {
fgrep -ir "$1" .
}
alias gr=grep_find
git_delete_branch() {
git branch -d $1 && git push origin :$1
}
git_delete_branch_force() {
(git branch -D $1 && git push origin :$1) || git push origin :$1
}
alias gbd=git_delete_branch
alias gbdf=git_delete_branch_force
#alias mvim=/usr/local/Cellar/macvim/7.3-65/MacVim.app/Contents/MacOS/MacVim
#source ~/.profile
#rvm use 2.1
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#EDITOR=/usr/local/Cellar/macvim/7.3-65/MacVim.app/Contents/MacOS/MacVim
