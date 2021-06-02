#!/bin/bash
#SBATCH --job-name=convert_ukb_csv_subset
#SBATCH --mem=16G
#SBATCH --cores=4
#SBATCH --time=480:00

$GROUP_HOME/ukb/ukbconv /home/groups/meisenb/ukb/ukb45951.enc_ukb r -ifields_subset.txt -okey_subset
touch $GROUP_HOME/ukb/finished_subset.txt