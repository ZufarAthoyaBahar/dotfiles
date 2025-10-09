if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Initialize Oh My Posh
~/.local/bin/oh-my-posh init fish | source

# Set the prompt to the Oh My Posh theme
#set -x POSH_THEME /home/zufarath/.config/oh-my-posh/themes/hul10.omp.json
set -x POSH_THEME /home/zufarath/.config/oh-my-posh/themes/emodipt.omp.json

# Aliases

alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/.config/'

alias vscode='cd ~/Documents/vscode'
alias sem6='cd ~/Documents/vscode/Kuliah/semester6'
alias sem5='cd ~/Documents/vscode/Kuliah/semester5'
alias sem4='cd ~/Documents/vscode/Kuliah/Semester4'
alias sem3='cd ~/Documents/vscode/Kuliah/semester6'
alias kkn='cd ~/Documents/vscode/Kuliah/kkn'
alias fzfp='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
alias confvim='cd ~/.config/nvim/'
alias conffish='cd ~/.config/fish/'
alias confkitty='cd ~/.config/kitty'
alias confi3='cd ~/.config/i3'
alias confrofi='cd ~/.config/rofi'
alias confpolybar='cd ~/.config/polybar'
alias mendeley_desktop='cd ~/Downloads && ./mendeley-reference-manager-2.122.0-x86_64.AppImage'

# Matkul Semester 5
alias metops='cd ~/Documents/vscode/Kuliah/semester5/optimus'
alias stbi='cd ~/Documents/vscode/Kuliah/semester5/stbi'
alias cysec='cd ~/Documents/vscode/Kuliah/semester5/cysec'
alias pacman_game='cd ~/Documents/vscode/Kuliah/semester5/algen/project/Pacman-GA/'
alias prpl='cd ~/Documents/vscode/Kuliah/semester5/prpl/project/'
alias dl='cd ~/Documents/vscode/Kuliah/semester5/dl'

# Matkul Semester 6

alias monitor='~/.config/rofi/monitor.sh'

alias python3.12.3='/home/zufarath/.pyenv/versions/3.12.3/bin/python'

set -x ANDROID_HOME /home/zufarath/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools

set -gx PATH /usr/local/cuda/bin $PATH
set -gx LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH

set -Ux EDITOR nvim

set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx XDG_DATA_DIRS /usr/share:/usr/local/share:/home/$USER/.local/share

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -x WINEDLLOVERRIDES 'OnlineFix64=n;SteamOverlay64=n;winmm=n,b;dnet=n;steam_api64=n;winhttp=n,b'
