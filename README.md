# Male Factor Infertility and Adverse Outcomes in the UK Biobank
## Dylan Peterson, Erika Malaspina, and Foster Birnbaum
### BMI 212 Spring 2021 Final Project

Welcome to the github page for our project seeking to identify and characterize the health implications 
of AZF microdeletions in the UK Biobank to better understand the health impacts of Male Factor Infertility!

NOTE: Unfortunately due to concerns about datasharing and encryption, we are not able to upload the necessary datasets to run the following code.
We will work on generating simulated data from which one could run these files. 

### Contents:

| File                                    | Function                    | Author           | Run Order |
|-----------------------------------------|-----------------------------|----------------|-------|
| bash_scripts/ | Slurm jobs to run code and preprocess UKBB data | Dylan Peterson | 0 |
| decode_update_ukb.r | Decodes UKB file format to human readable file with updated column names and fields | Dylan Peterson | 1 | 
| cohort_selection.r | Selects cohort based on relatedness and fertility status | Dylan Peterson | Aim 1 - Middle |
| cohort_comparison.ipynb | Compares infertile and fertile men's clinical health parameters | Dylan Peterson | Aim 1 - Second to Last |
| generate_sim_phewas.ipynb | Generates simulated pheWAS data to be used in Aim 2  | Dylan Peterson | Aim 1 - Last |
| snps_of_interest.ipynb | Identifies SNPs to use in pheWAS instead of AZF microdeletions  | Dylan Peterson  | 1.000 |
| phenotype_subsetting_pandas.py  | Attempt 1 to generate a full phenotype subset using Pandas | Dylan Peterson | Aim 1 - Last |
| phenotype_subsetting.ipynb | Attempt 2 to generate a full phenotype subset using DASK | Dylan Peterson | Aim 1 - Last |
| subset_phenotypes.py                                 | 0.1378   | Dylan Peterson  | 1.000 |
| run-pheWAS.ipynb                                 | Formats input files and run pheWAS   | Foster Birnbaum | 10 |
| process-results.ipynb                                 | Processes pheWAS results   | Foster Birnbaum | 11 |
| causality_analysis_simulated_data.ipynb | Simulates data and runs gene-by-environment analyses | Erika Malaspina | Aim 3 - First |

