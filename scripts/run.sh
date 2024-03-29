#!/usr/bin/env bash
# Runs the server itself. Configure any server specific settings here.
# Also updates the server whenever the server shuts down cleanly.
while :
do
	echo "Updating TF2 + SDK."
	until steamcmd +runscript /root/.steam/ofsv/tf2sdk-update.txt
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
	echo "Using args: "
	echo "./sdk/srcds_run -console -game open_fortress -secure -secure -timeout 0 -nobreakpad \\"
	echo "$@"
	./sdk/srcds_run -console -game open_fortress \
		-secure -secure -timeout 0 -nobreakpad "$@"
	EXITCODE=$?
	if [$EXITCODE -eq 1] || [$EXITCODE -eq 130]; then
		echo "Something went wrong, the server may have crashed."
		echo "Please check the logs before starting back up."
		exit 1
	fi
	echo "Server exited. Restarting..."
done
