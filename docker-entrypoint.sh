#!/bin/bash

# Rip from https://github.com/linuxserver/docker-baseimage-ubuntu/blob/bionic/root/etc/cont-init.d/10-adduser

PUID=${PUID:-911}
PGID=${PGID:-911}
UMASK=${UMASK:-000}

groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc
umask "$UMASK"

echo "
-------------------------
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-------------------------
"

chown abc:abc /config
chown abc:abc /output

cd /output
su-exec abc:abc "$@"
