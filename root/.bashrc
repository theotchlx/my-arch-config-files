

#---

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PROMPT_COMMAND='LAST_EXIT=$?'

PS1="\[\033[07;31m\][\[\033[00m\]\[\033[00;31m\]\u\[\033[00m\]\[\033[01;41m\]@\[\033[00m\]\[\033[00;31m\]\h\[\033[00m\]\[\033[07;31m\]]\[\033[00m\] : \[\033[01;34m\]\w\a\[\033[00m\]\[\033[01;35m\]$(parse_git_branch)\[\033[00m\]
\[\033[01;35m\]3===>\[\033[00m\] \[\033[01;33m\][\${LAST_EXIT}]\[\033[00m\]\[\033[05;36m\]#\[\033[00m\] "

#---

# some more aliases
alias c='xclip -selection clipboard'
alias cp='cp -i'
alias grep='grep --color=auto'
alias ip='ip -c'
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias li='ls -CFAa'
alias ll='ls -alFh'
alias mv='mv -i'
alias please='sudo'
alias rm='rm -I'
alias cal='cal -m'
alias ca='cal -myc auto'

#---

echo "Who's the boss again?"

#---

# nvm config

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

