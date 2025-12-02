export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/nvim-linux64/bin:/usr/local/go/bin:$HOME/.local/bin:$HOME/.go/bin:$HOME/go/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git ssh-agent golang)

zstyle :zsh-kubectl-prompt: namespace false
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent identities id_ed25519

source $ZSH/oh-my-zsh.sh

bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey '\e[H'    beginning-of-line
bindkey '\e[F'    end-of-line

eval "$(task --completion zsh)"
if [[ -f /opt/homebrew/bin/brew ]]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
    source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

export OLLAMA_HOST="10.0.0.54"
if [[ -f "$HOME/.ollama_localhost" ]]; then
    export OLLAMA_HOST="127.0.0.1"
fi

if [[ -f /opt/homebrew/bin/brew ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]]; then
    fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
    fpath+=("$HOME/.zsh/pure")
fi

autoload -U promptinit; promptinit
prompt pure

source <(fzf --zsh)

export SOPS_AGE_KEY_FILE=$HOME/.age.key

if [[ -f "$HOME/.zsh_aliases" ]]; then
    source $HOME/.zsh_aliases
fi

if [[ -d /opt/nvim-linux-x86_64 ]]; then
    export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
fi

if [[ -d /opt/nvim-linux-arm64 ]]; then
    export PATH="$PATH:/opt/nvim-linux-arm64/bin"
fi

if [[ -d "$HOME/.orbstack" ]]; then
    export DOCKER_SOCKET="$HOME/.orbstack/run/docker.sock"
fi

if [[ -d "$HOME/.cargo" ]]; then
    . "$HOME/.cargo/env"
fi

if [[ -x "$(command -v nvim)" ]]; then
    export EDITOR="nvim"
    export SUDO_EDITOR="nvim"
fi

if [ ! -f "${fpath[1]}/_helm" ] && [[ -x $(which helm) ]]; then
    helm completion zsh > "${fpath[1]}/_helm"
fi
