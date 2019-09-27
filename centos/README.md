# centos-cis-benchmark
Based on CIS CentOS Linux 7 Benchmark
v2.2.0 - 12-27-2017


## Description

All tests are ordered in "test" folder  and they are numbered according to documentation.
Script run-cis.sh starts all tests one by one
Script run-benchmark.sh  makes chroot and then runs run-cis.sh


## Requirements

The external filesystem should be mounted in /mnt/ext_storage/rootfs
The script should be run with root permissions

## How to run the audit
To run the audit, execute these steps

1. Mount external filesystem.
2. Run run-cis.sh
3. Press Ctrl+D
4. You can find the results.txt in /mnt/ext_storage/rootfs 

## Remediation
Some remediation scripts are also included, however use them at your own risk.  While most of the scripts would correct the problem, they could cause outages on your system, so be sure to have a proper roll back plan before you execute the scripts.

## Acknowledgement
* https://github.com/haxorof/centos-bench-security


