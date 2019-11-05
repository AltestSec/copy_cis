#!/bin/sh
#some changes
echo "running for os ${OS}"
cd /home/nixadmin/nix-benchmark/${OS} && /bin/sh ./run-benchmark.sh
