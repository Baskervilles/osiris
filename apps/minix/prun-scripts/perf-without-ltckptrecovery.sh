#!/bin/bash

# Perf Unixbench for MINIX statically linked with ltckpt
# but with no ltckpt and recovery hooks placed.
: ${TESTNAME="perf_no-lt_no-rc_allsrv"}

if [ -z "$MROOT" -a -f prun-scripts/perf-common.inc ]; then
	MROOT="$PWD"
elif [ ! -f "$MROOT/prun-scripts/edfi-common.inc" ]; then
	echo "error: either run from llvm-apps/apps/minix or set MROOT to that directory" >&2
	exit 1
fi

export TESTNAME
export LOGFILE
export MROOT

. $MROOT/prun-scripts/perf-common.inc

#######   Env setup  ################################################

setup_env

# Test specific initialization
export BBCLONE=0
export DISABLERECOVERY=1

# Optimistic recovery model
export IPC_DEFAULT_DECISION=1
export KC_DEFAULT_DECISION=1

instrument

#######   Test execution   ##########################################

launch_test
