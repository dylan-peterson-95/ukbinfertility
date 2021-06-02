#!/bin/bash
#SBATCH --job-name=convert_ukb_csv_subset
#SBATCH --mem=16G
#SBATCH --cores=4
#SBATCH --time=480:00

# Converts the encrypted full dataset into a tab delimited file with an r script to update field names and contents 
# (e.g. gender goes from 0/1 to M/F)
$GROUP_HOME/ukb/ukbconv /home/groups/meisenb/ukb/ukb45951.enc_ukb r -ifields_subset.txt -okey_subset
touch $GROUP_HOME/ukb/finished_subset.txt
