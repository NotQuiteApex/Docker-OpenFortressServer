# Open Fortress Server with Docker
A Docker image to streamline and easily deploy new Open Fortress servers. Requires [Docker](https://docker.com/) to be installed. Based off the ["official server guide"](https://steamcommunity.com/sharedfiles/filedetails/?id=2090433448). The image is rebuilt automatically every night with all the latest updates for everything.

# Tags
* [`latest`](Dockerfile.of) - The latest basic server image of Open Fortress.
* [`latest-sm`](Dockerfile.ofsm) - The latest server image of Open Fortress with SourceMod preinstalled. NOT WORKING YET.
* [`_tf2sdk`](Dockerfile.base) - The base image that is used to build the above two builds, includes TF2 and SDK and necessary tooling. Does not update often. DO NOT USE UNLESS DEBUGGING. 

# Deploying and Managing
Images can be downloaded and run with `docker run -P -d notquiteapex/openfortress_server` in detached mode and with all the ports published from the container. It is recommended that you also create a volume to access the server files as necessary, such as custom content or server config, or setting up SourceMod.

Whenever the server is stopped cleanly (like when using the quit command and not from a crash), Open Fortress, TF2, and the Source SDK will update in that order before the server brings itself back up.

You will still need to forward the ports on your router yourself.

# FAQ
Q: How do I use this? How do I do X? Why won't this work now?

A: This repo assumes you can do a few things: clone a Git repo, and download and use Docker. Support won't be offered otherwise. If you want to learn then Google is your friend, and I highly encourage you to learn!

Also, if this image no longer works it is likely due to something outside of my control. Things change as projects grow and Open Fortress has changed a lot from using GitHub to SVN to ToastVN meaning tools may just not work anymore, I will not and cannot guarantee support into the foreseeable future.

---
Q: Why do all this?

A: I don't have the ability to run servers 24/7 and have limited server space. Maintaining a build system for bringing everything together is much easier than trying to walk through the tutorial every time.

---
Q: Is SourceMod built in?

A: Currently it is not, but I plan to add a new tag for the image in the future with SourceMod already installed for you. For now you'll need to install it yourself.

---
Q: What's the docker-compose.yml for?

A: Having a compose file would be a lot nicer than having to type out a bunch of commands and arguments to get everything nicely set up for you like ports and volumes, the end goal is to only have to need to run `docker compose up` in a cloned repo and everything would be set up for you. It is not currently supported as I am still learning about the nuances of compose.

# License
This project's code is licensed under the MIT license, copyright Logan "NotQuiteApex" Hickok-Dickson. See [LICENSE.md](LICENSE.md) for more details.

This project pulls and uses assets belonging to multiple third-parties such as Valve Software or the Open Fortress dev team. These assets do not fall under the license described above.

This project makes use of [murse](https://git.sr.ht/~welt/murse), a CLI tool for managing ToastVN projects such as Open Fortress. Please see its repo for more details on its license and attribution.
