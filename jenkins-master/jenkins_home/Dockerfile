FROM 10.0.2.50/wingrow/jenkins-withplugins:20171121
USER root 
ADD  jenkins_home /jenkins_home


RUN git clone http://xiehq:acd12345@10.0.2.50:180/winhong/JenkinsGroovy.git  /jenkins-groovy && \
	chmod +x /jenkins-groovy/*.sh
COPY ./cron.conf /var/spool/cron/crontabs/root

#RUN chown -R jenkins /jenkins_home
#RUN chgrp -R jenkins /jenkins_home
# jenkins user default password w12sedwiokd
# admin password admin
ADD jenkins.sh /usr/local/bin/jenkins.sh
#USER jenkins

