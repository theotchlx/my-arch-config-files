#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;35m\]$(parse_git_branch)\[\033[00m\]\$ '
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

# more path to PATH
PATH=$PATH:$HOME/.local/bin  # For programs such as AppImages or untared stuff
PATH=$PATH:$HOME/tabber  # For my tabber program

#---

happenstance=$(( (RANDOM % 12) + 1 ))
if [ "$happenstance" -eq 1 ]; then
	cows=('' '-b' '-d' '-f dragon' '-f elephant' '-f kitty' '-f moose' '-f stegosaurus' '-f turtle' '-f tux' '-f vader' '-f blowfish' '-f flaming-sheep')
	cow_of_fate=${cows[$RANDOM % ${#cows[@]}]}
	figlet -c WELCOME BACK YOU STUPID BASTARD! |pv -qL 100 &&figlet -cf digital how\'s it going? |pv -qL 100 ; fortune |cowsay $cow_of_fate |pv -qL 200
fi

#---

echo "Who's the boss?"

#---

# Load Angular CLI autocompletion.
source <(ng completion script)

# pnpm
export PNPM_HOME="/home/theo-tchlx/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#---

# nvm config

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#---

