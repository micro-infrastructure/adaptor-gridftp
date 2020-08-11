FROM centos:centos7
RUN yum -y update && yum clean all && \
rpm -hUv http://downloads.globus.org/toolkit/gt6/stable/installers/repo/rpm/globus-toolkit-repo-latest.noarch.rpm && \
yum -y install globus-data-management-client
RUN yum -y install openssh
RUN yum -y install sudo
run mkdir -p /home/grdiftp/.ssh
RUN groupadd -g 2222 grdiftp
RUN useradd -s /bin/sh -g 2222 -u 3938873  grdiftp
run chown -R grdiftp:grdiftp /home/grdiftp
RUN echo "grdiftp ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER grdiftp
ENV TERM xterm
