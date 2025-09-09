#Lecture 10: Joining Data in R
#Date: 09/09/2025

#primary key
#uniquely identifies each subject in the outcomes table

#foreign key
#matches each subject to a unique id in a second table

#mutating joins
left_join() #Includes all observations in the left data frame, whether or not there is a match in the right data frame
left_join(outcomes, subjects, by = c("id", "visit"))

right_join() #Includes all observations in the right data frame, whether or not there is a match in the left data frame
right_join(x = outcomes, y = subjects, by = c("id", "visit"))

inner_join() #Includes only observations that are in both data frames
inner_join(x = outcomes, y = subjects, by = c("id", "visit"))

full_join() #Includes all observations from both data frames
