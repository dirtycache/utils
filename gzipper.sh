#!/usr/bin/env bash

ME=${0##*/}
WORKDIR=$1
GZIP=`which gzip`
TARBALLS=`cd $WORKDIR 2>&1 && ls *.tar` 

#case $1 in
#(-\?|-h|-help|--help)
#    usage
#    exit 0 

usage() {
 echo " "
 echo "$ME - For a given target directory, find *.tar and gzip it if"
 echo "a .tar.gz does not already exist. Optionally create <foo>.tar.gz.md5"
 echo " "
 echo "Usage: $ME <target directory> [OPTIONS]"
 echo "Example: $ME /mnt/somedir --md5"
 echo "md5 default behavior if unset is not to create md5"
 echo " "
}

if [ -z "$WORKDIR" ] ;
 then
  usage
  exit 0 ;
fi

if [ ! -d "$WORKDIR" ]    
 then
  echo " "
  echo "FATAL: Nonexistant target directory $WORKDIR!"
  echo "Exiting..."
  echo " "
  exit 1
fi

if [ -z "$GZIP" ] ;
 then
  echo " "
  echo "FATAL: no gzip in path!"
  echo "Exiting..."
  echo " "
  exit 1 ;
fi

if [[ $2 == "--md5" ]]
 then
  MD5SUM=`which md5sum`
   if [ -z $MD5SUM ] ;
    then
    echo " "
    echo "FATAL: no md5sum in path!"
    echo "Exiting..."
    echo " "
    exit 1 ;
   fi
fi

DUTHEN=`du -h $WORKDIR | cut -f1`
echo " "
echo "-------------------------------------------------------------------------"
echo "Directory size before gzipper: $DU"
echo "-------------------------------------------------------------------------"

for TAR in $TARBALLS ; do
# if [ -f "$TAR.gz" ]; then
#  echo " "
#  echo "Ignoring existing $TAR.gz..."
#  break
# fi 
 echo " "
 echo "-------------------------------------------------------------------------"
 echo "+ Processing $TAR -> $TAR.gz..."
# $GZIP -1 $TAR 
 $GZIP -1 -c $TAR > $TAR.gz 
 if [[ $2 == "--md5" ]]
  then
   echo "| Creating $TAR.gz.md5..."
   $MD5SUM $TAR.gz > $TAR.gz.md5
   echo -n "|  " ; cat $TAR.gz.md5
 fi
 echo "-------------------------------------------------------------------------"
done

echo " "
echo "Done!"
DUNOW=`du -h $WORKDIR | cut -f1`
echo " "
echo "-------------------------------------------------------------------------"
echo "Directory size before gzipper: $DUTHEN"
echo "Directory size before gzipper: $DUNOW"
echo "-------------------------------------------------------------------------"
echo " "

exit 0
