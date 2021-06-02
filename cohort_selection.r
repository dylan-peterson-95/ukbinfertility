## load (and install if necessary) the ukbtools package
#install.packages("ukbtools")
library("ukbtools")

# read in the relatedness data
rel = read.table("ukb/gene_data/ukb_rel_a53354_s488239.dat", header=TRUE)

# read in the data table (subset)
df = read.csv("ukb/clinical_data/key_subset_r.csv", sep=",", header=TRUE, row.names=1)

# get the infertile ids (stored in field 132084.0.0)
infertile_ids = df[which(!is.na(df$f.132084.0.0)),"f.eid"]
print(length((infertile_ids))) #593 infertile males

# subset to men (reported and genetic)
male_df = df[which((df$f.31.0.0=="Male")&(df$f.22001.0.0=="Male")),] #223319 males

# subset to white men of british ancestry 
british_male_df = male_df[which((male_df$f.21000.0.0=="British")
                                &(male_df$f.22006.0.0=="Caucasian")),] #188041 males

# greedily obtain related people (<3rd degree relatives or less)
samples_to_remove = ukb_gen_samples_to_remove(rel,british_male_df$f.eid)
print(length(samples_to_remove)) # picked 6062 to remove

# subset to unrelateds
sub_df = british_male_df[which(!(british_male_df$f.eid %in% samples_to_remove)),] #181979 males

# merge back in the infertile males who were removed
total = rbind(sub_df, british_male_df[which((!is.na(british_male_df$f.132084.0.0))
                                      & (!(british_male_df$f.eid %in% sub_df$f.eid))),])

# figure out who the people are who are related to the infertile men
related_infertile = ukb_gen_related_with_data(rel, total$f.eid)

# plot to see the relatedness of these men
ukb_gen_rel_count(related_infertile,plot=TRUE)

# preferentially keep the inferile relative's id (remove other)
fertile_samples_to_remove = ifelse(related_infertile$ID1 %in% infertile_ids, 
                                     related_infertile$ID2, related_infertile$ID1)

# subset to our final cohort
sub_df = total[which(!(total$f.eid %in% fertile_samples_to_remove)),]

print(nrow(ukb_gen_related_with_data(rel,sub_df2$f.eid))) # shows 0 related samples remain 

# save the cohort
write.csv(sub_df,"ukb/clinical_data/subset_cohort.csv", row.names=FALSE)

# looking at the number of infertile men per division in the cohort
print(length(which(!is.na(df$f.132084.0.0)))) ## 593
print(length(which(!is.na(male_df$f.132084.0.0)))) ## 559
print(length(which(!is.na(british_male_df$f.132084.0.0)))) ## 456
print(length(which(!is.na(sub_df2$f.132084.0.0)))) ## 456

## briefly investiging infertility
sub_df_infert = sub_df2[(which(!is.na(sub_df2$f.132084.0.0))),]

# get the year they were diagnosed
sub_df_infert$infert_year = as.numeric(as.character(data.frame(do.call('rbind', 
                                                        strsplit(as.character(sub_df_infert$f.132084.0.0),
                                                                    '-',fixed=TRUE)))$X1))

# calculate their age of diagnosis based on their birth year
sub_df_infert$infert_age = sub_df_infert$infert_year - as.integer(sub_df_infert$f.34.0.0)

# plot these ages as a histogram
hist(sub_df_infert$infert_age, main ="Histogram of Age at Infertility Diagnosis",xlab="Age") 

# plot the number of children they've fathered
hist(sub_df_infert$f.2405.0.0,main="Histogram of Number of Children Fathered",xlab="Number of children")

# print the proportion of men who've fathered children
print(100*sum(sub_df_infert$f.2405.0.0!=0)/length(sub_df_infert))

### OLD CODE ###
#male_df = df[(([,"f.31.0.0"][,"f.31.0.0"]=="Male")&(df[,"f.22001.0.0"]=="Male")),] #228883 males
#british_male_df = male_df[((male_df[,"f.21000.0.0"]=="British")&(male_df[,"f.22006.0.0"]=="Caucasian")),] #203411 males

