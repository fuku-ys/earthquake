#! /bin/bash
set -x

export ZOOBINDIR=$EQ_MATERIALS_DIR/zookeeper/bin
. $ZOOBINDIR/zkEnv.sh

for i in `seq 1 2`;
do
    sleep 1
    P1=$((2183 + $i))
    P2=$((2890 + $i))
    P3=$((3890 + $i))
    NO=$((3 + $i))

    java -cp $CLASSPATH:$EQ_MATERIALS_DIR/AddNodeZkCli AddNodeZkCli localhost:2181 server.$NO=localhost:$P2:$P3:participant\;$P1

done

