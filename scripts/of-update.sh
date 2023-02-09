#!/usr/bin/env bash
# Updates Open Fortress.

echo "Downloading Open Fortress via toast."
./murse upgrade ./sdk/open_fortress/ -1
if [ $? -ne 0 ]; then
	echo "Toast link failed, trying next..."
	continue
fi
echo "Download complete."
echo "Verifying toast..."
./murse verify ./sdk/open_fortress/ -r -1
if [ $? -ne 0 ]; then
	echo "Toast verify failed, trying next..."
	continue
fi
echo "Verify success."

echo "Fixing gameinfo.txt"
sed -i 's+|all_source_engine_paths|..\\Team Fortress 2\\+/root/.steam/ofsv/tf2/+g' ./sdk/open_fortress/gameinfo.txt

echo "Removing C++ binary"
rm ./sdk/bin/libstdc++.so.6

echo "Install complete, exiting."
exit 0
