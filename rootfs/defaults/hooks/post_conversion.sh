#!/bin/sh
#
# This is an example of a post-conversion hook.  This script is always invoked
# with /bin/sh (shebang ignored).
#
# The first parameter is the conversion status.  A value of 0 indicates that
# the video has been converted successfully.  Else, conversion failed.
#
# The second parameter is the full path to the converted video (the output).
#
set -euo pipefail

CONVERSION_STATUS=$1
CONVERTED_FILE="$2"

echo "post-conversion: Status = $CONVERSION_STATUS"
echo "post-conversion: File = $CONVERTED_FILE"

if [ "$CONVERSION_STATUS" -eq 0 ]; then
    echo "Uploading successful conversion!"
    mv $CONVERTED_FILE $PLEX_LIBRARY_PATH
    curl http://$PLEX_SERVER:32400/library/sections/$PLEX_LIBRARY/refresh?X-Plex-Token=$PLEX_TOKEN
else
    echo "Removing failed conversion..."
    rm $CONVERTED_FILE
fi
