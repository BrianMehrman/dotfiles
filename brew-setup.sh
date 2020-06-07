#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if [ ! $(xcode-select -p) ]
then
  xcode-select --install
fi

if [ "$(uname -s)" == "Darwin" ]
then
  echo "Updating Mac OS X."
  softwareupdate --install --all

  # Check for Homebrew
  if [ ! $(which brew) ]
  then
    echo "  Installing Homebrew for you."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  echo "brew doctor"
  brew doctor

  brew cask install \
    java

  # Install homebrew packages
  echo "brew install"
  brew install \
    imagemagick \
    git \
    git-hooks \
    libyaml \
    node \
    nvm \
    openssl \
    postgresql@9.6 \
    reattach-to-user-namespace \
    ruby-build \
    the_silver_searcher \
    kubectl \
    kustomize \
    skaffold

  # Install homebrew casks
  echo "brew cask install"
  brew cask install \
    docker

  echo "brew update"
  brew update

  echo "brew upgrade --all"
  brew upgrade

  echo "brew cleanup"
  brew cleanup

  echo "Install rvm or rbenv (whichever you prefer):"
  echo "curl -L https://get.rvm.io | bash -s stable --ruby=ruby-`cat .ruby-version`"
  echo "or"
  echo "brew install rbenv"
  echo "rbenv install `cat .ruby-version`"
else
  echo "Unsupported OS! (for now)"
fi

exit 0
