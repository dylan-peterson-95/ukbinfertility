#!/bin/bash
#SBATCH --job-name=add_ethnicity
#SBATCH --mem=16G
#SBATCH --time=240:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --output=add_ethnicity.log

# Example code to pull one phenotype field and convert it to a CSV
# load modules
./ukbconv ukb45951.enc_ukb csv -s21000 -oEthnicity
