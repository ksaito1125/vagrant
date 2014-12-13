FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y subversion apache2 libapache2-svn

RUN mkdir /var/lib/svn
RUN svnadmin create /var/lib/svn/sandbox

RUN chown -R www-data:www-data /var/lib/svn
RUN rm /etc/apache2/mods-available/dav_svn.conf
ADD dav_svn.conf /etc/apache2/mods-available/
ADD dav_svn.passwd /etc/apache2/
