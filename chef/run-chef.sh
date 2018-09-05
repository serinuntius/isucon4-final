#!/bin/bash

WORK_DIR=$(cd $(dirname $0); pwd)
HOSTNAME=$(hostname)

cd $WORK_DIR

sudo chef-solo -c ${WORK_DIR}/config/solo.rb -j ${WORK_DIR}/nodes/node-${HOSTNAME}.json ${@}
