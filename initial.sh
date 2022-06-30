#!/bin/sh
timedatectl set-ntp true
ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime
hwclock --systohc
# hwclock --hctosys
pacman -S base-devel neovim sudo grub efibootmgr dosfstools os-prober networkmanager
cp Downloads/instruct/locale.gen /etc/locale.gen
locale-gen
cp Downloads/instruct/hostname /etc/hostname
cp Downloads/instruct/hosts /etc/hosts
echo "Enter root password twice"
passwd
useradd -m archer
echo "Enter user password twice"
passwd archer
usermod -aG wheel,audio,video archer
echo "Uncomment wheel group"
EDITOR=nvim visudo
cp Downloads/instruct/grub /etc/default/grub 
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
cd && mv Downloads /home/archer/
