#!/bin/sh
sed -i 's/wingrow_web/'"${NGINX_PROXY_IP}"'/' /etc/nginx/conf.d/default.conf
