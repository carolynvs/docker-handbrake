#!/usr/bin/with-contenv sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

# Generate machine id.
echo "Generating machine-id..."
cat /proc/sys/kernel/random/uuid | tr -d '-' > /etc/machine-id

# Copy default configuration, if needed.
mkdir -p /config/ghb | true
if [ -d /defaults/preferences.json ]; then
  cp /defaults/ghb/* /config/ghb/
fi

# Copy default hooks, if needed.
mkdir -p /config/hooks | true
if [ -d /defaults/hooks ]; then
  cp /defaults/hooks/* /config/hooks/
fi

# Take ownership of the config directory.
chown -R $USER_ID:$GROUP_ID /config

# Take ownership of the output directory.
chown $USER_ID:$GROUP_ID /output

# vim: set ft=sh :
