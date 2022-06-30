#!/bin/sh
timedatectl set-ntp true
ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime
hwclock --systohc
# hwclock --hctosys
pacman -S --noconfirm base-devel neovim sudo grub efibootmgr dosfstools os-prober networkmanager
cp Downloads/arch-install/locale.gen /etc/locale.gen
locale-gen
cp Downloads/arch-install/hostname /etc/hostname
cp Downloads/arch-install/hosts /etc/hosts
echo "Enter root password twice"
passwd
useradd -m archer
echo "Enter user password twice"
passwd archer
usermod -aG wheel,audio,video archer
read -p "Uncomment wheel group (press Enter to continue)"
EDITOR=nvim visudo
cp Downloads/arch-install/grub /etc/default/grub 
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
cd && mv Downloads /home/archer/
chown archer /home/archer/Downloads
