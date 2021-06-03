#!/usr/bin/bash
#SBATCH --time=02:00:00
#SBATCH --mem=80G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --output=phenotypesubsetting.log
#SBATCH --mail-type=ALL
#SBATCH --job-name=phenotype_subsetting


# load python and run the script
ml python/3.6.1
python3 ../convert_all_phenotypes.py
