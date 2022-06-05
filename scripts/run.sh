#!/bin/sh
# Runs the server itself. Configure any server specific settings here.
# Also updates the server whenever the server shuts down cleanly.
while :
do
	./srcds_run -console -game open_fortress \
		-insecure -timeout 0 -nohltv -autoupdate \
		-steam_dir ~/ofserver/ -steamcmd_script ~/tf2sdk-update.txt \
		|| exit 1
	
	until ~/of-update.sh
	do
		echo "Failed to update Open Fortress. Trying again in a five seconds."
		sleep 5
	done
done
