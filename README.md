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
mongodb-install
```

```
vesta-change-port
```

```
sshd-change-port
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
