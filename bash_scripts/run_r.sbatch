#!/usr/bin/bash
#SBATCH --time=06:00:00
#SBATCH --mem=240G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --output=R-test.log
#SBATCH --mail-type=ALL
#SBATCH --job-name=run_r


# load R and run the script
ml R

Rscript ../decode_update_ukb.r
touch rsbatch_worked.txt


## Example to run R code
#R
#set.seed (1)
#m <- 4000
##n <- 4000
#A <- matrix (runif (m*n),m,n)
#system.time (B <- crossprod(A))
#EOF
