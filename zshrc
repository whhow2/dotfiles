if [ -f $HOME/.ssh/id_ed25519 ]; then
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
clear
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.local/share/applications:$HOME/.cargo/bin:$HOME/.config/emacs:$HOME/.emacs.d/bin:$HOME/.dotnet:$HOME/.dotnet/tools:$PATH:$HOME/.pyenv/bin
export PATH="$PATH:/opt/nvim-linux64/bin"
# export DOTNET_ROOT=$HOME/.dotnet/
export DOTNET_ROOT=/usr/local/share/dotnet/

# neofetch

export PYTHONPATH=/usr/bin/python3
if [ -f ~/Library/Python/3.11/bin ]; then
export PYTHONPATH=$(brew --prefix)/lib/python3.11/site-packages:$PYTHONPATH
export PATH=$PATH:~/Library/Python/3.11/bin
fi
export PYENV_ROOT=$HOME/.pyenv
eval "$(pyenv init - )"
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_VIRTUALENV=$(which virtualenv)
export PYENV_VIRTUALWRAPPER_PREFER_PYENV="true"
[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh
#  source /usr/local/bin/virtualenvwrapper.sh
#   source $HOME/.local/bin/virtualenvwrapper.sh
[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ] && source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
[ -f "$HOME/.local/bin/virtualenvwrapper.sh" ] && source "$HOME/.local/bin/virtualenvwrapper.sh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#xterm settings
TERM=xterm-kitty

#default to neovim
#alias vim="nvim"
alias vi="vim"
#alias oldvim="\vim"

#wxWidgets
export WX_CONFIG=/usr/local/x86_64/bin/wx-config

#tmux
##general tmux session
alias general="tmux new-session -A -s main"

##development tmux session
alias dev="tmux new-session -A -s dev"

#browser-sync
alias serve='browser-sync start --directory --server --files "*.js, *.html, *.css"'

# edit vim config
alias vivim="vi ~/dotfiles/vimrc"

# cd to vimconfig
alias cdvim="cd ~/vimfiles"

#cd to nvim config
alias cdnvim="cd ~/dotfiles/nvim/lua/will"

#open .zshrc config
alias vizsh="vi ~/.zshrc && source ~/.zshrc"

#source .zshrc config
alias srczsh="source ~/.zshrc"

#open kitty.conf
alias vikit="vi ~/.config/kitty/kitty.conf"

#open i3 config
alias vi3="vi ~/.config/i3/config"

#open polybar
alias vipbar="vi ~/.config/polybar/config.ini"

#change to obsididian directory
alias cdobs="cd ~/Documents/obsidian-vault"

## change to dotfiles directory
alias cddot='cd ~/dotfiles'

## run xmodmap config
alias xm='xmodmap ~/.Xmodmap'

## change to config folder
alias cdconf='cd ~/.config/'

## change to dev folder
alias cddev='cd ~/dev'

## change to downloads folder
alias cddown='cd ~/Downloads/'

## change to documents folder
alias cddoc='cd ~/Documents/'

## update fedora packages
alias fedup='sudo dnf update && sudo dnf upgrade'

## debian based update
alias upg='sudo apt update && sudo apt upgrade'

## pip3 to pip alias
alias pip='pip3'


#fzf setup
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

#node version manager
# source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
