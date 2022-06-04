#!/bin/sh
# Updates the TF2 server files and the Source SDK
steamcmd +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 \
	+login anonymous \
	+force_install_dir ./tf2 +app_update 232250 \
	+force_install_dir ./sdk +app_update 244310 \
	+quit