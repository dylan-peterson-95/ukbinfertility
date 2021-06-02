#!/bin/bash
#SBATCH --job-name=get_22418
#SBATCH --mem=16G
#SBATCH --time=30:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --output=get_22418.log

## Example code to pull all SNP data (category 22418) for all chromosomes 
# load modules
for CHR in {1..26}
do
  ./gfetch 22418 -c$CHR -a.ukbkey
done
