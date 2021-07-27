#!/bin/bash
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi

pacstrap /mnt base linux linux-firmware sudo nvidia plasma nano firefox konsole kde networkmanager dhcpcd sddm git wget vim grub efibootmgr

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

systemctl enable NetworkManager
systemctl enable dhcpcd
systemctl enable sddm

echo 'use os comandos:'
echo 'export EDITOR=nano'
echo 'visudo'
echo 'mude a linha la do ALL (ALL) alguma coisa'

mkinitcpio -P

echo -e "2112\n2112" | passwd
useradd -m tevin
echo -e "2112\n2112" | passwd tevin

grub-install
grub-mkconfig -o /boot/grub/grub.cfg
