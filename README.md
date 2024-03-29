# mac_dev_setup

Setup a Mac with an Apple silicon CPU. This was tested on M1 MacBook Pro.

## Initial Setup

Possible Guide: [How to Set up an Apple Mac for Software Development](https://www.stuartellis.name/articles/mac-setup/)

* Startup, connect to WiFi (or some way to internet)
* Create Device User & Login (username, password to unlock); Create or Login Apple ID.
  * Apple ID required for recovery & some installs.
* Enable File Vault; Also, Time Machine Backups settings as desired.
* Optional from above Possible Guide: Securing the Safari Browser, Security & Privacy, Spotlight.
* Decide on directory for '.' files and dotfiles repo -- Possibly prepending source command.
  * Example: use destination directory `~/dots` and place repo in `~/dot_src`
    -- `ZDOTDIR="$HOME/dots" && DOTFILEDIR="$HOME/dot_src" && source pre_install_env.sh`
    Will place `~/dot_src` for repo and `~/dots/.zshrc`, `~/dots/.zshenv`, etc for setup files.
* Get a local copy of `pre_install_env.sh` file (by git clone, or simply copy & paste)
* Set some pre-install env variables with `pre_install_env.sh`:
  1) Some [XDG](https://wiki.archlinux.org/title/XDG_Base_Directory) -- see comments in file.
  2) Ensure those directories exist.
  3) Set ENV variables for Oh-my-zsh, pyenv, nvm, poetry.
     * Note: python-poetry may use ~/.poetry [SOURCE](https://github.com/python-poetry/poetry/issues/2148#issuecomment-943951697)
* Install Xcode by cli or [App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
* Install [Homebrew](https://brew.sh); Update homebrew, xcode CLI, path
* Install [Bash](https://www.shell-tips.com/mac/upgrade-bash/); Upgrade to get Associative Arrays
* Install Git (updated compared to one automatically in MacOS and Xcode).
* Install [shellcheck](https://github.com/koalaman/shellcheck#installing)
* Install [pre-commit](https://formulae.brew.sh/formula/pre-commit)
* Install [NeoVim](https://formulae.brew.sh/formula/neovim)
* Install [iTerm2](https://formulae.brew.sh/cask/iterm2)
* Install [pygments](https://formulae.brew.sh/formula/pygments) (python colorizing) or 'chroma'
* Add upgraded bash (/opt/homebrew/bin/bash) to allowed shells (/private/etc/shells)
* enable bash completions (while using zsh).
* Download & run Oh-My-Zsh install (into .config directory, assuming `pre_install_env.sh` worked)
* Get and use settings from dotfiles repo with `get_dotfiles.sh`
  * Uses git to clone $DOTFILEREPO into ${DOTFILEDIR:-$HOME/dotfiles} directory.
  * The default for DOTFILEREPO is [dotfiles](https://github.com/SeattleChris/dotfiles.git)
  * Can override. e.g. `typeset DOTFILEREPO="https://repo-url.com/path/to/repo"`
  * Also clones sub-modules and updates them.
  * Copies zsh config files:
    * from ${SHELLDIR:-$HOME/dotfiles/shell}/{{name}} to ${ZDOTDIR:-$HOME}/.{{name}}
    * for each 'name' of files: zshenv zprofile zshrc zlogin

Open terminal and execute commands:

```Shell
source pre_install_env.sh
xcode-select —-install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
brew update
brew install bash shellcheck pre-commit neovim pygments
brew install --cask iterm2
echo "/opt/homebrew/bin/bash" | sudo tee -a /private/etc/shells
autoload bashcompinit && bashcompinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source get_dotfiles.sh
```

* Consider using GitHub's credential manager
  * [GitCredentialManager](https://github.com/GitCredentialManager/git-credential-manager)
  * likely fine using osX default: `credential.helper=osxkeychain`
* Shutdown terminal app and restart to use the new zsh initialization files.
* Open another shell tab in iTerm2; install p10k recommended font.
  * Follow instructions for font install. Other p10k settings already in dotfiles configuration.

## Dev Tooling

Decide which of the following needed, and install as desired:

* [Visual Studio Code](https://formulae.brew.sh/cask/visual-studio-code)
  * Or instead - [VSCodium](https://vscodium.com) replace with `brew install --cask vscodium`
  * May need to install font for vs-code terminal to match font installed by p10k.
* Ruby Development updates and tools (used by MacOS a lot).
* PostgreSQL
  * If you upgrade your copy of PostgreSQL, you should use the postgresql-upgrade-database command that Homebrew gives you.
* Install [Pyenv](https://github.com/pyenv/pyenv)
* Install [NVM](https://github.com/nvm-sh/nvm)
  * Default: [zsh-nvm](https://github.com/lukechilds/zsh-nvm) - Using plugin repo as sub-module.
  * With Brew: `brew install nvm` (not supported by nvm directly)
  * Instructions from [NVM Repo](https://github.com/nvm-sh/nvm)
    * `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash`
* [Node using NVM](https://github.com/nvm-sh/nvm) Use `@LTS` or pinned version, e.g. `@16`

```Shell
brew install --cask visual-studio-code
brew install --cask zoom
brew install autoconf automake gdbm gmp libksba libtool libyaml openssl pkg-config readline
brew install postgresql
brew install pyenv
nvm install --lts
```

Add each of the following to Path:

```Shell
# /usr/local/opt/node@16/bin
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

* Install [Facebook Messenger](https://formulae.brew.sh/cask/messenger)
* Install Discord

```Shell
p10k configure
brew install --cask messenger
brew install --cask discord
```

## Resources of patterns from Linux

* Useful [Zsh resource](https://wiki.archlinux.org/title/Zsh)
* Linux [Environment Variables](https://wiki.archlinux.org/title/Environment_variables)
