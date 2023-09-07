

# Turning on text-mode installation (little quicker than GUI)
text

# Setting up authentication and keyboard
auth --enableshadow --passalgo=sha512
keyboard --vckeymap=${lnx_keyboard_lang} --xlayouts='${lnx_keyboard_lang}'

# Installation files source (CentOS-7.0-1406-x86_64-Minimal.iso)
cdrom

# Using only primary disk, ignoring others
ignoredisk --only-use=sda

# Setting up language to English
lang ${lnx_system_lang}

# Setting up network interface to DHCP
network --bootproto=dhcp --ipv6=auto --activate #--hostname=centos-ks.local --activate

# Root password (remember that plaintext only for information purposes)
rootpw --plaintext ${lnx_root_password} --allow-ssh

# Setting up firewall and enabling SSH for remote management
firewall --enabled --service=ssh

# Setting timezone
timezone ${lnx_timezone} --isUtc

# Setting up Security-Enhanced Linux into enforcing
#selinux --enforcing
selinux --permissive

# Setting up MBR
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda

#Disk partitioning information
ignoredisk --only-use=sda

# Overwrite the MBR
zerombr

# Partition clearing information
clearpart --all --initlabel --drives=sda

#Disk partitioning information
part /boot --fstype="ext4" --ondisk=sda --size=1024 --label=BOOT
part pv.1 --fstype="lvmpv" --ondisk=sda --size=${lnx_vg_system_size}
volgroup vg_system --pesize=4096 pv.1
logvol /  --fstype="ext4" --size=${lnx_vol_size_root} --label="lv_root" --name=lv_root --vgname=vg_system
logvol /tmp  --fstype="ext4" --size=${lnx_vol_size_tmp} --label="lv_tmp" --name=lv_tmp --vgname=vg_system
logvol /var/log  --fstype="ext4" --size=${lnx_vol_size_varlog} --label="lv_varlog" --name=lv_varlog --vgname=vg_system
logvol /home  --fstype="ext4" --size=${lnx_vol_size_home} --label="lv_home" --name=lv_home --vgname=vg_system
logvol /opt  --fstype="ext4" --size=${lnx_vol_size_opt} --label="lv_opt" --name=lv_opt --vgname=vg_system
logvol /usr  --fstype="ext4" --size=${lnx_vol_size_usr} --label="lv_usr" --name=lv_usr --vgname=vg_system
logvol /var  --fstype="ext4" --size=${lnx_vol_size_var} --label="lv_var" --name=lv_var --vgname=vg_system

#logvol swap  --fstype="swap" --size=4096 --name=lv_swap --vgname=VGsystem

# Eject cdrom and reboot
reboot --eject

# Installing only packages for minimal install 
%packages
@^minimal-environment
chrony
%end
%post --interpreter=bash
# Temp fix for LVM UUID
sed -i -e 's/# use_devicesfile = 0/use_devicesfile = 0/' /etc/lvm/lvm.conf

# Configure NetworkManager
sed -i -e 's/#plugins=keyfile,ifcfg-rh/plugins=keyfile/' /etc/NetworkManager/NetworkManager.conf
sed -i -e '/^plugins=keyfile/a hostname-mode=none' /etc/NetworkManager/NetworkManager.conf
# tuned systemprofile  Red Hat images https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/power_management_guide/tuned-adm
#echo "virtual-guest" > /etc/tuned/active_profile
%end