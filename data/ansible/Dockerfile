FROM ubuntu:latest

RUN useradd docker
RUN apt-get update -y
RUN apt-get install -y openssh-server
CMD update-rc.d ssh defaults
