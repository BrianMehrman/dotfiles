[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=/usr/local/bin:$PATH


function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}



export PS1='\u@\h \[\033[1;32m\]\w\[\033[0m\]$(parse_git_branch)$ '


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
