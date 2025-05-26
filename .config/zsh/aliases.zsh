alias cls=clear
alias n=nvim
alias open=explorer.exe
alias cp='cp -i'
alias mv='mv -i'
alias myip='curl ifconfig.me'
alias pingg='ping google.com'
alias rm='rm -i'
alias smk='ssh root@45.153.68.101'
alias smkbit='ssh bitrix@45.153.68.101'
alias cdh=cd /home/father
alias gdd='git add .'
#alias pbcopy="win32yank.exe -i"

# Password generator
pwgen() {
  local len=${1:-20}
  LC_ALL=C tr -dc 'A-Za-z0-9@#%^&*()_+=-{}[]:;<>,.?/' < /dev/urandom | head -c "$len" | xargs echo
}

