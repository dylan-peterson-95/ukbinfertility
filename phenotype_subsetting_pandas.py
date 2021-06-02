import pandas as pd

cohort = list(pd.read_csv("clinical_data/cohort_ids.csv",header=None)[0].values)

df = pd.DataFrame()
for i,chunk in enumerate(pd.read_csv("clinical_data/ukb45951.tab",sep="\t",chunksize=1000,low_memory=False)):
    chunk = chunk.loc[chunk["f.eid"].isin(cohort)]
    df = df.append(chunk)
    print(df.shape[0]/len(cohort)*100,end="\r")

df.to_csv("clinical_data/cohort_full_phenotypes.csv",index=False)

cols = df.columns
    
cols = ["x"+x.split("f.")[1] for x in cols]
cols = [("_").join(x.split(".")) for x in cols]
cols = [x if x!="xeid" else "userId" for x in cols]
    
df.columns = cols
df.head()
    
df.to_csv("clinical_data/phenotypes_pandas_updated_colnames.csv",index=False)

cols = [x for x in df.columns if x.split("_")[-1]=="1"]

df = df[cols]
df.to_csv("clinical_data/cohort_first_instance_pandas_phenotypes.csv",index=False)