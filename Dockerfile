FROM centos:7.9.2009
RUN yum -y install httpd
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
ENV WEBPORT 80
EXPOSE ${WEBPORT}
EXPOSE 443
VOLUME /var/www/html
COPY ~/intern/index.html /var/www/html/index.html

