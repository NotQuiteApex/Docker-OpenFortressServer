# syntax=docker/dockerfile:1
# Start with the base image.
FROM steamcmd/steamcmd:alpine

# Some dependencies to download.
# RUN apk add --no-cache python3 py3-pip
RUN apk add --no-cache curl

# Install tooling (murse)
RUN curl -L https://dl.spiderden.net/murse/linux -o murse && chmod +x ./murse

# Copy everything in.
ADD ./scripts/* .

# Install TF2 and Source SDK.
RUN mkdir ~/ofserver/
RUN steamcmd +runscript ~/fullupdate.txt
# Install Open Fortress.
RUN ./murse upgrade ~/ofserver/sdk/open_fortress/
# Link binaries.
RUN ~/symlink-binaries.sh

# Insert server config defined in scripts.
RUN mv -f ~/server.cfg ~/ofserver/sdk/open_fortress/cfg

# Expose the SRCDS port.
# People who run the container will still need to route the port themselves.
EXPOSE 27015/tcp
EXPOSE 27015/udp

# Lastly, set the entrypoint to be the run.sh script
ENTRYPOINT [ "cd", "~/ofserver/sdk/", "&&", "./run.sh" ]
