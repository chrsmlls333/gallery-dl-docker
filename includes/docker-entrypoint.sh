#!/bin/bash

hostname=$(cat /etc/hostname)
default_shell="/bin/bash"

# Update Main Python Packages

echo "> Updating Python Packages"
pip install --upgrade --root-user-action=ignore \
  gallery-dl yt-dlp \
  | grep -v 'already satisfied'
echo "    ...complete"

# Handle User Permissions
# Rip from https://github.com/linuxserver/docker-baseimage-ubuntu/blob/bionic/root/etc/cont-init.d/10-adduser

echo "
> Adjusting Permissions & IDs"

PUID=${PUID:-911}
PGID=${PGID:-911}
UMASK=${UMASK:-000}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc
umask "$UMASK"

chown abc:abc /config
chown abc:abc /output

echo "
> Created Downloader User 'abc'
    uid: $(id -u abc)
    gid: $(id -g abc)"

# Help Intro

echo "
> Usage: 
    gallery-dl [OPTION]... URL...
    See 'gallery-dl --help' to get a list of all options.
"

# Launch into Non-Root Shell

cd /output
su-exec abc:abc "${@:-$default_shell}"
