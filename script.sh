#!/bin/bash
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

pacstrap /mnt base linux linux-firmware

arch-chroot /mnt

pacman -S sudo nvidia plasma nano firefox konsole kde networkmanager dhcpcd sddm git wget

systemctl enable NetworkManager
systemctl enable dhcpcd
systemctl enable sddm

echo 'use os comandos:'
echo 'export EDITOR=nano'
echo 'visudo'
echo 'mude a linha la do ALL (ALL) alguma coisa'

echo -e "2112\n2112" | passwd
useradd -m tevin
echo -e "2112\n2112" | passwd tevin
