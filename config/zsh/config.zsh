# local bin
export PATH="$HOME/.local/bin:$PATH"

# default editor
export EDITOR=/usr/bin/nvim

# opencode
export PATH=/home/${USER}/.opencode/bin:$PATH

# fzf: fuzzy find file and open with nvim
alias vf='nvim $(fzf --height 40% --layout=reverse --border)'
