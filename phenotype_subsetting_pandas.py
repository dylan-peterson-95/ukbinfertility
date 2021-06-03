import pandas as pd

# pull in the cohort
cohort = list(pd.read_csv("clinical_data/cohort_ids.csv",header=None)[0].values)

# create an empty dataframe
df = pd.DataFrame()
# loop through chunks of 1000 participants, reading in their data
for i,chunk in enumerate(pd.read_csv("clinical_data/ukb45951.tab",sep="\t",chunksize=1000,low_memory=False)):
    # add those in the cohort to the dataframe and print our status
    chunk = chunk.loc[chunk["f.eid"].isin(cohort)]
    df = df.append(chunk)
    print(df.shape[0]/len(cohort)*100,end="\r")

# save as a csv
df.to_csv("clinical_data/cohort_full_phenotypes.csv",index=False)

# update the column names for the phewas
cols = df.columns
cols = ["x"+x.split("f.")[1] for x in cols]
cols = [("_").join(x.split(".")) for x in cols]
cols = [x if x!="xeid" else "userId" for x in cols]
df.columns = cols

# save this as a csv
df.to_csv("clinical_data/phenotypes_pandas_updated_colnames.csv",index=False)

# subset to first instances (e.g. BMI at intake) for array-type data and save this as a csv 
cols = [x for x in df.columns if x.split("_")[-1]=="1"]
df = df[cols]
df.to_csv("clinical_data/cohort_first_instance_pandas_phenotypes.csv",index=False)