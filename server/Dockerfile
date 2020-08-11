FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -q -y globus-gridftp-server-progs sudo curl
#RUN apt-get update && apt-get install -q -y globus-gridftp-server-progs openssh-server sudo
#RUN /usr/sbin/globus-gridftp-server-enable-sshftp
COPY globus-gridftp-password /usr/sbin/
RUN mkdir -p /home/user/.ssh
RUN groupadd -g 2222 user
RUN useradd -s /bin/sh -g 2222 -u 3938873  user
RUN chown -R user:user /home/user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
COPY entry.sh /entry.sh
COPY gridftp.conf /home/user/
COPY README.md /home/user/
RUN chown user:user /home/user/gridftp.conf
USER user
RUN touch /home/user/gridftp.log
RUN touch /home/user/gridftp-transfer.log
ENV TERM xterm
