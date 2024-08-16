

#---

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[07;31m\][\[\033[00m\]\[\033[00;31m\]\u\[\033[00m\]\[\033[01;41m\]@\[\033[00m\]\[\033[00;31m\]\h\[\033[00m\]\[\033[07;31m\]]\[\033[00m\] : \[\033[01;34m\]\w\a\[\033[00m\]\[\033[01;35m\]$(parse_git_branch)\[\033[00m\]
\[\033[01;35m\]3===>\[\033[00m\] \[\033[05;36m\]\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#---

# some more ls aliases
alias c='xclip -selection clipboard'
alias cp='cp -i'
alias grep='grep --color=auto'
alias ip='ip -c'
alias l='ls -CF'
alias la='ls -A'
alias li='ls -CFAa'
alias ll='ls -alFh'
alias ls='ls --color=auto'
alias mv='mv -i'
alias please='sudo'
alias rm='rm -I'

#---

echo "Who's the boss again?"

#---

# nvm config

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---

