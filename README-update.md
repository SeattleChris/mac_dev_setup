# mac_dev_setup
Setup a Mac with an Apple silicon CPU. This was tested on M1 MacBook Pro. 

## Initial Setup

Possible Guide: [How to Set up an Apple Mac for Software Development](https://www.stuartellis.name/articles/mac-setup/)

* Startup, connect to WiFi (or some way to internet)
* Create Device User & Login (username, password to unlock); Create or Login Apple ID.
  * Apple ID required for recovery & some installs.
* Enable File Vault; Also, Time Machine Backups settings as desired.
* Optional from above Possible Guide: Securing the Safarie Browser, Security & Privacy, Spotlight.
* Install [Xcode on Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
* [Install Homebrew](https://brew.sh); Update homebrew, xcode CLI, path: Open terminal and give commands: 

```Shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
brew doctor
brew update
xcode-select --install
autoload bashcompinit && bashcompinit
```

## Dev Tooling

Decide which of the following needed, and install as desired:

* [iTerm2](https://formulae.brew.sh/cask/iterm2)
* Git (upated compared to one automatically in MacOS and Xcode).
* [Visual Studio Code](https://formulae.brew.sh/cask/visual-studio-code) 
  * Or instead - [VSCodium](https://vscodium.com) replace with `brew install --cask vscodium`
* [NeoVim](https://formulae.brew.sh/formula/neovim)
* Ruby Development updates and tools (used by MacOS a lot). 
* PostgreSQL
  *  If you upgrade your copy of PostgreSQL, you should use the postgresql-upgrade-database command that Homebrew gives you.
* [Pyenv](https://github.com/pyenv/pyenv)
* [Node (JavaScript)]() Replace `<@LTS>` with appropriate version, such as Node 16 - `@16`

```Shell
brew install --cask iterm2
brew install git
brew install neovim
brew install autoconf automake gdbm gmp libksba libtool libyaml openssl pkg-config readline
brew install postgresql
brew install pyenv
brew install node<@LTS>
```

Pay attention for `===> Caveats` and consider if addtional steps are needed. For Example

"""
A CA file has been bootstrapped using certificates from the system
keychain. To add additional certificates, place .pem files in
  /opt/homebrew/etc/openssl@3/certs
and run
  /opt/homebrew/opt/openssl@3/bin/c_rehash
"""

Or flags for compilers:

```Shell
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
export LDFLAGS="-L/opt/homebrew/opt/node@16/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@16/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"
```

This likely will include adding things to Path such as the following: 

```Shell
/opt/homebrew/opt/libtool/libexec/gnubin
/usr/local/opt/node@16/bin
/opt/homebrew/opt/node@16/bin
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




