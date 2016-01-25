# Andrew Fairless, February 2010
# modified April 2015 for posting onto Github
# This R script calculates the intraclass correlation coefficient (icc)
# The script can be run by copying and pasting the commands at the R command prompt
# This script contributed to the Fairless et al 2011 paper
# Fairless et al 2011, doi: 10.1002/ar.21318, PMID: 21905241, PMCID: PMC3176979

install.packages("irr", dependencies = TRUE) # Install package if not already installed
library(irr)		                         # Library includes intraclass correlation coefficient (icc) functions

# The fictional data in "altereddata.txt" were modified from the original 
# empirical data used in Fairless et al 2011.
# I am using fictional data instead of the original data because I do not have 
# permission of my co-authors to release the data into the public domain.  
# Each row is a separate mouse/scoring period
# Each column is a different method or rater for scoring social sniffing time by the mouse
data = read.table("altereddata.txt", header = TRUE)    

# Runs loop to correlate each method/rater for scoring social sniffing time to the
# rigorously, precisely measured "gold standard" for scoring social sniffing time 
# (i.e., correlates the first column, which contains the "gold standard", to each subsequent column)
for(i in 1:dim(data)[2])		     
{						
     cat("\n\n")						
     print(colnames(data[1]))						
     print(colnames(data[i]))
     # Correlates for "consistency" (see Shrout & Fleiss, 1979 and McGraw & Wong, 1996, or R documentation for "icc" in package "irr")
     print(icc(cbind(data[,1],data[,i]),model='t',type='c',unit='s')[[7]][1])	
     # Correlates for "agreement" (see Shrout & Fleiss, 1979 and McGraw & Wong, 1996, or R documentation for "icc" in package "irr")
     print(icc(cbind(data[,1],data[,i]),model='t',type='a',unit='s')[[7]][1])	
}						