sudo dnf update -y
sudo dnf install cloud-init -y
sudo systemctl enable cloud-init
dnf -y remove linux-firmware
dnf -y autoremove
dnf -y remove -y $(dnf repoquery --installonly --latest-limit=-1 -q)
dnf -y clean all  --enablerepo=\*;
echo "network: {config: disabled}" > /etc/cloud/cloud.cfg.d/98-custom-networking.cfg
#echo "manual_cache_clean: True" > /etc/cloud/cloud.cfg.d/99-manual.cfg

#Stop audit services
sudo systemctl stop rsyslog
sudo service auditd stop


nmcli con mod ens3 connection.autoconnect no
sudo rm -f /var/lib/systemd/random-seed
truncate -s 0 /etc/machine-id

#clear root data
sudo rm -rf ~root/.ssh/
sudo rm -f ~root/anaconda-ks.cfg

#clear /tmp && /var/tmp
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

#clean ssh keys
sudo rm -f /etc/ssh/*key*

#clean dnf cache
sudo dnf clean dbcache

#clear logs
sudo find /var/log -type f -name *.log -delete
logPaths=(
    "/var/log/wtmp"
    "/var/log/lastlog"
    "/var/log/anaconda/syslog"
    "/var/log/firewalld"
    "/var/log/btmp"
)

for logPath in "${logPaths[@]}"; do
  # Swap `echo` for `nmap` to actually scan
  echo "$logPath"
  if [ -f $logPath ]; then
    sudo truncate -s0 $logPath
  fi
done

#clean history
sudo rm -f ~root/.bash_history
unset HISTFILE
cat /dev/null > ~/.bash_history && history -c #&& init 0
