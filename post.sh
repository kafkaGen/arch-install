cd && cd Downloads && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && sudo rm -r yay && cd && yay -Syu
yay -S pamixer pulseaudio-alsa pulseaudio pulseaudio-bluetooth  xorg-server xorg-xinit xorg-xset zsh htop mesa
yay -S nvidia nvidia-settings optimus-manager optimus-manager-qt bbswitch tlp
yay -S firefox qutebrowser python-adblock telegram-desktop evince alacritty feh picom-git neofetch rofi lxappearance pcmanfm copyq flameshot redshift qtile xkb-switch ttf-google-sans nerd-fonts-ubuntu-mono adobe-source-code-pro-fonts brightnessctl betterlockscreen bluez bluez-utils pavucontrol playerctl dunst exa onlyoffice-bin reflector

# yay -S gimp camera obs-studio texlive-most texmaker pycharm ttf-times-new-roman timeshift filelight discord vlc gparted sddm xorg zip unzip ttf-ms-fonts noto-fonts-emoji mesa-utils mesa-demos dufw zoom gedit bleachbit alsa-plugins alsa-firmware mtools alsa-utils ranger

# To get access to Windows partion
# yay -S ntfs-3g
# sudo mkdir /media/windows
# sudo mount /dev/... /media/windows/
# maybe will be need 
# modprobe ntfs

chsh -s /bin/zsh
sudo rmmod pcspkr
sudo systemctl enable tlp
sudo systemctl start tlp
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable betterlockscreen@$USER
sudo systemctl enable fstrim.timer
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

mkdir -p ~/Pictures ~/Temp 
cp Downloads/instruct/.xinitrc ~/.xinitrc
sudo cp Downloads/instruct/10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
sudo cp Downloads/instruct/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
cp Downloads/instruct/.zshenv ~/
cp -r Downloads/instruct/zsh ~/.config/
yay -S zsh-vi-mode zsh-syntax-highlighting spaceship-prompt
cp -r Downloads/instruct/htop ~/.config/
cp -r Downloads/instruct/alacritty ~/.config/
cp -r Downloads/instruct/picom ~/.config/
cp -r Downloads/instruct/copyq ~/.config/
# copyq config hide_main_window true
cp -r Downloads/instruct/flameshot ~/.config/
cp -r Downloads/instruct/qtile ~/.config/
chmod +x ~/.config/qtile/autostart.sh
sudo cp Downloads/instruct/optimus-manager.conf /etc/optimus-manager/
cp -r Downloads/instruct/WallPapers ~/Pictures/
sudo cp Downloads/instruct/tlp.conf /etc/
cp Downloads/instruct/redshift.conf ~/.config/
cp -r Downloads/instruct/neofetch ~/.config/
cp Downloads/instruct/betterlockscreenrc ~/.config/
betterlockscreen -u Pictures/WallPapers


cp -r Downloads/instruct/rofi ~/.config/
sudo cp -r Downloads/instruct/Ant-Dracula /usr/share/themes/
sudo cp -r Downloads/instruct/Flatery-Dark /usr/share/icons/
sudo cp -r Downloads/instruct/Papirus-Dark /usr/share/icons/
sudo cp -r Downloads/instruct/Bibata-Modern-Amber /usr/share/icons/
cp -r Downloads/instruct/myicons ~/.local/
cp -r Downloads/instruct/bin ~/.local/
chmod +x .local/bin/changevolume.sh
chmod +x .local/bin/changebrightness.sh

sudo cp Downloads/instruct/index.theme /usr/share/icons/default/
cp -r Downloads/instruct/gtk-3.0 ~/.config
cp Downloads/instruct/.gtkrc-2.0 ~/
# try to edit in lxapearnce
cp -r Downloads/instruct/pcmanfm ~/.config/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r Downloads/instruct/nvim ~/.config/
nvim --headless +PlugInstall +qall
cd Downloads && git clone https://github.com/vinceliuice/grub2-themes && cd grub* && sudo ./install.sh -b -t vimix && cd .. && sudo rm -r grub* && cd && grub-update

cp Downloads/instruct/mimeapps.list ~/.config/
xdg-mime query default inode/directory pcmanfm.desktop
cp -r Downloads/instruct/dunst ~/.config
cp -r Downloads/instruct/git ~/.config
sudo cp Downloads/instruct/blacklist /etc/modprobe.d/
sudo cp Downloads/insturct/pacman.conf /etc/
sudo cp Downloads/insturct/mirrorlist /etc/pacman.d/
sudo cp Downloads/instruct/reflector.conf /etc/xdg/reflector/
cp -r Downloads/instruct/qutebrowser ~/.config/
cp -r Downloads/instruct/.mozilla ~/


#lxapearence telegram discord
#Firefox
#Telegram
#Discord
