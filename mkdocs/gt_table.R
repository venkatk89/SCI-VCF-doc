library(dplyr)
library(gt)

feature_df <- data.frame("Features" = character(), 
                            "SCI-VCF" = character(), 
                            "VIVA" = character(),
                            "vcflib" = character(),
                            "vcfR" = character(),
                            stringsAsFactors = FALSE)

colnames(feature_df) <- c("Features","SCI-VCF","VIVA","vcflib","vcfR")
feature_df[1,] <- c("Language","R","Julia","C++","R")
feature_df[2,] <- c("Environment (OS)","Windows, Mac, Linux","Windows, Mac, Linux","Windows, Mac, Linux","Windows, Mac, Linux")
feature_df[3,] <- c("Graphical User Interface","Yes","No","No","No")
feature_df[4,] <- c("Online version","Yes","No","No","No")
feature_df[5,] <- c("Variant level summary","Yes","No","Yes","Yes*")
feature_df[6,] <- c("Sample level summary","No","Yes","Yes","Yes*")
feature_df[7,] <- c("Variant level comparison","Yes","No","Yes","Yes*")
feature_df[8,] <- c("Unique/intersection set summary","Yes","No","Yes*","Yes*")
feature_df[9,] <- c("Interactive plots","Yes","Yes","No","Yes*")
feature_df[10,] <- c("Visualize Genomic regions","Yes","Yes","No","Yes*")
feature_df[11,] <- c("Publication quality graphics","Yes","Yes","Yes","Yes*")
feature_df[12,] <- c("Export results as tabular data","Yes","Yes","Yes*","Yes*")

feature_table <- gt(feature_df, rowname_col = "Features") %>%
  rm_header() %>%
  tab_stubhead(label = "Features") %>%
  tab_row_group(label = "Output", rows = 11:12) %>%
  tab_row_group(label = "Visualize", rows = 9:10) %>%
  tab_row_group(label = "Compare", rows = 7:8) %>%
  tab_row_group(label = "Summarize", rows = 5:6) %>%
  tab_row_group(label = "Technical", rows = 1:4) %>%  
  tab_footnote("* Multi-step process involving other tools/libraries") %>%
  opt_table_outline() %>%
  opt_stylize(style = 5, color = "cyan")

