#!/bin/bash
CANAME="NT HOME"
read -p 'Enter Output CA Filename without Extension: ' caFileName
printf "\n\n (+) Generating CA Key"
#for some reason windows 10 displays password on prompt, so hiding.. 
stty -echo
openssl genrsa -des3 -out ${caFileName}.key 2048
stty echo
printf "\n\n (+) Generating Root Certificate"
stty -echo
openssl req -x509 -new -nodes -key ${caFileName}.key -sha256 -days 1825 -subj "/C=US/ST=Arizona/L=Phoenix/CN=${CANAME}" -out ${caFileName}.pem
stty echo