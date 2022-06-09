#!/usr/bin/env bash
# Runs the server itself. Configure any server specific settings here.
# Also updates the server whenever the server shuts down cleanly.
while :
do
	echo "Starting Server."
	./srcds_run -console -game open_fortress \
		-insecure -timeout 0 -nohltv -autoupdate \
		-steam_dir /root/server/ -steamcmd_script /root/tf2sdk-update.txt \
		|| exit 1
	echo "Server exited."
	
	echo "Updating Open Fortress"
	until ~/of-update.sh
	do
		echo "Failed to update Open Fortress. Trying again in a five seconds."
		sleep 5
	done
done
