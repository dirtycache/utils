#!/usr/bin/env bash

/usr/bin/openssl req \
  -sha256 \
  -nodes \
  -days 365 \
  -newkey rsa:2048 \
  -keyout $1.fbrp.us.key \
  -out $1.fbrp.us.csr \
  -subj "/C=US/ST=Texas/L=The Woodlands/O=SixPackets LLC/OU=FBRP Lab/CN=$1.fbrp.us" \
  -reqexts SAN \
  -config <(cat /etc/pki/tls/openssl.cnf \
  <(printf "\n[SAN]\nsubjectAltName=DNS:$1.fbrp.us,DNS:$1"))  

echo -n
echo -n
echo -n
/bin/cat $1.fbrp.us.csr
echo -n
