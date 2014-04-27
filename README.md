gcddp - Getting and Cleaning Data Project
=====
##Requirements
<p>
An Linux/UNIX/MacOSX environment with R installed and available in the command line is necessary.
</p>

##How to use it
1. Copy the **run_analysis.R** script inside the folder **UCI HAR Dataset** which contains the data
2. Grant it execution rights using the command **chmod +x run_analysis.R**
3. Execute the script with the command **./run_analysis.R**

##Methodology
<p>
The following sequence of actions was followed in order to get to the result:
</p>

* read the data from files
* merge train and test data
* select the proper features from the total features
* reduction of dataset to the previously determined features
* addition of subjects and activities columns to the full merged dataset
* computation of the means by activity and by subject
* the result is written to the file RESULT.txt


##A successful script execution

<p>./run_analysis.R<br/> 
[1] "Loading features.txt, activity_labels.txt ..."<br/>
[1] "Loading train data ..."<br/>
[1] "Loading test data ..."<br/>
[1] "Create full data set as train and test datasets merged ..."<br/>
[1] "Create full Subjects."<br/>
[1] "Create full Activities Labels."<br/>
[1] "Selecting only the mean and std related features ..."<br/>
[1] "Reducing the full dataset to only the demaded columns ..."<br/>
[1] "Adding Activities and Subjects to the full data set ..."<br/>
[1] "Computing the result ..."<br/>
[1] "Result size:"<br/>
[1] 180  68<br/>
[1] "Writing RESULT.txt file ..."<br/>
[1] "... Done!"<br/>
</p>
