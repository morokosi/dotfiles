#
# basic settings
#
#limit coredumpsize 0
umask 022

host=`echo $HOST | sed 's/[0-9]//g'`

#
# path
# 
case $OSTYPE in
    linux*) # Linux
	mybin=(~/bin/i486-linux)
	osbin=(/usr/games)
	sbin=(/usr/sbin /sbin /usr/local/sbin)
	x11bin=(/usr/X11R6/bin)
	if [ `uname -m` = x86_64 ]; then
	    x86_64bin=(~/bin/x86_64-linux ~/opt/local64/bin)
	    #~/work/clang+llvm-3.4-x86_64-unknown-ubuntu12.04/bin 
	fi
        ;;
esac

path=($tile_bin $x86_64bin  ~/opt/local/bin ~/bin/common $mybin /usr/local/bin $osbin $x11bin /usr/bin /bin $sbin)

export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$HOME/work/clang+llvm-3.4-x86_64-unknown-ubuntu12.04/lib:$LD_LIBRARY_PATH"
#
# common Environment Variables
#
export EDITOR=vim
export TZ=JST-9
export LV='-Ou8'
export TERM=xterm-256color
#export SHELL=/bin/zsh

#
# Environment Variables for each OS type
#
case $OSTYPE in
    linux*)
	if [ x$host != xrmc -a $HOST != oscar111 ]; then
	    export LC_ALL=C
	    export LC_TIME=C
	    export LC_CTYPE=C
	    export LANG=ja_JP.UTF-8
	    export PAGER=/usr/bin/less LESSCHARSET=utf-8
        fi 
        ;;
esac
