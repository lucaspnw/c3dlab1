# c3dlab1
Simple nginx / docker config to request client certificates and log them

You must have Docker installed to use this.

# Quick Start
```
git clone https://github.com/lucaspnw/c3dlab1.git
cd c3dlab1
chmod +x run.sh
./run.sh
```

To connect to the server:

```
curl -b mycookies -L -k -v --key ~/c3dlab1/conf/ssl/myusername4.key --cert ~/c3dlab1/conf/ssl/myusername4.crt https://<target address>/
```

# Logs
To see the certificate, watch the logs
```
docker logs nginix_c3d -f
```
