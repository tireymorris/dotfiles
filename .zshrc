# Load version control information
# autoload -Uz vcs_info
# precmd() { vcs_info }

# autostart x at login
if $(command -v systemctl &> /dev/null) && systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi


# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt
# unsetopt PROMPT_SP
# setopt PROMPT_SUBST
# PROMPT="%F{green}%n@%m%F{black}%B:%b%F{yellow}%~ %f\$vcs_info_msg_0_%F{magenta}
# %(!.#.$)%f " 

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=999999
SAVEHIST=999999
setopt appendhistory

# set defaults
export EDITOR='nvim'
export BROWSER='/usr/bin/google-chrome-stable'
export LC_ALL=en_US.utf8
export LANG=en_US.utf8

ssh_accept() {
    ssh-keyscan -H $1 >> $HOME/.ssh/known_hosts
}


# Keybinds
bindkey -e
bindkey '^R' history-incremental-search-backward # ctrl+r
bindkey "^[[1;5C" forward-word # ctrl+right
bindkey "^[[1;5D" backward-word # ctrl+left
bindkey "\e[3~" delete-char  # delete key
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line


function cheat {
    curl cheat.sh/$1
}

function st {
    stat -c %s $1 | numfmt --to=iec
}

function pacclean { 
    while ! [ "$(pacman -Qdtq)" = "" ]; do 
        sudo pacman -Rn $(sudo pacman -Qdtq); 
        done
    sudo pacman -Scc
}

function pacdate {
    for i in $(pacman -Qq)
    do
      grep "\[ALPM\] installed $i" /var/log/pacman.log
    done | \
      sort -u | \
      sed -e 's/\[ALPM\] installed //' -e 's/(.*$//'
}

# Common aliases
#alias fuck='thefuck --yeah $(fc -ln -1)'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ap='ansible-playbook'
alias b='brightnessctl s'
alias blu='redshift -x && redshift -O 6000'
alias brewbak='brew bundle dump -f --file ~/.dotfiles/Brewfile'
alias brewci='brew install --cask'
alias brewcu='brew uninstall --cask'
alias brewi='brew install'
alias brewu='brew uninstall'
alias brewrestore='brew bundle --file ~/.dotfiles/Brewfile'
alias brews='brew search'
alias brewup='brew update && brew update --cask && brew upgrade && brew upgrade --cask'
alias brewwipe='brew uninstall --force $(brew list --formula) --ignore-dependencies; brew uninstall --force --cask $(brew list --cask); brew cleanup'
alias cdw='cd $HOME/workspace'
alias cheat='cheat'
alias checkip='curl -s https://checkip.amazonaws.com'
alias clinks='cp $HOME/.links/* $HOME/Desktop/'
alias dbuild='docker build --build-arg NPM_TOKEN=${NPM_TOKEN} . -t'
alias dc='docker-compose'
alias dcbuild='docker-compose build --build-arg NPM_TOKEN=${NPM_TOKEN}'
alias dcdown='docker-compose down'
alias dcps='docker-compose ps'
alias dcud='docker-compose up -d'
alias dcup='docker-compose up'
alias dex='docker exec -it'
alias df='df -h --exclude=squashfs'
alias disable='sudo systemctl disable'
alias dkill='docker kill $(docker ps -aq)'
alias dlinks='rm -f $HOME/Desktop/*.desktop'
alias dlog='docker logs'
alias drm='docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -aq)'
alias drun='docker run -i -e NPM_TOKEN=${NPM_TOKEN} -t'
alias dps='docker ps'
alias dsink='pactl set-default-sink'
alias du='dust'
alias dun='killall dunst; dunst &'
alias dwipe='docker rm $(docker ps -aq); docker rmi $(docker images -aq)'
alias enable='sudo systemctl enable'
alias ez='vim $HOME/.zshrc'
alias fixtime='timedatectl set-timezone America/Chicago && timedatectl set-ntp true'
alias free='free -h'
alias fuckit='rm -rf node_modules yarn.lock && yarn && yarn clean'
alias heroku_init='heroku git:remote -a' # append app name
alias heroku_push='git push heroku master'
alias hlog='heroku logs --tail -a'
alias install='paru -S'
alias kernel='mhwd-kernel -li'
alias key='gpg --keyserver pool.sks-keyservers.net --recv-keys'
alias mac='sudo cp $HOME/workspace/ansible/resources/mac_sddm /usr/lib/sddm/sddm.conf.d/default.conf && rm -rf $HOME/.config/xfce4/ && cp -r $HOME/workspace/ansible/resources/xfce-mac $HOME/.config/xfce4 && rm -f $HOME/Desktop/*.desktop; reboot'
alias ndev='netlify dev'
alias npush='netlify build && netlify deploy --prod'
alias open='xdg-open'
alias pacbac='pacman -Qqe > /home/$USER/.dotfiles/Pacfile'
alias pacrestore='sudo pacman -S - /home/$USER/.dotfiles/Pacfile'
alias pacfiles='pacman -Qlq'
alias please='sudo $(fc -ln -1)'
alias plinks='rm -rf $HOME/.config/plank/dock1/launchers/ && cp -r $HOME/workspace/ansible/resources/plankapps $HOME/.config/plank/dock1/launchers/'
alias portscan='sudo nmap -sT -p-'
alias rankmirrors='sudo reflector --country United\ States --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias rebuild_aur='pacman -Qmq | yay --rebuild -S -'
alias red='redshift -x && redshift -O 4000'
alias remove='paru -R'
alias restart='sudo systemctl restart'
alias rfonts='fc-cache -vf'
alias sddm_themes='ls /usr/share/sddm/themes'
alias search='paru -Ss'
alias set_sddm_theme='sudo vim /usr/lib/sddm/sddm.conf.d/default.conf'
alias sinks='pactl list sinks'
alias sound='pavucontrol'
alias sshaccept=ssh_accept
alias start='sudo systemctl start'
alias status='systemctl status'
alias stop='sudo systemctl stop'
alias sz='source $HOME/.zshrc'
alias update='paru -Syu'
alias v='\vim'
alias vim='nvim'
alias vpndown='sudo wg-quick down /etc/wireguard/vpn.conf'
alias vpnup='sudo wg-quick up /etc/wireguard/vpn.conf'
alias wiki='cd /usr/share/doc/arch-wiki/html && http-server -c -1 -o en/Main_page.html'
alias win='sudo cp $HOME/workspace/ansible/resources/win_sddm /usr/lib/sddm/sddm.conf.d/default.conf && rm -rf $HOME/.config/xfce4/ && cp -r $HOME/workspace/ansible/resources/xfce95 $HOME/.config/xfce4 && cp $HOME/.links/* $HOME/Desktop/ && reboot'
alias yay='paru'
alias ytdl='youtube-dl -i -f mp4'
alias ytdlp='youtube-dl -i -f mp4 --yes-playlist'

## directories
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'

function hcl {
  git clone ssh://git@git.homelab.ooo:7422/tmo/$1 $2
}

# Git alias
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gca='git commit --amend'
alias gcl='git clone'
alias gclf='git clean -f'
alias gco='git checkout'
alias gcu='git add -u && git commit'
alias gd='git diff'
alias gdrb='git push origin --delete'
alias gdalb='git branch | grep -v "master" | xargs git branch -D'
alias gf='git fetch'
alias gl='git pull'
alias glog='git log'
alias gp='git push'
alias gpc='git push -u origin master'
alias gpp='git push -u upstream master'
alias gpro='git remote prune origin'
alias gra='git remote add'
alias grb='git rebase -i'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grball='git reset $(git commit-tree HEAD^{tree} -m "Dont forget a commit message!")'
alias grbc='git rebase --continue'
alias grr='git remote remove'
alias grs='git remote show'
alias grst='git reset'
alias grsth='git reset --hard'
alias gst='git status'
alias gsta='git stash'
alias gstap='git stash apply'
alias gsub='git submodule'
alias gsubi='git submodule init && git submodule update'
alias hcl='hcl $1 $2'

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Java
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export PATH="$PATH:$JAVA_HOME/bin"

# Go
export GOPATH=$HOME/bin/go

#Nand2Tetris
#alias Assembler='$HOME/workspace/nand2tetris/tools/Assembler.sh'
#alias CPUEmulator='$HOME/workspace/nand2tetris/tools/CPUEmulator.sh'
#alias HardwareSimulator='$HOME/workspace/nand2tetris/tools/HardwareSimulator.sh'
#alias JackCompiler='$HOME/workspace/nand2tetris/tools/JackCompiler.sh'
#alias TextComparer='$HOME/workspace/nand2tetris/tools/TextComparer.sh'
#alias VMEmulator='$HOME/workspace/nand2tetris/tools/VMEmulator.sh'
#alias allTests='for f in *.tst ; do echo $f $(HardwareSimulator $f) ; done'

# autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
[[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh
autoload -U compinit && compinit -u

# asdf && nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "/usr/local/opt/nvm/nvm.sh" ]] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ]] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -s $HOME/.asdf/asdf.sh ]] && source $HOME/.asdf/asdf.sh
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh


# npx fallback

eval $(thefuck --alias)

# pip executables
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# gnu replacements
alias cat='bat'
alias find='fd'
alias grep='rg'
alias l='ls -CF'
alias la='ls -alFh'
alias ll='ls -lFh'
alias lol='lolcate'
alias lr='ls -R'
alias lr2='ls -R -L 2'
alias lr3='ls -R -L 3'
alias lrl='ls -Rl'
alias lrl2='ls -Rl -L 2'
alias lrl3='ls -Rl -L 3'
alias ls='exa --ignore-glob=".git|node_modules|.cache|.parcel-cache|dist|build"'
alias lt='ls -T'
alias lt2='ls -T -L 2'
alias lt3='ls -T -L 3'
alias ltl='ls -Tl'
alias ltl2='ls -Tl -L 2'
alias ltl3='ls -Tl -L 3'
alias wrg='rg -tweb'

# starship prompt
eval "$(starship init zsh)"

# ripgrep path
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
