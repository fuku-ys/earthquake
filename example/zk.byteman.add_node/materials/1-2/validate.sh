#! /bin/bash
set -x

sleep 10
bash $EQ_MATERIALS_DIR/check-fle-states.sh 2181 2182 2183 2184 2185
$EQ_MATERIALS_DIR/zookeeper/bin/zkCli.sh -server localhost:2181,localhost:2182,localhost:2183,localhost:2184,localhost:2185 create /hoo bar

