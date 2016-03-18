docker run --restart=always --name="service-discovery" --privileged -t -i -d --net=host program3r/hungry-hippoportamus forever -o out.log -e err.log index.js
