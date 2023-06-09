#!/bin/bash

# args=("$@")
# echo $# arguments passed
# echo ${args[0]} ${args[1]} ${args[2]}
dir="$(dirname "$0")"
echo  ${dir}
cd /tmp && vcpkg install --overlay-ports=${dir} ez