#!/bin/bash
[[ $1 ]] && MK="-C $1 $2"
! [[ -f log.txt ]] && make $MK --always-make --silent --dry-run > log.txt
cat log.txt | tr ' ' '\n' | grep "^\-[fID]" | sort -u
