mkdir /tmp/eq_test

# dumb
bin/earthquake init example/zk.byteman.add_node/config_dumb.json example/zk.byteman.add_node/materials /tmp/eq_test
# random
bin/earthquake init example/zk.byteman.add_node/config_random.json example/zk.byteman.add_node/materials /tmp/eq_test

# once
bin/earthquake run /tmp/eq_test
# loop
for i in `seq 1 1000`; do bin/earthquake run /tmp/eq_test; done

bin/earthquake tools summary /tmp/eq_test
bin/earthquake tools visualize --mode gnuplot /tmp/eq_test


