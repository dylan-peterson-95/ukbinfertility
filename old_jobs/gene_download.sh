#!/bin/sh

#
# Loop through chromosomes
#
for CHR in {1..26}
do
  ./gfetch 22418 -c$CHR -a.ukbkey
done
