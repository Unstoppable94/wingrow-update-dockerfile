FROM 192.168.101.87/wingrow/nginx:latest
ADD ./webapp /usr/share/nginx/html
ADD ./default.conf /etc/nginx/conf.d/default.conf
ADD ./sednginx.sh /sednginx.sh
RUN chmod +x /sednginx.sh
CMD ["/sednginx.sh"]

 
