#!/usr/bin/env bash
# Updates Open Fortress.

echo "Downloading Open Fortress via beans."

while :
do
    if [ -d "open_fortress" ]; then
        echo "OF is installed. Updating."
        ./beans --update ./sdk/
        if [ $? -ne 0 ]; then
            echo "Beans upgrade failed, retrying..."
            continue
        fi
        echo "Beans update complete."
		break
    else
        echo "OF is not installed. Instaling."
        ./beans --install ./sdk/
        if [ $? -ne 0 ]; then
     	    echo "Beans install failed, retrying..."
     	    continue
        fi
        echo "Beans install complete."
		break
    fi
done

echo "Fixing gameinfo.txt"
sed -i 's+|all_source_engine_paths|..\\Team Fortress 2\\+/root/.steam/ofsv/tf2/+g' ./sdk/open_fortress/gameinfo.txt

echo "Removing C++ binary"
rm ./sdk/bin/libstdc++.so.6

echo "Install complete, exiting."
exit 0
