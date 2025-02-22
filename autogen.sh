#!/bin/bash
# // String / Request Data
# Getting
mkdir -p /etc/xray
MYIP=$(wget -qO- ipinfo.io/ip);
clear
yum install jq curl -y
#sub=$(</dev/urandom tr -dc a-z | head -c4)
clear
echo -e ""
echo -e "jangan karakter singkat seperti: sg, id, hk,"
echo -e "kalau bisa 1 kata yang unik dengan dikombinasikan dengan angka"
echo -e "contoh: resa11"
echo -e ""
echo -e "\e[32msubdomain\e[0m.dmafiadc.xyz"
read -p "Mau subdomain apa?( 1kata ) : " sub
if [[ $sub == "" ]]; then
clear
echo -e "${EROR} No Input Detected !"
exit 1
fi
DOMAIN=dmafiadc.xyz
SUB_DOMAIN=${sub}.dmafiadc.xyz
CF_ID=muzakie624@gmail.com
CF_KEY=
set -euo pipefail
IP=$(curl -sS ifconfig.me);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":0,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":0,"proxied":false}')
     
echo "Host : $SUB_DOMAIN"
sleep 1
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
yellow "Domain added.."
sleep 3
echo "$SUB_DOMAIN" > /etc/xray/domain
echo -e ""
echo -e "subdomainmu telah jadi yaitu: $SUB_DOMAIN"
echo -e "Pakai itu untuk install nanti"
cd
