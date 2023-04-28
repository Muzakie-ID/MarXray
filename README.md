## MarXray

<img src="https://img.shields.io/badge/Buat_Install_Vpn_Di%20VPS-green">

* Install Multi Port Dan Lainya

```html
  sudo yum install epel-release
```
```html
  sudo yum update
```
```html
  sudo yum install nginx
```
```html
  bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
```
```html
  wget -qO- https://github.com/Gozargah/Marzban-examples/releases/latest/download/multi-port.tar.gz | tar xz --xform 's/multi-port/marzban/' && cd marzban
```
```html
  wget -q -O /etc/nginx/conf.d/xray.conf "https://raw.githubusercontent.com/Muzakie-ID/MarXray/main/xray.conf"
```
```html
  rm -r xray_config.json
```
```html
wget -q -O /root/marzban/xray_config.json "https://raw.githubusercontent.com/Muzakie-ID/MarXray/main/xray_config.json"
```
```html
  system
docker compose up -d
```
* Ganti Domain Anda
```html
  nano /etc/nginx/conf.d/xray.conf
```
* Get Key
```html
  curl https://get.acme.sh | sh -s email=muzakie624@gmail.com
mkdir -p /var/lib/marzban/certs/
~/.acme.sh/acme.sh --issue --force --dns dns_cf -d dmafiadc.xyz -d www.dmafiadc.xyz \--key-file /var/lib/marzban/certs/key.pem \--fullchain-file /var/lib/marzban/certs/fullchain.pem
```
<p align="center">
  <a href="#">
      <img src="https://api.visitorbadge.io/api/VisitorHit?user=Muzakie-ID&repo=MarXray&countColor=%237B1E7A" />
   </a>
</p>
