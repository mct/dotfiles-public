# ~/.bash_profile: executed by bash(1) for login shells.

test -f ~mct/.bashrc && source ~mct/.bashrc

stty -ixon
stty flush ^O
stty -echoctl
#eval $(resize)

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#PS1='${WINDOW}[\u@\h \w]\$ '
PS1='${WINDOW}[\u@\h \w$(parse_git_branch)]\$ '
PS2="Continue> "

ulimit -c 0
umask 022
title

echo;
bigboard
#pom; echo
screen -ls

#test -f ~mct/.agent && . ~mct/.agent
#if [ -n "$SSH_AGENT_PID" ] && \
#   [ -f /proc/$SSH_AGENT_PID/cmdline ] && \
#   grep -qa ^ssh-agent /proc/$SSH_AGENT_PID/cmdline
#then
#        echo Agent pid $SSH_AGENT_PID already running
#else
#        eval $(ssh-agent)
#        echo "export SSH_AGENT_PID=\"$SSH_AGENT_PID\""  > ~mct/.agent
#        echo "export SSH_AUTH_SOCK=\"$SSH_AUTH_SOCK\"" >> ~mct/.agent
#fi
#echo

# echo "Lease expires in:  $(datediff 8/31)"
# echo

#vim-r;echo

# Ignore ^D in fist screen only
if [ "$WINDOW" = 0 -a $(id -u) != 0 ]
then set -o ignoreeof
else set +o ignoreeof
fi

#shopt -s checkwinsize
