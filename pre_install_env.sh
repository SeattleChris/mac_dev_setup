# shellcheck shell=bash
# Compatiblity: This script can be sourced in zsh or bash or likely others. See shebang note below.
#
# Description: Sets ENV variables wanted BEFORE many utilities are installed.
# Author: Chris Chapman
# Site: https://github.com/SeattleChris
# shebang (optional first line): `#!/usr/bin/env zsh` or `#!/usr/bin/env bash` or likely others.
#
# Sets DOTFILEDIR -- used internally and by some 'dotfiles' setups.
# Sets ZDOTDIR -- used by zsh (maybe) and oh-my-zsh.
# Sets ZSH and ZSH_CUSTOM -- used by oh-my-zsh and possibly other managers.
# Sets destinations used at time of install for: pyenv, nvm, npm, and poetry.
#  - Note: python-poetry may ignore POETRY_HOME and still use ~/.poetry
#  - [Reference](https://github.com/python-poetry/poetry/issues/2148#issuecomment-943951697)
# Sets XDG_* variables and ensures expected directories exist. See specifications and summary.
#
# Specifications [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/latest/)
# Useful summary: [XDG](https://wiki.archlinux.org/title/XDG_Base_Directory)
# * XDG_CONFIG_HOME (~/.config default, analogous to /etc)
# * XDG_CACHE_HOME (~/.cache default, analogous to /var/cache)
# * XDG_DATA_HOME (~/.local/share default, analogous to /usr/share)
# * XDG_STATE_HOME (~/.local/state default, analogous to /var/lib)
# * XDG_CONFIG_DIRS (/etc/xdg default, analogous to PATH and can be ':' delimitated)
# * XDG_DATA_DIRS (/usr/local/share:/usr/share default, also analogous to PATH)
#

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
# export NVM_BIN=  # where to install: node, npm, and global packages (for currently used node)
# export NVM_INC=  # Node's include file directory (usefule for building C/C++ addons)
# export NVM_CD_FLAGS=  # Used for maintaining zsh compatibility.
# export NVM_RC_VERSION=  # Version from `.nvmrc`` file, if it is being used.
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
export npm_config_cache="$XDG_CONFIG_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc"
export POETRY_HOME="$XDG_CONFIG_HOME/poetry"
echo "3: Set ZSH, ZSH_CUSTOM, DOTFILEDIR, nvm, npm, and poetry variables."

unset -v drs d
echo "4: Cleaned up temporary settings. Pre-install variables completed."
