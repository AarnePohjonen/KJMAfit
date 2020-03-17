# KJMAfit
KJMA equation fit to COVID-19 data
This script was used to fit the COVID data of mainland china using KJMA model. The article reporting the results has been submitted to
"Journal of Theoretical Biology"

To use the script, copy all the files in one directory, go to that directory and within matlab, run analyzeall2
This will analyze all datasets in file "mainlandchinadatafilteredjustinfect.txt"
If you wish to run just one dataset (one line in the file), change the matlab script i=1:29 to i=s:s, where s is the 
line number of the data you wish to analyze (for example i=3:3 would analyze the data on line 3).
