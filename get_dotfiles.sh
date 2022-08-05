# shellcheck shell=bash
# Compatiblity: This script can be sourced in zsh or bash or likely others. See shebang note below.
#
# Description: Uses git to clone DOTFILEREPO and sub-modules. Copies zsh '.' configuration files
# Author: Chris Chapman
# Site: https://github.com/SeattleChris
# shebang (optional first line): `#!/usr/bin/env zsh` or `#!/usr/bin/env bash` or likely others.
#

typeset start_dir="$PWD"
typeset DOTFILEREPO="${DOTFILEREPO:-git@github.com:SeattleChris/dotfiles.git}"
typeset DOTFILEDIR="${DOTFILEDIR:-$HOME/dotfiles}"
git clone "$DOTFILEREPO" "$DOTFILEDIR"  '--recurse-submodules --remote-submodules'
# If recursive clone failed --
# cd "$DOTFILEDIR" || exit
# git submodule update --init --recursive
typeset -a z_files; z_files=('zlogin' 'zprofile' 'zshenv' 'zshrc')
typeset src="${SHELLDIR:-$HOME/dotfiles/shell}" dest="${ZDOTDIR:-$HOME}"
for z in "${z_files[@]}"; do cp '-i' "${src}/${z}" "${dest}/.${z}"; done
unset -v z_files src dest z
cd "$start_dir" || echo "unable to return to $start_dir "
