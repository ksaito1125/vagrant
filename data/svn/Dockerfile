FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y subversion apache2 libapache2-svn

RUN mkdir /var/lib/svn
RUN svnadmin create /var/lib/svn/sandbox

RUN chown -R www-data:www-data /var/lib/svn
RUN rm /etc/apache2/mods-available/dav_svn.conf
ADD dav_svn.conf /etc/apache2/mods-available/
ADD dav_svn.passwd /etc/apache2/

ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_USER www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
