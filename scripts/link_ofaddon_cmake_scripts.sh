#!/bin/bash
# <Description>
#


# Make sure we're in base directory and openFrameworks is checked out

if [ -d "openFrameworks" ] && [ -d "openFrameworks_addon_scripts" ]; then
    echo " We're in the right place, good!"
else
    echo "This script must be called from the base directory, like:"
    echo "    $ ./scripts/link_ofaddon_scripts.sh"
    exit 1
fi
BASE=$(pwd)
# For each of addon in openFrameworks_addon_scripts create a symlink 
# in the corresponding directory in the openFrameworks directory

for D in `find openFrameworks_addon_scripts/addons/ -type d`
do
    ADDONNAME=$(basename $D)
    # not the addon dir    
    if [ "${ADDONNAME}" == "addons" ]; then
        continue
    fi

    SOURCE="${BASE}/openFrameworks_addon_scripts/addons/${ADDONNAME}/CMakeLists.txt"
    TARGET="${BASE}/openFrameworks/addons/${ADDONNAME}/"

    if [ ! -d "${TARGET}" ]; then
        echo " * ${ADDONNAME} not present in oF addon directory"
        continue
    fi

    if [ -L "${TARGET}/${ADDONNAME}.cmake" ]; then
        echo " * removing old .cmake symlink"
	rm "${TARGET}/${ADDONNAME}.cmake"
    fi

    if [ -L "${TARGET}/CMakeLists.txt" ]; then
        echo " * ${TARGET}/CMakeLists.txt already is a symlink"
        continue
    fi    

    if [ -f "${TARGET}/CMakeLists.txt" ]; then
        echo " * Removing file at target"
        rm "${TARGET}/CMakeLists.txt"
    fi
 
    echo " * Linking cmake script for ${ADDONNAME}"
    cd ${TARGET}
    ln -s ${SOURCE}
done
