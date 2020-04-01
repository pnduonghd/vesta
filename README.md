[Phalcon + PHP 7.3 + Redis + NodeJS + Python3](https://github.com/pnduonghd/vesta)
==================================================

How to install
----------------------------

```bash
curl -L -O 'https://raw.githubusercontent.com/pnduonghd/vesta/master/install/vst-install-rhel.sh'
```

```
bash vst-install-rhel.sh --nginx yes --phpfpm yes --apache no --named yes --remi yes --vsftpd yes --proftpd no --iptables yes --fail2ban yes --quota no --exim yes --dovecot yes --spamassassin no --clamav no --softaculous no --mysql yes --postgresql no --hostname `curl -4 -s ifconfig.co`.xip.io
```
