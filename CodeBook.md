# Cleaning and Getting Data Code Book
## Analysis Process
###
The analysis script in 'run_analysis.R' reads in the processed experiment data and perorms a number of steps to get it into summary form.
-The test and training data sets are read and merged into one data frame.
-The data columns are then given names based on the features-txt file
-Columns that have mean or standard deviations are selected, while the others are excluded
-The activity indentifiers are replaced with the activity labels based on the activity_labels.txt
-Invalid characters are removed from column names
-The data is grouped by subject and activity, and the mean is calculated for every measurement column
- The summary data is written to a file 'run_data_summary.txt'

### Columns in output file
- subject_id: the id of the experiment participant
- activity_labels: the name of the activity that the measurement corresponds to. 
