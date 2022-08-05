# mac_dev_setup

Setup a Mac with an Apple silicon CPU. This was tested on M1 MacBook Pro.

## Initial Setup

Possible Guide: [How to Set up an Apple Mac for Software Development](https://www.stuartellis.name/articles/mac-setup/)

* Startup, connect to WiFi (or some way to internet)
* Create Device User & Login (username, password to unlock); Create or Login Apple ID.
  * Apple ID required for recovery & some installs.
* Enable File Vault; Also, Time Machine Backups settings as desired.
* Optional from above Possible Guide: Securing the Safari Browser, Security & Privacy, Spotlight.
* Install [Xcode on Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
* Install [Homebrew](https://brew.sh); Update homebrew, xcode CLI, path
* Set ENV variables for XDG_CONFIG_HOME & ensure directory is made.
* Set ENV variables for Oh-my-zsh, pyenv, nvm, poetry.
* Install [Bash](https://www.shell-tips.com/mac/upgrade-bash/); Upgrade to allow Associative Arrays
* Install Git (updated compared to one automatically in MacOS and Xcode).
* Install [shellcheck](https://github.com/koalaman/shellcheck#installing)
* Install [pre-commit](https://formulae.brew.sh/formula/pre-commit)
* Install [NeoVim](https://formulae.brew.sh/formula/neovim)
* Install [iTerm2](https://formulae.brew.sh/cask/iterm2)
* Install [pygments](https://formulae.brew.sh/formula/pygments) (python colorizing) or 'chroma'
* Add upgraded bash (/opt/homebrew/bin/bash) to allowed shells (/private/etc/shells)
* enable bash completions (while using zsh).
* Git clone [dotfiles](https://github.com/SeattleChris/dotfiles.git) repo & submodules
* Install Oh-My-Zsh into .config directory.
* Copy dotfiles zsh setup files to user root.
Open terminal and execute commands:

```Shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}";
[ -d "$XDG_CONFIG_HOME" ] || mkdir -p "$XDG_CONFIG_HOME"
export ZSH=$XDG_CONFIG_HOME/oh-my-zsh
export ZSH_CUSTOM=$HOME/dotfiles/shell/custom
export PYENV_ROOT=$XDG_CONFIG_HOME/pyenv
export NVM_DIR=$XDG_CONFIG_HOME/nvm
export POETRY_HOME=$XDG_CONFIG_HOME/poetry
export npm_config_cache=$XDG_CONFIG_HOME/npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npmrc
brew doctor
brew update
brew install bash shellcheck pre-commit neovim pygments
brew install --cask iterm2
echo "/opt/homebrew/bin/bash" | sudo tee -a /private/etc/shells
autoload bashcompinit && bashcompinit
git clone git@github.com:SeattleChris/dotfiles.git "${DOTFILEDIR:-$HOME/dotfiles}" || exit
cd "${DOTFILEDIR:-$HOME/dotfiles}" || exit
git submodule update --init --recursive
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
typeset -a z_files; z_files=('zlogin' 'zprofile' 'zshenv' 'zshrc')
typeset src="${SHELLDIR:-$HOME/dotfiles/shell}" dest="${ZDOTDIR:-$HOME}"
for z in "${z_files[@]}"; do cp '-i' "${src}/${z}" "${dest}/.${z}"; done
```

## Dev Tooling

Decide which of the following needed, and install as desired:

* [Visual Studio Code](https://formulae.brew.sh/cask/visual-studio-code)
  * Or instead - [VSCodium](https://vscodium.com) replace with `brew install --cask vscodium`
* Ruby Development updates and tools (used by MacOS a lot).
* PostgreSQL
  * If you upgrade your copy of PostgreSQL, you should use the postgresql-upgrade-database command that Homebrew gives you.
* [Pyenv](https://github.com/pyenv/pyenv)
* [Node (JavaScript)]() Use `@LTS` or replace with pinned version, such as Node 16 - `@16`

```Shell
brew install --cask visual-studio-code
brew install --cask zoom
brew install autoconf automake gdbm gmp libksba libtool libyaml openssl pkg-config readline
brew install postgresql
brew install pyenv
brew install node@LTS
```

Add each of the following to Path:

```Shell
/usr/local/opt/node@16/bin
```

### Create SSH Keys

The macOS uses standard OpenSSH suite of tools.
Replace with appropriate values for content within quotes below,
for commands in a terminal:

```Shell
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh
ssh-keygen -t rsa -b 4096 -C "Me MyName (MyDevice) <me@mydomain.com>"
```

## Personal Programs

* Open another shell tab in iTerm2; install p10k recommended font.
  * Follow instructions for font install. Other p10k settings already in dotfiles configuration.
* Install [Facebook Messenger](https://formulae.brew.sh/cask/messenger)
* Install Discord

```Shell
p10k configure
brew install --cask messenger
brew install --cask discord
```
