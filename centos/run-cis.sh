#!/bin/sh


path="/home/nixadmin/nix-benchmark"
mount_path="/mnt/ext_storage/rootfs"


if [ -e "$mount_path" ]
then
echo "$mount_path exist"
else
echo "destination folder does not exist. Creating ....."  && $(mkdir -p $(echo "$mount_path"))
fi




if  [ -e /results.txt  ]
then 
echo "file exist. Removing" && $(rm -f /resutls.txt)
fi

exec 1>/results.txt

test_wrapper() {
	local ref=$1
	shift
	local msg=$1
	shift
	local score=$1
	shift
	local server=$1
	shift
	local workstation=$1


	# -- count the totals for the baseline
	if [[ $score == 'Yes' ]]; then
		if [[ $server == 'Server1' ]]; then
			score_server1_total=$((score_server1_total+1))
		fi
		if [[ $server == 'Server1' || $server == 'Server2' ]]; then
			score_server2_total=$((score_server2_total+1))
		fi
		if [[ $workstation == 'Workstation1' ]]; then
			score_workstation1_total=$((score_workstation1_total+1))
		fi
		if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
			score_workstation2_total=$((score_workstation2_total+1))
		fi
	else
		if [[ $server == 'Server1' ]]; then
			noscore_server1_total=$((noscore_server1_total+1))
		fi
		if [[ $server == 'Server1' || $server == 'Server2' ]]; then
			noscore_server2_total=$((noscore_server2_total+1))
		fi
		if [[ $workstation == 'Workstation1' ]]; then
			noscore_workstation1_total=$((noscore_workstation1_total+1))
		fi
		if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
			noscore_workstation2_total=$((noscore_workstation2_total+1))
		fi
	fi

	if [[ -f ./test/${ref}.sh ]]; then
		bash ./test/${ref}.sh ${args} > /dev/null 2>/dev/null
		if [[ "$?" -eq 0 ]]; then
			echo -e "PASS - $ref - ${msg}"
			
			# -- count the success for the baseline
			if [[ $score == 'Yes' ]]; then
				if [[ $server == 'Server1' ]]; then
					score_server1_ok=$((score_server1_ok+1))
				fi
				if [[ $server == 'Server1' || $server == 'Server2' ]]; then
					score_server2_ok=$((score_server2_ok+1))
				fi
				if [[ $workstation == 'Workstation1' ]]; then
					score_workstation1_ok=$((score_workstation1_ok+1))
				fi
				if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
					score_workstation2_ok=$((score_workstation2_ok+1))
				fi
			else
				if [[ $server == 'Server1' ]]; then
					noscore_server1_ok=$((noscore_server1_ok+1))
				fi
				if [[ $server == 'Server1' || $server == 'Server2' ]]; then
					noscore_server2_ok=$((noscore_server2_ok+1))
				fi
				if [[ $workstation == 'Workstation1' ]]; then
					noscore_workstation1_ok=$((noscore_workstation1_ok+1))
				fi
				if [[ $workstation == 'Workstation1' || $workstation == 'Workstation2' ]]; then
					noscore_workstation2_ok=$((noscore_workstation2_ok+1))
				fi
			fi
		else
			echo -e "FAIL - $ref - ${msg}"
		fi
	else
		echo -e "SKIP - $ref - ${msg}"
	fi
}

if [[ $(whoami) != "root" ]]; then
        echo "You must run this script as root"
        exit 1
fi

echo "CIS CentOS Linux 7 Benchmark (v2.2.0 - 12-27-2017)"
echo
echo hostname : `hostname`
echo time     : `date`
echo =================================================================================
test_wrapper 1.2.1 "Ensure package manager repositories are configured (Not Scored)" No Server1 Workstation1
test_wrapper 1.2.2 "Ensure GPG keys are configured (Not Scored)" No Server1 Workstation1
test_wrapper 1.3.1 "Ensure AIDE is installed (Scored)" Yes Server1 Workstation1
test_wrapper 1.4.1 "Ensure permissions on bootloader config are configured (Scored)" Yes Server1 Workstation1
test_wrapper 1.5.4 "Ensure prelink is disabled (Scored)" Yes Server1 Workstation1
test_wrapper 1.6.1.4 "Ensure SETroubleshoot is not installed (Scored)" Yes Server2 Workstation2
test_wrapper 1.6.1.5 "Ensure the MCS Translation Service (mcstrans) is not installed (Scored)" Yes Server2 Workstation2
test_wrapper 1.6.2 "Ensure SELinux is installed (Scored)" Yes Server2 Workstation2
test_wrapper 1.7.1.4 "Ensure permissions on /etc/motd are configured (Not Scored)" No Server1 Workstation1
test_wrapper 1.7.1.5 "Ensure permissions on /etc/issue are configured (Scored)" Yes Server1 Workstation1
test_wrapper 1.7.1.6 "Ensure permissions on /etc/issue.net are configured (Not Scored)" No Server1 Workstation1
test_wrapper 2.2.1.1 "Ensure time synchronization is in use (Not Scored)" No Server1 Workstation1
test_wrapper 2.2.2 "Ensure X Window System is not installed (Scored)" Yes Server1 Workstation2
test_wrapper 2.3.1 "Ensure NIS Client is not installed (Scored)" Yes Server1 Workstation1
test_wrapper 2.3.2 "Ensure rsh client is not installed (Scored)" Yes Server1 Workstation1
test_wrapper 2.3.3 "Ensure talk client is not installed (Scored)" Yes Server1 Workstation1
test_wrapper 2.3.4 "Ensure telnet client is not installed (Scored)" Yes Server1 Workstation1
test_wrapper 2.3.5 "Ensure LDAP client is not installed (Scored)" Yes Server1 Workstation1
test_wrapper 3.4.1 "Ensure TCP Wrappers is installed (Scored)" Yes Server1 Workstation1
test_wrapper 3.4.4 "Ensure permissions on /etc/hosts.allow are configured (Scored)" Yes Server1 Workstation1
test_wrapper 3.4.5 "Ensure permissions on /etc/hosts.deny are configured (Scored)" Yes Server1 Workstation1
test_wrapper 3.6.1 "Ensure iptables is installed (Scored)" Yes Server1 Workstation1
test_wrapper 4.2.3 "Ensure rsyslog or syslog-ng is installed (Scored)" Yes Server1 Workstation1
test_wrapper 5.1.2 "Ensure permissions on /etc/crontab are configured (Scored)" Yes Server1 Workstation1
test_wrapper 5.1.3 "Ensure permissions on /etc/cron.hourly are configured (Scored)" Yes Server1 Workstation1
test_wrapper 5.1.4 "Ensure permissions on /etc/cron.daily are configured (Scored)" Yes Server1 Workstation1
test_wrapper 5.1.5 "Ensure permissions on /etc/cron.weekly are configured (Scored)" Yes Server1 Workstation1
test_wrapper 5.1.6 "Ensure permissions on /etc/cron.monthly are configured (Scored)" Yes Server1 Workstation1
test_wrapper 5.1.7 "Ensure permissions on /etc/cron.d are configured (Scored)" Yes Server1 Workstation1
test_wrapper 5.1.8 "Ensure at/cron is restricted to authorized users (Scored)" Yes Server1 Workstation1
test_wrapper 5.2.1 "Ensure permissions on /etc/ssh/sshd_config are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.1 "Audit system file permissions (Not Scored)" No Server2 Workstation2
test_wrapper 6.1.2 "Ensure permissions on /etc/passwd are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.3 "Ensure permissions on /etc/shadow are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.4 "Ensure permissions on /etc/group are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.5 "Ensure permissions on /etc/gshadow are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.6 "Ensure permissions on /etc/passwd- are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.7 "Ensure permissions on /etc/shadow- are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.8 "Ensure permissions on /etc/group- are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.1.9 "Ensure permissions on /etc/gshadow- are configured (Scored)" Yes Server1 Workstation1
test_wrapper 6.2.9 "Ensure users own their home directories (Scored)" Yes Server1 Workstation1

echo
echo Results
echo
echo "Scored (Server)"
echo ====================================
echo Server 1 = $score_server1_ok / $score_server1_total
echo Server 2 = $score_server2_ok / $score_server2_total

echo
echo "Scored (Workstation)"
echo ====================================
echo Workstation 1 = $score_workstation1_ok / $score_workstation1_total
echo Workstation 2 = $score_workstation2_ok / $score_workstation2_total

echo
echo "Not Scored (Server)"
echo ====================================
echo Server 1 = $noscore_server1_ok / $noscore_server1_total
echo Server 2 = $noscore_server2_ok / $noscore_server2_total
echo
echo "Not Scored (Workstation)"
echo ====================================
echo Workstation 1 = $noscore_workstation1_ok / $noscore_workstation1_total
echo Workstation 2 = $noscore_workstation2_ok / $noscore_workstation2_total





