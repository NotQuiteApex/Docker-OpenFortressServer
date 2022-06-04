# syntax=docker/dockerfile:1
# Start with the base image.
FROM steamcmd/steamcmd:alpine

# Some dependencies to download.
RUN apk add --no-cache python3 py3-pip

# Expose the SRCDS port.
# People who run the container will still need to route the port themselves.
EXPOSE 27015/tcp
EXPOSE 27015/udp

# Import the scripts used to set it all up.
ADD ./scripts/* ./

RUN mkdir ofserver && cd ofserver && ./tf2sdk-update.sh
