FROM resin/rpi-node:wheezy
RUN apt-get update && apt-get -y install arp-scan
RUN apt-get -y install git nano
RUN apt-get -y install ca-certificates wget
WORKDIR /root
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
RUN /bin/sh -c '. /root/.nvm/nvm.sh && nvm install v0.10.40 && nvm alias default v0.10.40'
#NODE /bin/v0.10.40/bin/node
RUN apt-get install -y nmap
RUN npm install -g forever
ENV VER 2
RUN git clone https://github.com/Program3r/hungry-hippoportamus
WORKDIR /root/hungry-hippoportamus
RUN /bin/v0.10.40/bin/npm install
RUN apt-get install -y iptables
