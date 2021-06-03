# Male Factor Infertility and Adverse Outcomes in the UK Biobank
## Dylan Peterson, Erika Malaspina, and Foster Birnbaum
### BMI 212 Spring 2021 Final Project

Welcome to the github page for our project seeking to identify and characterize the health implications 
of AZF microdeletions in the UK Biobank to better understand the health impacts of Male Factor Infertility!

NOTE: Unfortunately due to concerns about datasharing and encryption, we are not able to upload the necessary datasets to run the following code.
We will work on generating simulated data from which one could run these files. 

### Contents:

| File                                    | Function                    | Author           | Run Order |
|-----------------------------------------|-----------------------------|------------------|----|
| bash_scripts/ | Slurm jobs to run code and preprocess UKBB data | Dylan Peterson | 0 |
| decode_update_ukb.r | Decodes UKB file format to human readable file with updated column names and fields | Dylan Peterson | 1 | 
| cohort_selection.r | Selects cohort based on relatedness and fertility status | Dylan Peterson | 2 |
| cohort_comparison.ipynb | Compares infertile and fertile men's clinical health parameters | Dylan Peterson | 3 |
| generate_sim_phewas.ipynb | Generates simulated pheWAS data to be used in Aim 2  | Dylan Peterson | 4 |
| snps_of_interest.ipynb | Identifies SNPs to use in pheWAS instead of AZF microdeletions  | Dylan Peterson  | 5 |
| convert_all_phenotypes_pandas.py  | Attempt 1 to generate a full phenotype set using Pandas | Dylan Peterson | 6 |
| convert_all_phenotypes.ipynb | Attempt 2 to generate a full phenotype set using DASK | Dylan Peterson | 7 |
| run-pheWAS.ipynb | Formats input files and run pheWAS | Foster Birnbaum | 8 |
| process-results.ipynb | Processes pheWAS results | Foster Birnbaum | 9 |
| causality_analysis_simulated_data.ipynb | Simulates data and runs gene-by-environment analyses | Erika Malaspina | 10 |
