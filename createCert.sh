#!/bin/bash
read -p "Enter Common Name (Site Name, eg. something.test.home): " domainName
read -p "Enter CA FileName: " caFileName
openssl genrsa -out ${domainName}.key 2048

openssl req -new -key ${domainName}.key -subj "/C=US/ST=Arizona/L=Phoenix/CN=${domainName}" -out ${domainName}.csr

cat <<EOF >> ${domainName}.cnf
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = ${domainName}
EOF



#openssl v1.1  > supports this below
#openssl x509 -req -in ${domainName}.csr -CA ${caFileName}.pem -CAkey ${caFileName}.key -CAcreateserial -out ${domainName}.crt -days 1825 -sha256 -addext "subjectAltName=DNS:${domainName}"
#but for openssl < 1.1
stty -echo 
openssl x509 -req -in ${domainName}.csr -CA ${caFileName}.pem -CAkey ${caFileName}.key -CAcreateserial -out ${domainName}.crt -days 1825 -sha256 -extfile ${domainName}.cnf
stty echo 
#cleanup
rm ${domainName}.cnf
