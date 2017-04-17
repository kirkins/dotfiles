#
# Script that checks which programs are being installed and generates
# a list of program descriptions from man pages
#
# By: Philip Kirkbride <kirkins@gmail.com>
#
# TODO no description for python-pip
# TODO dump output into README

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
