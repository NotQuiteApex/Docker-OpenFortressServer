# Open Fortress Server with Docker
A Docker image to streamline and easily deploy new Open Fortress servers. Requires [Docker](https://docker.com/) to be installed. Based off the ["official server guide"](https://steamcommunity.com/sharedfiles/filedetails/?id=2090433448).

# Deploying and Managing
The server.cfg file in the scripts directory includes some basic default settings as well as information for customizing your server to your liking. Edit it before building to have your image save your custom config.

In a Linux environment with Docker installed, you can simply run the `deploy.sh` script to build and run the server in detached mode. This will publish the default Source Dedicated Server port 27015. In any other scenario where custom configuration is necessary, you will need to build and run the docker image yourself, as well as publish the ports.

You will still need to forward the ports on your router yourself.

# License
This project's code is licensed under the MIT license, copyright Logan "NotQuiteApex" Hickok-Dickson. See [LICENSE.md](LICENSE.md) for more details. 
