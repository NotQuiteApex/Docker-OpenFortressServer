# Open Fortress Server with Docker
A Docker image to streamline and easily deploy new Open Fortress servers. Requires [Docker](https://docker.com/) to be installed. Based off the old [official Linux server guide](https://web.archive.org/web/20210602043159/https://steamcommunity.com/sharedfiles/filedetails/?id=2090433448). The image is rebuilt automatically every week on Sunday with all the latest updates for everything.

# Tags
* [`latest`](Dockerfile.of) - The latest basic server image of Open Fortress, with all files updated weekly.
* [`latest-sm`](Dockerfile.ofsm) - The latest server image of Open Fortress with SourceMod preinstalled, with all files updated weekly.
* [`_cache`](Dockerfile.cache) - The base image that is used to build the above two builds, includes TF2, Source SDK 2013 MP Base, and Open Fortress. Does not update often. DO NOT USE UNLESS DEBUGGING.

# Simple Guide - Setting up and deploying a simple server
0. First off, you'll want to [install Docker](https://docs.docker.com/engine/install/), this tutorial assumes you will be using Docker on some flavor of Linux, and know some basic stuff about Linux.
0. Next, you'll want to clone/download this repo, cd into the cloned repo, then `docker compose up` to run the server attached to your terminal.
0. The server will start up, first updating TF2 and the SDK, then Open Fortress, and then properly start the server. You will see a message about root access, this is safe to ignore. You may also see a message about no map being specified, this is safe to ignore if a map is selected in autoexec.cfg (which there is by default, dm_2fort).
0. The output will say what its public IP is, indicating that the server is up and running an accessible. You can send a keyboard interrupt (ctrl+c) to stop the server.

Notes:
- If you want to run the server detached, you can run `docker compose up -d` to detach it from your terminal; you'll want to run `docker compose stop` if you want to stop the server if it's detached.
- You can access the server's files with the volumes created by Docker in the `/var/lib/docker/volumes/` directory, although you will need superuser/root access to manage them (this is a limitation of Docker).
- You can run `docker compose down` to remove the container and volumes for the server.
- You will still need to forward the ports 27005 and 27015 yourself on your router.

# Expert Guide - SourceMod, custom content, and more
If you know Docker pretty well or need some specific changes to the setup, you can change the [docker-compose.yml](docker-compose.yml). For example, if you'd like to run the server with SourceMod for plugins and better server management, edit the compose file to change the image tag from "latest" to "latest-sm".

To add/edit files to/on your server, certain directories for the server are exposed as Docker volumes. If using the default [docker-compose.yml](docker-compose.yml), these named volumes are `of_cfg`, `of_custom`, and `of_addons` for useful server directories you might want to edit and add files to. They are analogous to the server's cfg folder, custom folder, and addons folder respectively. The latter of which can be used to install and manage SourceMod. You can learn how to access these volumes [here](https://docs.docker.com/storage/volumes/#create-and-manage-volumes), using the `docker volume inspect` command and using the outputed mount point.

The Open Fortress Docker Image bases the image off itself to simply update the files of the game. This is done with the [Dockerfile.of](dockerfiles/Dockerfile.of) file in the dockerfiles folder, however if you need to build the image from scratch the [Dockerfile.cache](dockerfiles/Dockerfile.cache) file will be what you need to use.

# License
This project's code is licensed under the MIT license, copyright Logan "NotQuiteApex" Hickok-Dickson. See [LICENSE.md](LICENSE.md) for more details.

This project pulls and uses assets belonging to multiple third-parties such as Valve Software or the Open Fortress dev team. These assets do not fall under the license described above, and are subject to any terms described by the respective license holder(s).

This project makes use of [murse](https://git.sr.ht/~welt/murse), a CLI tool developed by Welt for managing Toast projects such as Open Fortress. Please see its repo for more details on its license and attribution.
