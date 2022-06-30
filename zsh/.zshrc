# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/archer/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export LANG=en_US.UTF-8
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/lib/spaceship-prompt/spaceship.zsh-theme
SPACESHIP_PROMPT_ORDER=(
   dir
    git
   #conda
    char
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
#SPACESHIP_CHAR_COLOR_SUCCESS=yellow
#SPACESHIP_CHAR_COLOR_SECONDARY=green
SPACESHIP_CHAR_SYMBOL="»"
SPACESHIP_CHAR_SUFFIX=" "

alias sudo='sudo '
alias v="nvim"
alias w="feh --bg-fill --randomize --no-fehbg ~/Pictures/WallPapers"
alias lock-screen="betterlockscreen -u Pictures/WallPapers"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias yain="yay -S"
alias yaorhp="yay -Rns $(yay -Qqtd)"
alias yar="yay -Rns"
alias yaupd="yay -Syu"
alias net="nmtui"
alias volume="pavucontrol"
alias ls='exa --color=always --group-directories-first'
alias lsal='exa -al --color=always --group-directories-first'
alias lsla='exa -al --color=always --group-directories-first'
alias lsa='exa -a --color=always --group-directories-first'
alias lsl='exa -l --color=always --group-directories-first'
alias mirrors='sudo reflector -c Ukraine -c Poland -a 12 -p https --sort rate --save /etc/pacman.d/mirrorlist'
