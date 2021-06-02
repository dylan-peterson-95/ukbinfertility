library("ukbtools")

ukb_df <- ukb_df("ukb45951")
write.csv(ukb_df,"clinical_data/ukb_df_r.csv")