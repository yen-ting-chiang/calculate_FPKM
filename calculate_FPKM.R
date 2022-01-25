library(dplyr)
setwd("C:/Users/dannyj/Documents/Rproject/calculate_FPKM/RNAseq 01242022")
getwd()

# Get file list
filenames <- list.files("C:/Users/dannyj/Documents/Rproject/calculate_FPKM/RNAseq 01242022", 
                        pattern="*_Counts_", 
                        full.names=TRUE)

# Read all csv files in the folder and create a list of dataframes
ldf <- lapply(filenames , fread)

# Combine each dataframe in the list into a single dataframe
df.final <- do.call("cbind", ldf)
df.final <- distinct(df.final)
colnames(df.final)[1] <- "GENEID"
df.final <- df.final %>% 
  select(!Geneid)

write.csv(df.final, file = "combine_data.csv")

  