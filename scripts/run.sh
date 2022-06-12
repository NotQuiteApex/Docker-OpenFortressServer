#!/usr/bin/env bash
# Runs the server itself. Configure any server specific settings here.
# Also updates the server whenever the server shuts down cleanly.
while :
do
	echo "Updating TF2 + SDK."
	until steamcmd +runscript ./tf2sdk-update.txt
	do
		echo "Failed to update TF2 + SDK. Trying again in a five seconds."
		sleep 5
	done
	echo "TF2 + SDK update finished."
	
	echo "Updating Open Fortress."
	until ./of-update.sh
	do
		echo "Failed to update Open Fortress. Trying again in a five seconds."
		sleep 5
	done
	echo "Open Fortress update finished."

	echo "Starting Server."
	./sdk/srcds_run -console -game open_fortress \
		-secure -timeout 0 -nohltv -nobreakpad \
		+map dm_2fort
	if [$? -eq 1] || [$? -eq 130]; then
		echo "Something went wrong, the server may have crashed."
		echo "Please check the logs before starting back up."
		exit 1
	fi
	echo "Server exited."
done
