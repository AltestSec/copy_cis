#!/bin/sh
echo "running for os ${OS}"
cd /home/nixadmin/nix-benchmark/${OS} && /bin/sh ./run-benchmark.sh

