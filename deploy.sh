#!/bin/sh
# Builds the image with the tag "ofserver" and then immediately runs it in
# detached mode with the default ports exposed.
docker build . -t ofserver && \
	docker run -d -P ofserver:latest
