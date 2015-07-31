#! /bin/bash
set -x

export EQ_HOME=/home/fukuda/earthquake

# copy earthquake-inspector.jar
cp -u $EQ_HOME/bin/earthquake-inspector.jar $EQ_MATERIALS_DIR/

# download zookeeper to this dir
if [ ! -e $EQ_MATERIALS_DIR/zookeeper ];
then
    git clone https://github.com/apache/zookeeper.git $EQ_MATERIALS_DIR/zookeeper
    pushd $EQ_MATERIALS_DIR/zookeeper
    ant
    popd
fi

javac -cp $(find . -name '*.jar' | perl -pe 's/\n/:/g') $EQ_MATERIALS_DIR/CreateZnodeZkCli/*.java
javac -cp $(find . -name '*.jar' | perl -pe 's/\n/:/g') $EQ_MATERIALS_DIR/AddNodeZkCli/*.java

export ZOOBINDIR=$EQ_MATERIALS_DIR/zookeeper/bin
. $ZOOBINDIR/zkEnv.sh

export AGENT_CP=$EQ_MATERIALS_DIR/earthquake-inspector.jar


cp -R $EQ_MATERIALS_DIR/quorumconf.template $EQ_WORKING_DIR/quorumconf

sleep 1
bash $EQ_MATERIALS_DIR/quorumStart.sh
sleep 5
bash $EQ_MATERIALS_DIR/concurrentWrite.sh &
bash $EQ_MATERIALS_DIR/addNode.sh
sleep 1
