install.packages("ukbtools")
library("ukbtools")

# read in the relatedness data
rel = read.csv("~/Downloads/ukb_rel_a53354_s488239.dat",header=TRUE)

# read in the data table and find the infertile men (wish to maximize these)
df = read.csv("~/Downloads/ukb45951.csv", sep=",",header=TRUE)

# get the infertile ids (stored in field 132084.0.0)
infertile_ids = df[(!df[,"X132084.0.0"]==""),"eid"]

# subset to men (reported and genetic)
male_df = df[((df[,"X31.0.0"]==1)&(df[,"X22001.0.0"]==1)),]
male_ids = male_df$eid

## RUNNING SUBSET HERE PRODUCES 7128 IDS TO REMOVE (221987 IDS TOTAL TO KEEP - WITHOUT SUBSETTING TO WHITE BRITS)
### WE ONLY LOSE 1 MAN WHO IS INFERTILE 

# subset to white men of british ancestry
british_male_df = male_df[((male_df[,"X21000.0.0"]==1001)),]

# greedily obtain related people (<3rd degree relatives or less)
samples_to_remove = ukb_gen_samples_to_remove(rel,male_ids)
length(samples_to_remove)

sub_df = male_df[!(male_df[,"eid"] %in% samples_to_remove),]

sub_df_infert = sub_df[(!sub_df[,"X132084.0.0"]==""),]

sub_df_infert$infert_year <- as.integer(data.frame(do.call('rbind', strsplit(as.character(sub_df$X132084.0.0),'-',fixed=TRUE)))$X1)

sub_df_infert$infert_age <- sub_df_infert$infert_year - sub_df_infert$X34.0.0

hist(sub_df_infert$infert_age,main="Histogram of Age at Infertility Diagnosis",xlab="Age") 

hist(sub_df_infert$X2405.0.0,breaks=9,xlim=c(-1,6),main="Histogram of Number of Children Fathered",xlab="Number of children")
sum(as.integer(sub_df_infert$X2405.0.0==0),na.rm = T)

for (id in infertile_ids) {
  if is.element(id,samples_to_remove){
    print(id)
  }
}
