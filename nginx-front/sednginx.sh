#!/bin/sh
sed -i 's/wingrow.winhong.com/'"${NGINX_PROXY_IP}"'/' /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
