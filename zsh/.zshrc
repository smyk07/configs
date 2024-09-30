# add this to ~/.zshenv 
# ZDOTDIR=~/.config/zsh

# set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit, if it's not there yet 
if [ ! -d "$ZINIT_HOME" ]; then 
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" 
fi

# source / load zinit 
source "${ZINIT_HOME}/zinit.zsh"

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz _zinit

# my plugins 
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# completion styling 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# fzf config 
export FZF_DEFAULT_OPTS='--color=spinner:#87AFFF,pointer:#87AFFF,marker:#87AFFF'

setopt promptsubst

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase 
setopt appendhistory 
setopt sharehistory
setopt hist_ignore_space 
setopt hist_ignore_all_dups 
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups
source <(fzf --zsh)

# load completions 
autoload -U compinit && compinit

# my prompt
PS1='%F{#87afff}%n@%m%f:%F{#87afff}%(5~|%-1~/⋯/%3~|%4~)%f$ '


# source my aliases and binds and built packages
source ~/.config/zsh/.zsh_aliases
source ~/.config/zsh/.zsh_binds
source ~/.config/zsh/.zsh_packages

# tmux on startup
if ! tmux has-session -t smyk 2>/dev/null; then
  command tmux new-session -ds smyk
fi

# kill io.elementary.appcenter
killall io.elementary.appcenter 2>/dev/null

# run nf on startup
neofetch
