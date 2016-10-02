#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install GNU `tar`
brew install gnu-tar
# Install a modern version of Bash.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install version switchers
brew install pyenv
brew install pyenv-virtualenv
brew install rbenv
brew install ruby-build

# Install amazon tools
brew install awscli
brew install s3cmd

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install hub
brew install imagemagick --with-webp
brew install libyaml
brew install lua
brew install lynx
brew install mtr
brew install ngrep
brew install openssl
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install sshuttle
brew install sysdig
brew install tmux
brew install tree
brew install vagrant completion
brew install vbindiff
brew install watch
brew install zopfli

# Install cask and tap
brew install phinze/cask/brew-cask
brew tap caskroom/versions

# Install cask applications
brew cask install adobe-reader 2> /dev/null
brew cask install alfred 2> /dev/null
brew cask install dash 2> /dev/null
brew cask install diskmaker-x 2> /dev/null
brew cask install dropbox 2> /dev/null
brew cask install filezilla 2> /dev/null
brew cask install firefox 2> /dev/null
brew cask install flowdock 2> /dev/null
brew cask install google-chrome 2> /dev/null
brew cask install google-chrome-canary 2> /dev/null
brew cask install google-drive 2> /dev/null
brew cask install google-hangouts 2> /dev/null
brew cask install gpgtools 2> /dev/null
brew cask install hipchat 2> /dev/null
brew cask install intellij-idea 2> /dev/null
brew cask install joinme 2> /dev/null
brew cask install jxplorer 2> /dev/null
brew cask install mou 2> /dev/null
brew cask install onepassword 2> /dev/null
brew cask install remote-desktop-connection 2> /dev/null
brew cask install sequel-pro 2> /dev/null
brew cask install skype 2> /dev/null
brew cask install steam 2> /dev/null
brew cask install totalterminal 2> /dev/null
brew cask install tunnelblick 2> /dev/null
brew cask install vagrant 2> /dev/null
brew cask install virtualbox 2> /dev/null

# Remove outdated versions from the cellar.
brew cleanup
