FROM docker.io/unstoppable/nginx
ADD ./webapp /usr/share/nginx/html
ADD ./default.conf /etc/nginx/conf.d/default.conf
ADD ./sednginx.sh /sednginx.sh
RUN chmod +x /entrypoint.sh

 
