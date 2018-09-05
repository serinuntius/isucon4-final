#!/bin/bash

#ここ編集して実際のIPと合わせる
#
#[例]
#10.0.0.2:isu1
HOSTS=$(cat <<EOF
172.31.18.3 isu1
172.31.16.96 isu2
172.31.27.97 isu3
EOF
)

[[ $(grep isu1 /etc/hosts) ]] || echo "$HOSTS" >> /etc/hosts

if [[ ! $(hostname) =~ ^isu ]]; then
    for HOST_IP in $HOSTS; do
        IP=$(echo $HOST_IP | cut -d " " -f 1)
        HOST=$(echo $HOST_IP | cut -d " " -f 2)
        if [[ "$(ip addr)" =~ $IP ]]; then
            hostname $HOST
            echo $HOST > /etc/hostname
            echo "127.0.0.1 $HOST" >> /etc/hosts
            echo "hostname set: IP:${IP}\tHOSTNAME:${HOSTNAME}"
        fi
    done
fi
