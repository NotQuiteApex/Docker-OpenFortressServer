#!/bin/sh
# Runs the server itself. Configure any server specific settings here.
./srcds_run -console -game open_fortress \
	-insecure -timeout 0 -nohltv \
	-autoupdate -steam_dir ~/ofserver/ -steamcmd_script ~/fullupdate.txt
