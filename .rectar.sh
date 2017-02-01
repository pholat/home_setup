#!/bin/bash
# Script looking for stuff in tar files recursivelly
# TODO remove redundancy

shopt -s extglob
set -e

declare -a DIRTREE

# TODO store all names in arrays of arrays and print them
is_array() {
    local variable_name=$1
    [[ "$(declare -p $variable_name 2>/dev/null)" =~ "declare -a" ]]
}

is_tar() {
    if [[ "$1" =~ ^.*\.t(ar|gz)$ ]]; then
        return 0
    else
        return 1
    fi
}

# TODO print DIRTREE beutifuly 

# Recursive tar listener
foo() {
    local catl=${1}
    if is_tar $1; then
        catl=TMP_${catl::-4}
        mkdir $catl
        tar -xf $1 -C $catl
        cd $catl
    elif [[ -d $1 ]]; then
        cd $1
    fi
    local insides=$(ls) 
	# For all elements in listed insieds
    for a in ${insides[@]}; do
		# TODO propperly build tree here ;_; on DIRTREE[$a]=(insides) and after all print them nicelly!
        # THEN add check if element is on list and ignore if it truly is
        if [[ ! -d $a ]]; then echo ">>> ELEMENT: $a"; fi
		# special action when we meet tar or gz
        if is_tar $a; then
            echo Sub-tar in: ${catl##*_}
            foo $a
        fi
		# special action when we meet folder in listing
        if [[ -d $a ]]; then
            echo ">>> FOLDER: $a"
			foo $a
        fi
    done
    cd ../
}

# If tar is in some location, or not it needs to act differently
if is_tar $1; then 
     if [[ "$1" =~ \/ ]]; then 
         pushd ${1%/*}
         foo ${1##*/}
         popd
     else 
         foo $1
     fi
 else
    echo "Script accepts tar files in format:"
    echo "   $ rectar <yourname>.t[ar|gz]"
    echo "   $ rectar <path><yourname>.t[ar|gz]"
    echo "After usage cleanup: "
    echo "   $ find -name 'TMP_*' | xargs -I{} rm -fdr {} "
fi
