#!/usr/bin/env bash
echo "Set pre-install variables. Done in 4 stages --"
typeset d=''
export ZDOTDIR="${ZDOTDIR:-$HOME}"
# export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
echo "1: Set ZDOTDIR, and XDG_*_HOME variables."

typeset -a drs=("$ZDOTDIR" "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME")
for d in "${drs[@]}"; do [ -d "$d" ] || mkdir -p "$d"; done
echo "2: Ensured those directories exist."

export DOTFILEDIR="${DOTFILEDIR:-$ZDOTDIR/dotfiles}"
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
export ZSH_CUSTOM="$DOTFILEDIR/shell/custom"
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export npm_config_cache="$XDG_CONFIG_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc"
export POETRY_HOME="$XDG_CONFIG_HOME/poetry"
echo "3: Set ZSH, ZSH_CUSTOM, DOTFILEDIR, nvm, npm, and poetry variables."

unset -v drs d
echo "4: Cleaned up temporary settings. Pre-install variables completed."
