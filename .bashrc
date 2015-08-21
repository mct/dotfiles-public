# ~/.bashrc.  Contains aliases and such for nonlogin shells
# vim:set ts=4 sw=4 et smarttab:

export LC_COLLATE=C

export GOROOT=~/golang
export GOPATH=~/go

export PATH="/home/mct/bin"
PATH="$PATH:/home/mct/junkdrawer/bin"
PATH="$PATH:/home/mct/junkdrawer/queue"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/bin"
PATH="$PATH:/sbin"
PATH="$PATH:/usr/local/games"
PATH="$PATH:/usr/games"
PATH="$PATH:/home/mct/.local/bin"
PATH="$PATH:$GOROOT/bin"
PATH="$PATH:$GOPATH/bin"

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s,bin/java,,")

#export MAIL=/var/spool/mail/mct  # use the system default
export MAILCHECK=-1
export LD_LIBRARY_PATH=/home/mct/.local/lib
#export LD_RUN_PATH=/home/mct/.local/lib
export BOOST_ROOT=/home/mct/shared/boost_1_54_0

export EDITOR="vim"
export PAGER=less
#export LESS="-Mz-2"
#export LESSCHARSET=ascii
#unset LESSCHARSET

HISTSIZE=10000
HISTFILESIZE=0
HISTFILE=/dev/null
HISTCONTROL=ignoreboth 
HOSTFILE=~/.hosts
export BC_ENV_ARGS="-q"

#export PERL5LIB=/usr/local/pkg/nuvexport-0.3/share/nuvexport

#export AWS_AUTO_SCALING_HOME=/home/mct/cf/software/aws/autoscaling
#export AWS_CREDENTIAL_FILE=/home/mct/cf/software/aws/etc/credential_file
#export AWS_ELB_HOME=/home/mct/cf/software/aws/elasticloadbalancing
#export AWS_IAM_HOME=/home/mct/cf/software/aws/iam
#export AWSSECRET=/home/mct/cf/software/aws/etc/awssecret
#export PATH=/home/mct/aws:$PATH
##
## export EC2_HOME=/home/mct/amazon/ec2-api-tools-1.5.5.0
## export AWS_AUTO_SCALING_HOME=~/git/cf/software/aws/autoscaling
##
## export AWS_AUTO_SCALING_HOME=~/git/cf/software/aws/autoscaling
## export AWS_ELB_HOME=~/git/cf/software/aws/elasticloadbalancing
## export AWS_IAM_HOME=~/git/cf/software/aws/iam
## export AWS_CREDENTIAL_FILE=~/.aws-credentials
## #export PATH=$PATH:~/git/cf/software/aws/bin
## export PATH=$PATH:~/git/cf/software/aws/autoscaling/bin
## export PATH=$PATH:~/git/cf/software/aws/elasticloadbalancing/bin
## export PATH=$PATH:~/git/cf/software/aws/iam/bin
##
## export EC2_CERT=/home/mct/certs/cert.pem
## export EC2_PRIVATE_KEY=/home/mct/certs/mct.pem
## export PATH=$PATH:~/amazon/ec2-api-tools-1.5.5.0/bin
##
## export EC2_AMITOOL_HOME=/home/mct/amazon/ec2-ami-tools-1.4.0.7
## export PATH=$PATH:~/amazon/ec2-ami-tools-1.4.0.7/bin
##
## #. ~/git/bash-completion-knife/knife
##
## # hadoop fs -ls /
## export HADOOP_HOME=~/analytics/hadoop-0.20.2-cdh3u1
## export PATH=$PATH:/home/mct/analytics/hadoop-0.20.2-cdh3u1/bin
##
## for i in ls lsr df du dus get cat
## do alias h$i="hadoop fs -$i"
## done
##
##
## export PYTHONPATH=/opt/stats/lib/python:/opt/stats/modules/logfile_db
## export PATH=$PATH:/home/mct/analytics/bin

alias 1="vim /home/mct/todo/gtd/next/onesheet"
alias xanadu=eval\ "vim \"-c ':set tw=74 ai nosi nosm nobk ruler ic bs=2 nobackup'\" ~/todo/xanadu/\$(date +%Y%m%d).gpg"
alias grep="grep --color=auto"
alias ls="ls -AF --color=auto --group-directories-first"
alias ll="ls -l"
alias lr="find -print0 | xargs -0 -x ls -ld"
lsc() { ls -C --color=yes --width $(stty size | awk '{print $NF}') "$@" | less -R; }
lss() { ls -Slr "$@" | less +G; }
alias jobs='jobs -l'
alias j=jobs
alias lpr="lpr -h"
alias tra="traceroute -I -w2 -q1"
alias tcptra="tcptraceroute -w 1"
alias pingscan="nmap -sP"
alias linebuf="stdbuf --output=L"
alias unbuf="stdbuf --output=O"
alias mosh="mosh --ssh 'ssh -v'"
alias mvi="mv -i"
alias noeof="set -o ignoreeof"
alias mdns="avahi-browse -avt"
alias cpi="cp -i"
#alias cursor="vim -s ~/.vim-quit;clear"
alias cursor="vim +:q"
alias ..="cd .."
alias ...="cd ../.."
alias rehash="hash -r"
alias shred="shred -v -u -z"
alias mplayer='mplayer -ao alsa'
alias m='fetchmail; tail -n0 -F /var/log/mail.log'
alias off="gnome-screensaver-command -l; xset dpms force off"
alias zzz="dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend"
alias NetworkManageManager=nm-connection-editor
alias open=xdg-open
alias vim="vim -X"
alias weight="vim ~/todo/weight/mct +':$ r !date +\%m/\%d/\%Y\%t'"
alias u="perl -le 'print scalar localtime \$_ for @ARGV'"
alias uu="perl -le 'print scalar gmtime \$_ for @ARGV'"
alias objdump="objdump -M intel"
alias httpshare="python -m SimpleHTTPServer"
alias vim-r="find ~  /tmp /var -name '.sw?' -o -name '.*.sw?' 2>/dev/null"
alias s="stty -ctlecho"
alias nl="nl -ba"
alias mutt=mutt-org
alias k9mutt="mutt -f ~android/Maildir/"
alias ipython="ipython --no-confirm-exit"
alias k="tail -F /var/log/kern.log"
alias sdr="screen -dr"
alias sdrj="screen -dr -e ^jj"
alias sdrx="screen -dr -e ^xx"
alias units="units -v1"
#alias pi='echo "scale=10; 4*a(1)" | bc -l'
alias pi='echo "4*a(1)" | bc -l'
alias spf="host -t txt"
alias d=dict
alias jf="systemd-journalctl -f"
alias unicode="unicode --color=yes --max=0"
alias resize='kill -WINCH $$'
alias screenshot="gnome-screenshot  --delay 1 --remove-border --window"

tag () { 
    vim "+:tag $*"
}

crypt() { perl -e 'print crypt("'$1'", "'$2'"||"aa"), "\n"'; }
title() { echo -ne "\033]0;${*:-$(hostname | cut -d. -f1) ($(tty | sed s/^.dev.//)) }\007"; }
title() { echo -ne "\033]0;${*:-$(hostname | cut -d. -f1) }\007"; }

bigboard() {
    echo 'You whisper, "bigbord", and a display is presented before you...'
    echo
    w | sort
    echo
}

gt() {(
    set -e
    when="${*:-now}"
    test "$when" = "yest" && when=yesterday
    test "$when" = "y"    && when=yesterday
    date=$(/bin/date +'%B *%e' -d "$when")
    vim ~/todo/gtd/.calendar-data/$(/bin/date +'%Y-%m' -d "$when") +1 "+/$date"
)}

google() {(
    URL="http://www.google.com/search?q=$*"
    URL=$(echo "$URL" | sed 's/ /%20/g')
    w3m $URL
)}
alias g=google

bindver() { dig version.bind txt chaos @"$@" ; }
ns() { host -t ns $* | sort -n; }

domain()
{
    for i in $*; do for j in $(echo $i | cut -d. -f1).{com,net,org}; do
        #o=$(dig $j ns +pfmin +aaonly | egrep -v '^;|^ *$' | tee /dev/tty | wc -l)
        o=$(dig $j ns +aaonly | egrep -v '^;|^ *$' | tee /dev/tty | wc -l)
        test $o -eq 0 && echo "$j: NO DNS!"
        echo
    done; done
}

mx() {(
    MXHOST=$(echo "$1" | awk -F@ '{print $NF}')
    shift;
    host -t mx "$MXHOST" "$@" | sort -n;
)}

jdig() {(
    host="$1"; shift
    for i in  \
        _xmpp-client._tcp \
        _xmpp-server._tcp \
        _jabber._tcp \
    ; do
        (set +x; dig -t srv $i."$host" +short "$@")
        #echo
    done
)}

iwreset() {
    sudo modprobe -r iwlwifi
    sleep 1
    sudo modprobe    iwlwifi
}

lastmail() {(
    tail -c ${1:-50}m ${2:-~/mail/archive} \
        | perl -ne 'next unless $from or /^From /; $from = 1; print' \
        > ~/mail/lastmail.tmp \
            && exec mutt -f ~/mail/lastmail.tmp
)}

x509() {(
    openssl x509 -text "$@" | less --quit-if-one-screen
)}
alias 509=x509

ssl() {(
    host="$1"; shift
    port="$1"; shift

    if [ -z "$host" -o -z "$port" ]
    then
        echo "Usage: ssl <host> <port>"
        exit -1
    fi

    openssl s_client -connect "$host:$port" "$@"
)}

getcert() {(
    host="$1"; shift
    port="$1"; shift

    if [ -z "$host" -o -z "$port" ]
    then
        echo "Usage: getcert <host> <port>"
        exit -1
    fi

    openssl s_client -connect "$host:$port" "$@" < /dev/null 2>&1 \
        | sed -n -e '/---BEGIN CERTIFICATE---/,/---END CERTIFICATE---/p'
)}

k9rm() {(
    for dir in $(find /home/android/Maildir/ -name cur -o -name new -o -name tmp | grep -vw -e Drafts -e .Notes)
    do
        for file in $dir/*
        do rm -fv $file
        done
    done
)}

trackers() {
    while read line
    do echo $line; echo
    done < /home/mct/todo/gtd/notes/trackers | xsel --input --clipboard
}

update() {(
    set -x
    sudo aptitude update && sudo aptitude dist-upgrade
)}

# For setting the vim background to light or dark, depending on what my mood
# is, and what background color I've selected for my terminal.  I really wish
# there was a way to query my terminal for its current background color using
# an ANSI query or something.

light() {
    echo set background=light > ~/.vim/vimrc-background
}
dark() {
    echo set background=dark > ~/.vim/vimrc-background
}


##

for i in \
    ~/dotfiles-public/.bashrc.$HOSTNAME     \
    ~/dotfiles-private/.bashrc              \
    ~/dotfiles-private/.bashrc.$HOSTNAME    \
    ~/.bashrc.$HOSTNAME                     \
;
do
    test -f $i && source $i
done
