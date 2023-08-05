#!/usr/bin/env bash
# Builds a new Open Fortress image from scratch.

set -e

print_help()
{
	echo "Open Fortress Server Docker build script - NotQuiteApex"
	echo "Please remember to set OFSV_BUILD_DOCKER_USERNAME and OFSV_BUILD_DOCKER_PASSWORD environment variables."
	echo "Usage: "
	echo "./build.sh build <image_set> - build type of docker image set"
	echo "	Available image sets are:"
	echo "		- full - all three OFSV images are built, using a new base image"
	echo "		- cache - reusing the latest available cache image, OFSV is updated to the latest version"
	echo "./build.sh help - print this usage"
}

if [ $# -gt 0 ]; then
	if [ "$1" == "build" ]; then
		if [ "$2" == "full" ]; then
			echo "Building Open Fortress Server images from scratch."
			echo "Logging into Docker."
			echo ${OFSV_BUILD_DOCKER_PASSWORD} | docker login -u ${OFSV_BUILD_DOCKER_USERNAME} --password-stdin
			echo "Building cache image."
			docker build . -t notquiteapex/ofsv:_cache -f ./dockerfiles/Dockerfile.cache --progress=plain
			echo "Pushing cache image."
			docker push notquiteapex/ofsv:_cache
			echo "Building ofsv latest image."
			docker build . -t notquiteapex/ofsv:latest -f ./dockerfiles/Dockerfile.of --progress=plain
			echo "Pushing ofsv latest image."
			docker push notquiteapex/ofsv:latest
			echo "Building ofsv-sm latest image."
			docker build . -t notquiteapex/ofsv:latest-sm -f ./dockerfiles/Dockerfile.ofsm --progress=plain
			echo "Pushing ofsv-sm latest image."
			docker push notquiteapex/ofsv:latest-sm
			echo "Full build complete."
		elif [ "$2" == "cache" ]; then
			echo "Building Open Fortress Server images with cache."
			echo "Logging into Docker."
			echo ${OFSV_BUILD_DOCKER_PASSWORD} | docker login -u ${OFSV_BUILD_DOCKER_USERNAME} --password-stdin
			echo "Building ofsv latest image."
			docker build . -t notquiteapex/ofsv:latest -f ./dockerfiles/Dockerfile.of --progress=plain
			echo "Pushing ofsv latest image."
			docker push notquiteapex/ofsv:latest
			echo "Building ofsv-sm latest image."
			docker build . -t notquiteapex/ofsv:latest-sm -f ./dockerfiles/Dockerfile.ofsm --progress=plain
			echo "Pushing ofsv-sm latest image."
			docker push notquiteapex/ofsv:latest-sm
			echo "Cache build complete."
		else
			echo "Unrecognized image set '$2'."
			print_help
		fi
	elif [ "$1" == "help" ]; then
		print_help
	else
		echo "Unrecognized command '$1'."
		print_help
	fi
else
	print_help
fi
