#! /bin/bash

export ZOOBINDIR=$EQ_MATERIALS_DIR/bin/
. $ZOOBINDIR/zkEnv.sh

echo Starting zkcli1
EQ_ENV_ENTITY_ID=zkcli1 EQ_MODE_DIRECT=1 EQ_NO_INITIATION=1 java -cp $CLASSPATH:$EQ_MATERIALS_DIR/out/production/myZkCli -javaagent:$AGENT_CP=script:$EQ_MATERIALS_DIR/client.btm  MyZkCli localhost:2181 &
echo Started zkcli1

echo Starting zkcli2
EQ_ENV_ENTITY_ID=zkcli2 EQ_MODE_DIRECT=1 EQ_NO_INITIATION=1 java -cp $CLASSPATH:$EQ_MATERIALS_DIR/out/production/myZkCli -javaagent:$AGENT_CP=script:$EQ_MATERIALS_DIR/client.btm  MyZkCli localhost:2182
echo Started
