# Open Fortress Server with Docker
A Docker image to streamline and easily deploy new Open Fortress servers. Requires [Docker](https://docker.com/) to be installed. Based off the ["official server guide"](https://steamcommunity.com/sharedfiles/filedetails/?id=2090433448).

# Deploying and Managing
Simply run `docker compose up -d` in this repo to build and run the image. This will publish all the necessary ports and create a volume for you to access the server's files as necessary, and run the server detached from your current terminal (aka in the background). Keep in mind the image itself will be over 15 GB and will take a long time to build as it must download assets for TF2, the Source SDK, and Open Fortress.

Docker Hub images will be up eventually :tm:.

Whenever the server is stopped cleanly (like when using the quit command and not from a crash), Open Fortress, TF2, and the Source SDK will update in that order before the server brings itself back up.

You will still need to forward the ports on your router yourself.

# FAQ
Q: How do I use this? How do I do X? Why won't this work now?

A: This repo assumes you can do a few things: clone a Git repo, and download and use Docker. Support won't be offered otherwise. If you want to learn then Google is your friend, and I highly encourage you to learn!

Also, if this image no longer works it is likely due to something outside of my control. Things change as projects grow and Open Fortress has changed a lot from using GitHub to SVN to ToastVN, I will not and cannot guarantee support into the foreseeable future.
---
Q: Why do all this?

A: I don't have the ability to run servers 24/7 and have limited server space. Maintaining a build system for bringing everything together is much easier than trying to walk through the tutorial every time.

# License
This project's code is licensed under the MIT license, copyright Logan "NotQuiteApex" Hickok-Dickson. See [LICENSE.md](LICENSE.md) for more details.

This project makes use of [murse](https://git.sr.ht/~welt/murse), a CLI tool for managing ToastVN projects such as Open Fortress. Please see its repo for more details on its license and attribution.
