export PATH=$HOME/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin

export CDPATH=.:$HOME
export MANPATH=/usr/share/man:/usr/man:/usr/local/share/man:/usr/local/man


case $TERM in
  xterm*)
	  export PS1="\[\033]0;\w\007\]\u> "
    ;;

  *)
    export PS1="\w> "
esac


alias ls='ls -FC'
alias ll='ls -l'
alias pop='cd $OLDPWD'

export PAGER=/usr/bin/less
export EDITOR=vim
ulimit -n 32768
