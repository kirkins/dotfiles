#!/bin/bash

# Checks which programs are being installed and generates a list of program descriptions from man pages
# Philip Kirkbride <kirkins@gmail.com>

# get list of packages to be installed
sed -e '/\$packages/,/]/!d; /]/q' .puppet/manifests/init.pp |
# remove first and last lines
sed '1d' | sed '$ d' |
# sort rows alphabetically
sort |
# extract programs into array
cut -d \' -f2 |
# get program description for each
xargs man -f | grep \(1\) | sed 's/(1)//g' |
# log output for debugging
xargs -i echo '* {}' > sorted_programs.log

# get all to do references
grep -r "TODO" . |
# remove all vundle tasks, references in .git, and the above query
sed '/vundle/I,+1 d' | sed '/.git/,+1 d' | sed '/grep -r \"TODO\"/,+1 d' |
# output all 
xargs -i echo '* {}' > task_list.log

# TODO instead of manually looking for vundle should iterate through .gitmodules file and remove said results.
# TODO no description for python-pip
# TODO dump output into README
