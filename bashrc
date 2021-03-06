#!/bin/bash
# A nice pretty bash environment.
#
# Gray Manley with help from Ryan Tomayko and the internet.

# the basics
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# complete hostnames from this file
: ${HOSTFILE=~/.ssh/known_hosts}

# readline config
: ${INPUTRC=~/.inputrc}

# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

# Enables cd to correct minor typos ie. 'mkdir /foo && cd /foe && pwd' => /foo
shopt -s cdspell >/dev/null 2>&1
# Extended pattern matching ie. 'ls -d !(*gif|*jpg)' shows everything except jpg and gif.
shopt -s extglob >/dev/null 2>&1
# Append command history when using multiple shells instead of overwriting it.
shopt -s histappend >/dev/null 2>&1
# Allow tab completion of hosts found in $HOSTFILE which in this case is ~/.ssh/known_hosts
shopt -s hostcomplete >/dev/null 2>&1
# Don't attempt to tab complete without a preceding command.
shopt -s no_empty_cmd_completion >/dev/null 2>&1

# Notify of background job completion.
set -o notify

# Set default umask
umask 0022

# Tab complete with sudo as well
complete -cf sudo

# Homebrew installed bash completion is better
# /etc/bash_completion automatically sources ~/.bash_completion if it exists.
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Homebrew Bash Completion
if [ -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]; then
  . `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi

[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion # RVM Shell Completion

# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------

# we want the various sbins on the path along with /usr/local/bin
export PATH="/usr/local/sbin:/usr/sbin:/usr/local/bin:$PATH"

# I like to put my various aliases in a seperate file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# ----------------------------------------------------------------------
# ENVIRONMENT CONFIGURATION
# ----------------------------------------------------------------------

# detect interactive shell
case "$-" in
  *i*) INTERACTIVE=yes ;;
  *)   unset INTERACTIVE ;;
esac

# detect login shell
case "$0" in
  -*) LOGIN=yes ;;
  *)  unset LOGIN ;;
esac

# enable en_US locale w/ utf-8 encodings if not already configured
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

# always use PASSIVE mode ftp
: ${FTP_PASSIVE:=1}
export FTP_PASSIVE

# Don't list the same command more then once in history
HISTCONTROL=ignoreboth
HISTFILESIZE=10000
HISTSIZE=10000

ssh-add

# -------------------------------------------------------------------
# MOTD
# -------------------------------------------------------------------

test -n "$INTERACTIVE" -a -n "$LOGIN" && {
  uname -prs
  uptime
}
[[ -s "/Users/bmehrman/.rvm/scripts/rvm" ]] && source "/Users/bmehrman/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:/usr/local/bin # homebrew - here for non-interactive shell

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
