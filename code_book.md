# Code Book

This code book describes the tidy data set named `tidy_data.csv`. The original data was grouped into two sets: training and testing. `run_analysis.R` combines the two data sets, adds the activity labels and variable names to the combined data sets and tidys them according to the tidy data principles.

The variables are as follows:

`activity_type`: Indicates one of six activities the subjects performed while having their movements recorded. The possible values for this variable are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

`subject_id`: Indicates which of the subjects was performing the activity. The study included 30 volunteers within an age bracket of 19-48 years.

`variable`: Sensors within the smartphone recorded several different measurements collected while the subjects did the activities. Values in this column are comprised of all measures of the mean and standard deviation of these measurements. Measurements are sampled at 50hz and are normalized and bounded within [-1,1].

`value`: Values in this column represent the mean of each variable grouped by `activity_type` and `subject`.