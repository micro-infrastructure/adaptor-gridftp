#!/bin/bash

RESPONSE=response.txt
HEADERS=headers.txt
URL='https://api.ipify.org'
IP=''

status=$(curl -s -w %{http_code} -m 5 --connect-timeout 5 $URL -o $RESPONSE)
## K8s DNS might not be setup correctly
## in which case override with an external
## dns server.
if [ $status == 000 ]; then
	echo "nameserver 8.8.8.8" > /etc/resolv.conf
	sleep 1
	status=$(curl -s -w %{http_code} -m 5 --connect-timeout 5 $URL -o $RESPONSE)
	IP="$(cat response.txt)"
else
	IP="$(cat response.txt)"
fi

## External IP is used by gridftp server 
## in signaling to the client to which
## ip:port to connect. Without this the
## server will communicate its private IP
## to the client e.g. 192.168.2.1
echo "hostname $IP" >> /home/user/gridftp.conf
#echo $IP

