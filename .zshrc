# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
#export LANG="ru_RU.UTF-8"
#export LC_COLLATE="ru_RU.UTF-8"
#export LC_CTYPE="ru_RU.UTF-8"
#export LC_MESSAGES="ru_RU.UTF-8"
#export LC_MONETARY="ru_RU.UTF-8"
#export LC_NUMERIC="ru_RU.UTF-8"
#export LC_TIME="ru_RU.UTF-8"
#export LC_ALL="ru_RU.UTF-8"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

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
plugins=(rails ruby bundler capistrano gem osx zeus ssh-agent rake brew rbenv command-not-found compleat composer cp history history-substring-search git-remote-branch git git-flow git-extras github pow)

HISTSIZE=100000
HISTFILESIZE=200000
TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

 # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

PATH=$PATH:$HOME/bin
PATH="$PATH:/usr/local/sbin"
PATH="/opt/chefdk/bin:$PATH"

myfind() {
  find . -type f \( -name "*.rb" -or -name "*.erb" -or -name "*.rss" -or -name "*.xml" -or -name "*.slim" -or -name "*.haml" -or -name "*.js" -or -name "*.coffee" -or -name "*.ejs" -or -name "*.jst" -or -name "*.eco" -or -name "*.css" -or -name "*.sass" -or -name "*.scss" -or -name "*.yml" -or -name "*.vim" -or -name "*.rabl" -or -name "*.builder"  -or -name "*.txt" \)  -exec grep -l "$1" {} \;
}
alias f=myfind

alias r='rails'
alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias rollback='rake db:rollback && rake db:rollback RAILS_ENV=test'
alias g='git status'
alias gd='git diff head --color'
alias finalize='git rebase --interactive --autosquash develop'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s - %C(bold blue)%an%Creset, %Cgreen%cr' --abbrev-commit"
alias gph="git push origin HEAD"
alias gu="git-up" # https://github.com/aanand/git-up
alias gm='git merge --no-ff'

fpath=(path/to/zsh-completions/src $fpath)
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

git_commit_m() {
  git add -A && git commit -m "$1"
}
alias gcm=git_commit_m
alias gcma='git commit -a --amend --no-edit'

git_delete_branch() {
  git branch -d $1 && git push origin :$1
}
git_delete_branch_force() {
  (git branch -D $1 && git push origin :$1) || git push origin :$1
}
git_branches_clear() {
  git branch -d $(git branch --merged | grep -v -E 'master|develop')
}
alias gbd=git_delete_branch
alias gbdf=git_delete_branch_force
alias gbclear=git_branches_clear

alias caravan="ssh devops@94.77.64.80"
alias linode="ssh devops@176.58.123.252"
alias nostradamus='ssh devops@176.58.113.204'

alias uptimus='cd ~/Projects/uptimus'
alias pumba='cd ~/Projects/pumba'
alias nala='cd ~/Projects/nala'
alias pluto='cd ~/Projects/plutonium'
alias builder='cd ~/Projects/reenter_builder'
alias sidekiq='bundle exec sidekiq --config ./config/sidekiq.yml'

export SEED_REGIONS='true'
export NOT_AUTO_MIGRATE='true'
export GUARD_NOTIFICATION='true'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Rbenv
export RBENV_ROOT=$HOME/.rbenv
eval "$(rbenv init -)"

#-------------------------------------------------------------------------------
# change colorscheme of terminal on ssh connect
#-------------------------------------------------------------------------------
function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi # if you have trouble with this, change
                                                      # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

function colorssh() {
  tabc SSH
  ssh $*
  tabc
}

alias ssh="colorssh"
