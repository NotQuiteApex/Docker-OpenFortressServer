# syntax=docker/dockerfile:1
# Start with the base image.
FROM steamcmd/steamcmd:alpine
WORKDIR /root/

# Some dependencies to download.
# RUN apk add --no-cache python3 py3-pip
RUN apk add --no-cache curl

# Install tooling (murse). This downloads Open Fortress for us.
RUN curl -L https://dl.spiderden.net/murse/linux -o murse && chmod +x ~/murse

# Copy everything in.
ADD ./scripts/* .

# Install TF2 and Source SDK.
RUN mkdir ~/ofserver/
RUN steamcmd +runscript ~/tf2sdk-update.txt
# Install Open Fortress.
RUN ~/of-update.sh
# Link binaries.
RUN ~/symlink-binaries.sh

# Insert server config and start script defined in scripts.
RUN mv -f ~/server.cfg ~/ofserver/sdk/open_fortress/cfg/
RUN mv -f ~/run.sh ~/ofserver/sdk/

# Expose the SRCDS port. Purely for the -P cli argument.
# People who run the container will still need to route the port themselves.
EXPOSE 27015/tcp
EXPOSE 27015/udp

# Lastly, set the entrypoint to be the run.sh script
WORKDIR /root/ofserver/sdk/
ENTRYPOINT [ "./run.sh" ]
