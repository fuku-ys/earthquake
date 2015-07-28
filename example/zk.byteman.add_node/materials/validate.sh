#! /bin/bash
set -x

$EQ_MATERIALS_DIR/zookeeper/bin/zkCli.sh -server localhost:2181 create /hoo bar

