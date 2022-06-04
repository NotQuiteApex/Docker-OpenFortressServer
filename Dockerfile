# syntax=docker/dockerfile:1
# Start with the base image.
FROM steamcmd/steamcmd:alpine

# Some dependencies to download.
RUN apk add --no-cache python3 py3-pip

# Copy everything in.
ADD ./toast/ ./toast/
ADD ./oflauncher-rei/ ./oflauncher-rei/
ADD ./ofserver/ ./ofserver/

# Compile and install tooling.
RUN cd ./toast/ && pip3 install .

# Import the scripts used to set it all up.
RUN ./ofserver/tf2sdk-update.sh

# Do some final linking of binaries.
RUN ./ofserver/symlink-binaries.sh

# Install Open Fortress finally
RUN ./oflauncher-rei/ofrei/cli.py upgrade 

# Expose the SRCDS port.
# People who run the container will still need to route the port themselves.
EXPOSE 27015/tcp
EXPOSE 27015/udp
