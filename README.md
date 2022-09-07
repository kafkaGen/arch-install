# My Arch install script

<div id="header" align="center">
  <img src="https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif" width="100"/>
</div>

I encountered many problems after which I had to reinstall the system. A simple backup is not enough, because not all system settings are saved. I wrote this script in order to completely reproduce my workplace in a couple of clicks.

## It consists of two files:
1. <b>initail.sh</b> download the system itself and basic settings:

A few steps is needed to be done yourself:
* iwctl (connect to internet)
* cfdisk /dev/dist_where_to_set_system (here you need to create system parition (Linux filesystem) and boot partition (EFI system))
* mkfs.fat -F32 /dev/boot_partition (format partition)
* mkfs.ext4 /dev/system_partition (format partition)
* mount /dev/system_partition /mnt
* mkdir /mnt/boot && mkdir /mnt/boot/efi
* mount /dev/boot_partition /mnt/boot/efi
* pacstrap /mnt base linux linux-firmware
* genfstab -U /mnt >> /mnt/etc/fstab
* arch-chroot /mnt
* pacman -S git 
* cd && mkdir Downloads && cd Downloads && git clone https://github.com/kafkaGen/arch-install && cd
* sh Downloads/instruct/initial.sh

Last steps after the script completes:
* exit
* umount -l /mnt
* reboot
2. <b>post.sh</b> installs the remaining configuration files (then a reboot is required)
Do not forget to newly connect to internet before run next script.
* sudo nmcli device wifi connect <b>network_name</b> password <b>network_password</b>
* sh Downloads/instruct/post.sh

Reboot your system and pleasant use!

For Windows user:
* disable fastboot
* run as administrator in console: reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f

REMARK:
<b>config.txt</b> file where I save my notes about system improve, <b>update.sh</b> script which update all configuration files in <b>arch-install</b>
