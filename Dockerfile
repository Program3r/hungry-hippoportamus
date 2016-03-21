FROM resin/rpi-raspbian:wheezy
RUN apt-get update && apt-get -y install wget ca-certificates nmap iptables git build-essential curl
RUN apt-get clean
WORKDIR /root
ENV NODE_VER v0.10.40
RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm
RUN /bin/sh -c '. ~/.nvm/nvm.sh && nvm install ${NODE_VER}'
ENV PATH $PATH:/bin/${NODE_VER}/bin
RUN npm install -g forever
RUN git clone https://github.com/Program3r/hungry-hippoportamus
WORKDIR /root/hungry-hippoportamus
RUN npm install
ENTRYPOINT forever -o out.log -e err.log index.js
