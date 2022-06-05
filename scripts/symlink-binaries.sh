#!/bin/sh
# Links shared objects with their server counterparts.
cd ~/ofserver/sdk/bin
ln -s datacache_srv.so datacache.so
ln -s dedicated_srv.so dedicated.so
ln -s engine_srv.so engine.so
ln -s materialsystem_srv.so materialsystem.so
ln -s replay_srv.so replay.so
ln -s scenefilecache_srv.so scenefilecache.so
ln -s shaderapiempty_srv.so shaderapiempty.so
ln -s soundemittersystem_srv.so soundemittersystem.so
ln -s studiorender_srv.so studiorender.so
ln -s vphysics_srv.so vphysics.so
cd -

cd ~/ofserver/sdk/open_fortress/bin
ln -s server.so server_srv.so
cd -
