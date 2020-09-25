#!/usr/bin/env bash

OPENSSL=`which openssl`
DEFAULT_CA=FBRP_Root_CA.cer

usage() {
 echo " "
 echo "Usage: genpfx.sh FQDN CA_CERT_FILE"
 echo " "
 echo "FQDN string extrapolates into FQDN.key and FQDN.cer"
 echo "CA_CERT_FILE expands to default if not passed as second arg"
 echo " "
}

if [ -z "$1" ] ;
 then
  usage
  exit 0 ;
fi
 
case $1 in
(-\?|-h|-help|--help)
    usage
    exit 0 

FQDN=$1
if [ -z "$2" ] ; then CA_CERT_FILE=$DEFAULT_CA ; fi

echo "Creating $FQDN.pfx"
echo " + Using $FQDN.cer"
echo " + Using $FQDN.key"
echo " + Using $CA_CERT_FILE"
#$OPENSSL pkcs12 -export out $FQDN.pfx -in $FQDN.cer -inkey $FQDN.key -certfile $CA_CERT_FILE 
