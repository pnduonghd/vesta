[Phalcon + PHP 7.3 + Redis + NodeJS + Python3](https://github.com/pnduonghd/vesta)
==================================================

How to install
----------------------------

```
yum install -y screen
```

```
screen -R root
```

```bash
curl -L -O 'https://raw.githubusercontent.com/pnduonghd/vesta/master/install/vst-install-rhel.sh'
```

```
bash vst-install-rhel.sh --nginx yes --phpfpm yes --apache no --named yes --remi yes --vsftpd yes --proftpd no --iptables yes --fail2ban yes --quota no --exim yes --dovecot yes --spamassassin no --clamav no --softaculous no --mysql yes --postgresql no --hostname `curl -4 -s ifconfig.co`.nip.io
```

How to update
----------------------------

```
curl -L -s 'https://raw.githubusercontent.com/pnduonghd/vesta/master/bin/vesta-update' | bash
```

Backup & Restore
----------------------------
```
# Old Server

cd /home/backup/
rm -rf *.tar
ls -la

/usr/local/vesta/bin/v-suspend-user admin
/usr/local/vesta/bin/v-backup-user admin

# New Server:

cd /home/backup/
scp -P 2222 root@68.68.68.68:/home/backup/admin.2020-02-02_02-02-02.tar /home/backup/
/usr/local/vesta/bin/v-restore-user admin admin.2020-02-02_02-02-02.tar

```

Ubuntu 18.04 WSL
----------------------------

```bash
apt install -y zsh
chsh -s /bin/zsh
```

```bash
curl -L -O 'https://raw.githubusercontent.com/pnduonghd/vesta/master/install/vst-install-ubuntu.sh'
```

```bash
curl -L -O 'https://raw.githubusercontent.com/pnduonghd/vesta/master/install/vst-install-ubuntu-extras.sh'
```

```
bash vst-install-ubuntu.sh --nginx yes --phpfpm yes --apache no --named no --remi no --vsftpd no --proftpd no --iptables no --fail2ban no --quota no --exim no --dovecot no --spamassassin no --clamav no --softaculous no --mysql yes --postgresql no --hostname 127.0.0.1.nip.io
```

```
bash vst-install-ubuntu-extras.sh
```

Extra
----------------------------
```
Edit VestaCP Default Package
```

```
sshd-change-port
vesta-change-port
vesta-phpmyadmin-passwd

/usr/local/vesta/bin/v-suspend-firewall-rule $(/usr/local/vesta/bin/v-list-firewall | grep 3306 | cut -d ' ' -f 1)
```

```
Fix Roundcube:
ls /usr/share/roundcubemail/skins/
cat /var/log/roundcubemail/errors.log

Edit Last Line: $config['skin'] = 'elastic';
vi /etc/roundcubemail/config.inc.php
```

```
mongodb-install
```

```
systemctl disable named
service named stop
```

```
systemctl disable fail2ban
service fail2ban stop
```

```
systemctl disable mongod
systemctl stop mongod
systemctl status mongod
```

```
https://unix.stackexchange.com/questions/65075/delete-last-n-lines-from-bash-history

unset HISTFILE

for i in {1..10}; do echo "clearing line $(($HISTCMD-2)): $(history -p \!$(($HISTCMD-2)))"; history -d $(($HISTCMD-2)); done; history -d $(($HISTCMD-1))

curl -L 'https://raw.githubusercontent.com/pnduonghd/vesta/master/bin/ssh-keylist' | bash

grep -q "^[^#]*PasswordAuthentication" /etc/ssh/sshd_config && sed -i "/^[^#]*PasswordAuthentication[[:space:]]yes/c\PasswordAuthentication no" /etc/ssh/sshd_config || echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

service sshd restart

echo ssh root@`curl -4 ifconfig.co`

history -c
```


```
. /root/.nix-profile/etc/profile.d/nix.sh

nix-env -iA nixpkgs.zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc

```


```
phalcon project --template-engine=volt --name=store --enable-webtools

```
