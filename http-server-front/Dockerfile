FROM 10.0.2.50/wh-cicd/docker-http-server
ADD ./webapp /public/
CMD [ "http-server","--proxy","http://wingrow-backend:8100" ]
