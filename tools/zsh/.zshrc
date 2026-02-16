# ==== Plugins ====
autoload -Uz compinit
compinit

# ==== Configuration ====
zstyle ':completion:*' menu select

# ==== Aliases ====
alias '..'='cd ..'
alias 'g'='git'
alias 'l'='ls'
alias 'll'='ls -l'
alias 'vi'='nvim'

# ==== Environment ====
PROMPT='%F{green}%# %~ %F{255}'
EDITOR='neovim'

