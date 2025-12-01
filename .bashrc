export PATH=$HOME/.local/bin:/usr/local/go/bin:$HOME/bin:$HOME/go/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin

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

gfind() {
    find $1 -name $2 -exec grep -H $3 {} \;
}

gifind() {
    find $1 -name $2 -exec grep -Hi $3 {} \;
}
