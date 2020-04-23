FROM treehouses/debian 

RUN apt-get update -y   && apt-get install -y apache2

RUN mkdir /var/run/apache2

EXPOSE 80

CMD ["-D","FOREGROUND"]
ENTRYPOINT ["/usr/sbin/apache2ctl"]

