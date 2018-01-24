docker run --privileged --name my-custom-nginx-container -p 80:80 -v /home/nginxconf/default.conf:/etc/nginx/conf.d/default.conf:ro -v /home/nginxconf/cicdweb:/usr/share/nginx/html:ro -d nginx
