alias n=nvim
alias open=explorer.exe
alias cp='cp -i'
alias mv='mv -i'
alias myip='curl ifconfig.me'
alias pingg='ping google.com'
alias rm='rm -i'
alias cdh=cd /home/father

# Git
alias gdd='git add .'
alias gpushd='git push origin dev'
alias gpushm='git push origin master'
alias grep='grep --color=auto'
alias gst='git status'
alias gpull='git checkout master && git fetch && git pull && git checkout dev && git merge master && git push origin dev'
alias aicom='python CommitPilot/auto_commit.py -c'
alias aipush='python CommitPilot/auto_commit.py'

# Servers
alias smk='ssh root@45.153.68.101'
alias smkbit='ssh bitrix@45.153.68.101'
alias uroven='ssh devuser@5.129.203.17'
alias kargo='ssh bitrix@5.129.192.159'
alias kargoroot='ssh root@5.129.192.159'
alias durv='ssh devuser@5.129.203.177'
alias urv='ssh produser@93.183.82.23'

# Others
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'


# History
alias hist='history | grep'
alias h='history'

#alias pbcopy="win32yank.exe -i"

# Функия для коммита без ковычек использя alias
gcom() {
    if [[ $# -eq 0 ]]; then
        echo "Ошибка: Нет сообщения для коммита"
        return 1
    fi
    git commit -m "$@"
}

# Password generator
pwgen() {
  local len=${1:-20}
  LC_ALL=C tr -dc 'A-Za-z0-9@#%^&*()_+=-{}[]:;<>,.?/' < /dev/urandom | head -c "$len" | xargs echo
}