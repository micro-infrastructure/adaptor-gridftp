# gridFTP image
## k8s setup
Running gridFTP behind a NAT on private IP takes some configuration. Also running as no-root. GridFTP uses port 2811 (default) to signal communication between server and client. It then listens on a port assigned from GLOBUS_TCP_PORT_RANGE env variable. and communicates this to the client. 

In k8s these ports need to be statically mapped through services to the host. Also the container need to know its own public facing IP since it will signal the cliet IP:PORT to connect. entry.sh does this by curl to ipify. 

For accessing host filesystems, the host user need to be mapped to the container user and the container needs to run as that user. To get around this, the Dockerfile creates the user when building the image.
