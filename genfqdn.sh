#!/bin/bash

#/usr/bin/openssl req -new -sha256 -nodes -out $1.csr -newkey rsa:2048 -keyout $1.key \
#-subj "/C=US/ST=Texas/L=The Woodlands/O=FBRP/OU=LAB/CN=$1/subjectAltName=DNS.1=$1" 

/usr/bin/openssl req \
  -newkey rsa:4096 \
  -keyout $1.key \
  -days 365 \
  -nodes \
  -out $1.csr \
  -subj "/C=US/ST=Texas/L=The Woodlands/O=FBRP/OU=LAB/CN=$1" \
  -reqexts SAN \
  -config <(cat /etc/pki/tls/openssl.cnf \
  <(printf "\n[SAN]\nsubjectAltName=DNS:$1"))  

echo "-----------------CSR-----------------"
echo " "
echo " "
/bin/cat $1.csr
echo " "
