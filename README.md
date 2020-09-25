# gzipper.sh

bash script which looks in a given directory for **\*.tar** and if it finds any, it compresses them using **gzip -1**.  

Optionally runs **md5sum** and writes to *filename.tar.gz.md5* for each .tar.gz created.

# gencert.sh  

bash script to generate keys and CSRs for signing with internal fbrp.us PKI

# genfqdn.sh  

bash script to generate keys and CSRs for signing submission to arbitrary CA

# genpfx.sh

bash script to combine a .key and .cer into a .pfx
