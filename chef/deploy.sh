#!/bin/bash

WORK_DIR=$(cd $(dirname $0); pwd)

cd $WORK_DIR

#ミドルウェアの再起動
supervisorctl restart isucon_go
