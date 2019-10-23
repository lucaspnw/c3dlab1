#!/bin/bash

conf=$(pwd)/conf
html=$(pwd)/html

docker stop nginx_c3d
docker rm nginx_c3d

curl http://mail.seattlehq.org/ssl/user.ca.crt > conf/ssl/userca.crt
#curl http://mail.seattlehq.org/ssl/examplecom.crt > conf/ssl/examplecom.crt
#curl http://mail.seattlehq.org/ssl/examplecom.key > conf/ssl/examplecom.key
curl http://mail.seattlehq.org/ssl/west.seattlehq.org.pem > conf/ssl/examplecom.crt
curl http://mail.seattlehq.org/ssl/west.seattlehq.org.key > conf/ssl/examplecom.key

docker run --name nginx_c3d -p 4433:443 -p 8000:80 -v $conf:/etc/nginx -v $html:/var/www/html -P -d nginx


docker kill -s HUP nginx_c3d

echo Helpful commands!
echo Connect bash: docker exec -ti nginx_c3d /bin/bash
echo See logs: docker logs nginx_c3d
