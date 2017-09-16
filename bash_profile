PATH=/usr/local/bin:$PATH

function git_info() {
  # check if we're in a git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # quickest check for what branch we're on
  branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

  # check if it's dirty (via github.com/sindresorhus/pure)
  dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

  echo $WHITE" on "$PURPLE$branch$dirty
}

if [ -f ~/.bash_alias ]; then
   source ~/.bash_alias
fi

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export EDITOR='subl'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# New environment setting added by AccuRev on Sat Jan 04 10:12:37 CST 2014 1.
# The unmodified version of this file is saved in /Users/bmehrman/.bash_profile1415112675.
# Do NOT modify these lines; they are used to uninstall.
PATH="${PATH}:/Users/bmehrman/Applications/AccuRev/bin"
export PATH
# End comments by InstallAnywhere on Sat Jan 04 10:12:37 CST 2014 1.

## import bashrc file ##
[[ -r ~/.bashrc ]] && . ~/.bashrc
# New environment setting added by AccuRev on Fri Jan 17 16:56:14 CST 2014 1.
# The unmodified version of this file is saved in /Users/bmehrman/.bash_profile369065089.
# Do NOT modify these lines; they are used to uninstall.
PATH="${PATH}:/Applications/AccuRev/bin"
export PATH
# End comments by InstallAnywhere on Fri Jan 17 16:56:14 CST 2014 1.

# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

LBLUE="\[\e[0;36m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
VIOLAT="\[\e[0;94m\]"
PS_CLEAR="\[\e[0m\]"

export PS1="${YELLOW}[${GREEN}\u${LBLUE}@${VIOLAT}\h${YELLOW}][${LBLUE}\w${YELLOW}]\$(parse_git_branch) ♆${PS_CLEAR} "

## Create ENV VARS

# Apache-Maven
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.1
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH

# Java Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_60.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin
# GO home
export GO_HOME=/usr/local/go/bin
export PATH=$PATH:$GO_HOME

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
