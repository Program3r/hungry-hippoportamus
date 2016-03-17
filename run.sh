docker run --restart=always --name="service-discovery" --privileged -t -i -d --net=host service-discovery forever -o out.log -e err.log index.js
