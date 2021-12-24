# zwiftactivities

## To Install 
##### devtools::install_github("johne3112/zwiftactivities")

## To get a dataframe of your last N Zwift activities 
##### df <- get_zwift_activities(zwift username,zwift password,N)
  
## To download the FIT file for a Zwift activity
##### download_zwift(zwift username,zwift password,activityID,filename)

ActivityID is the first column in the dataframe from get_zwift_activities

filename should be the full path and filename ending in .fit
