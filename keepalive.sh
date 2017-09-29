#!/bin/bash

# MODIFIED: 03/06/15
# AUTHOR: Alex Gurrola
# DESCRIPTION: netstats tunnel ports and runs tunnel restart script if ports are dead
# EXECUTE: /var/www/core/services/ssh_tunnel_keepalive.sh


#######################
# VARS
#######################
description="Database Tunnel"
process="/etc/init.d/z-gutensite-tunnels"
ports=( 4010 4011 4012 5010 )


#######################
# ACTIONS
#######################

for port in "${ports[@]}"
do
    service=`netstat -tlnp 2>/dev/null | grep $port`
    if [ -z "$service" ]; then
        echo "Couldn't find $description $port running, restarting related services."
        bash "$process"
        echo "$description started!"
        break
    fi
done
