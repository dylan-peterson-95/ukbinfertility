#!/usr/bin/bash
#SBATCH --time=48:00:00
#SBATCH --mem=80G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --output=phenotypesubsetting_pandas.log
#SBATCH --mail-type=ALL
#SBATCH --job-name=phenotype_subsetting_pandas


# load python and run the script
ml python/3.6.1
python3 ../phenotype_subsetting_pandas.py
