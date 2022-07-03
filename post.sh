cd && cd Downloads && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && sudo rm -r yay && cd && yay --noconfirm -Syu
yay --noconfirm -S pamixer pulseaudio-alsa pulseaudio pulseaudio-bluetooth  xorg-server xorg-xinit xorg-xset zsh htop mesa
yay --noconfirm -S nvidia nvidia-settings optimus-manager optimus-manager-qt bbswitch tlp
yay --noconfirm -S firefox qutebrowser python-adblock telegram-desktop evince alacritty feh picom-git neofetch rofi lxappearance pcmanfm copyq flameshot redshift qtile xkb-switch ttf-google-sans nerd-fonts-ubuntu-mono adobe-source-code-pro-fonts brightnessctl betterlockscreen bluez bluez-utils pavucontrol playerctl dunst exa onlyoffice-bin reflector
yay -S --noconfirm zsh-vi-mode zsh-syntax-highlighting spaceship-prompt

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
cp Downloads/arch-install/.xinitrc ~/.xinitrc
sudo cp Downloads/arch-install/10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
sudo cp Downloads/arch-install/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
cp Downloads/arch-install/.zshenv ~/
cp -r Downloads/arch-install/zsh ~/.config/
cp -r Downloads/arch-install/htop ~/.config/
cp -r Downloads/arch-install/alacritty ~/.config/
cp -r Downloads/arch-install/picom ~/.config/
cp -r Downloads/arch-install/copyq ~/.config/
cp -r Downloads/arch-install/flameshot ~/.config/
cp -r Downloads/arch-install/qtile ~/.config/
chmod +x ~/.config/qtile/autostart.sh
sudo cp Downloads/arch-install/optimus-manager.conf /etc/optimus-manager/
cp -r Downloads/arch-install/WallPapers ~/Pictures/
sudo cp Downloads/arch-install/tlp.conf /etc/
cp Downloads/arch-install/redshift.conf ~/.config/
cp -r Downloads/arch-install/neofetch ~/.config/
cp Downloads/arch-install/betterlockscreenrc ~/.config/
betterlockscreen -u Pictures/WallPapers


cp -r Downloads/arch-install/rofi ~/.config/
sudo cp -r Downloads/arch-install/Ant-Dracula /usr/share/themes/
sudo cp -r Downloads/arch-install/Flatery-Dark /usr/share/icons/
sudo cp -r Downloads/arch-install/Papirus-Dark /usr/share/icons/
sudo cp -r Downloads/arch-install/Bibata-Modern-Amber /usr/share/icons/
cp -r Downloads/arch-install/myicons ~/.local/
cp -r Downloads/arch-install/bin ~/.local/
chmod +x .local/bin/changevolume.sh
chmod +x .local/bin/changebrightness.sh

sudo cp Downloads/arch-install/index.theme /usr/share/icons/default/
cp -r Downloads/arch-install/gtk-3.0 ~/.config
cp Downloads/arch-install/.gtkrc-2.0 ~/
cp -r Downloads/arch-install/pcmanfm ~/.config/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r Downloads/arch-install/nvim ~/.config/
nvim --headless +PlugInstall +qall
cd Downloads && git clone https://github.com/vinceliuice/grub2-themes && cd grub* && sudo ./install.sh -b -t vimix && cd .. && sudo rm -r grub* && cd && grub-update

cp Downloads/arch-install/mimeapps.list ~/.config/
xdg-mime query default inode/directory pcmanfm.desktop
cp -r Downloads/arch-install/dunst ~/.config
cp -r Downloads/arch-install/git ~/.config
sudo cp Downloads/arch-install/blacklist /etc/modprobe.d/
sudo cp Downloads/insturct/pacman.conf /etc/
sudo cp Downloads/insturct/mirrorlist /etc/pacman.d/
sudo cp Downloads/arch-install/reflector.conf /etc/xdg/reflector/
cp -r Downloads/arch-install/qutebrowser ~/.config/
cp -r Downloads/arch-install/.mozilla ~/


#lxapearence
#Firefox
#Telegram
#Discord
