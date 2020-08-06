library(dplyr)
#### Setting up the data ####

# This section of the code will create a data frame that describes
# each trial in the experiment. The data frame will have two columns:
#
# stimulus - The ordinal value of the stimulus on the current trial
# last.stimulus - The ordinal value of the stimulus on the last trial
#
# The order of trials is generated in a way that avoids repeats of the
# same stimulus on neighboring trials.

# Parameters to control trial generation
n.trials <- 2000 # How many trials for each stimulus?
n.stimuli <- 9 # How many different stimuli?

# Create a random order of trials, with no neighboring repeats.
trials <- sample(1:n.stimuli)
for(i in 2:n.trials){
  next.order <- sample(1:n.stimuli)
  while(next.order[1] == trials[length(trials)]){
    next.order <- sample(1:n.stimuli)
  }
  trials <- c(trials, next.order)
}

# Create the array that describes the value of the last trial
# Use NA for the first trial, to represent no previous information.
last.trial <- c(NA, trials[1:(length(trials)-1)])

# Create the data frame
trial.data <- data.frame(stimulus=trials, last.stimulus=last.trial)

#### Model of responses ####

# Your work starts here. Implement the model described in the readme
# file. You should add a new column to trial.data that indicates whether the
# model guessed correctly (TRUE) or incorrectly (FALSE).

# You may want to start by adding a column to indicate what stimulus the model
# guessed. Then you can create a fourth column to indicate whether the guess
# was correct.

# Don't forget about the better.sample function that you wrote in the tutorial file!


#implement the model using 3 conditions: no last case (random between 1-9), if > last and < last)
model <- function(stim,last){
  if(is.na(last)){
    return(better.sample(1:9,1))
  }else if (stim >= last){
    return(better.sample(last:9,1))
} else {
 return(better.sample(1:last,1))}}

trial.data$guess <- mapply(model, trial.data$stimulus, trial.data$last.stimulus)

compare <- function(stim, guess){
  if(stim == guess){ return(TRUE)}
  else{return(FALSE)}
}
  
trial.data$correct <- mapply(compare, trial.data$stimulus, trial.data$guess)


#### Aggregate the data ####

# Now that you have a model that can generate a response for every trial, you need
# to group the data and find the proportion of trials that the model answered correctly
# for each value of the stimulus column. Then you can compare the data your model generated
# to the data generated in the Neath and Brown experiment.

# This is where you will need to use the dplyr summarize function. Generate a new data frame
# that has the proportion of correct responses for each value of stimulus. (Note that the proportion
# correct is equivalent to taking the mean of the correct column if you code incorrect responses as 0
# and correct responses as 1).

bool.conv <- function(bool){
  if(bool){ return(1)
  } else return(0)
}

trial.data$cor.num <- mapply(bool.conv, trial.data$correct)

sum.trial <- trial.data %>%
  group_by(stimulus) %>%
  summarise(mean(cor.num))


#### Plot the results ####x

# Plot the curve with stimulus on the X axis and proportion of correct
# responses on the Y axis.

plot(sum.trial$stimulus, sum.trial$'mean(cor.num)', type = "l")

# Remeber that you can extract a column of data with the $ operator, so something like:
# plot(data$stimulus, data$proportion.correct) should get you close to where you want to be.


#### Short answer questions (reply using a comment below each number)

# 1. Why does the model's output change slightly each time you run it?
# The numbers change because they are randomly generated and 
# the model works better for edge cases, but the # of edge cases varies from trial to trial

# 2. Try increasing and decreasing the number of trials per stimulus. How does
#    this affect the stability of the model's predictions from run to run?
#    Explain why this happens.
# A larger sample size (ex. 2000) has less variation between runs because the sample
# size is bigger so there are many instances of each case which creates a better
# "informed" model since there are more datapoints

# 3. Explain why the stimuli at the ends have a higher proportion correct than
#    those in the middle under this model.
# it is more likely to guess correctly using this model when their are less options
# if you know the previous was 2 and the current is lower, 1 is the only option
# so it is easier to be correct with this model on edges than in the middle (ex. 5)

# 4. Compare the model's accuracy to the data from Neath and Brown (2005). What
#    is the major difference? What does this suggest about the guessing model?
# http://cvcl.mit.edu/SUNSeminar/Chater_TemporalModelMemory_PR07.pdf

# The overall accuracy is much higher in the real experiment. This suggests that
# absolute guessing isn't the whole story. Some other addition is needed to get the
# overall accuracy up. One possibility would be to not randomly guess with equal
# probability. Maybe people can detect small vs. large relative changes.
