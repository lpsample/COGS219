# part 1 ####
library(dplyr)

# suppose there are 30 students in a class. estimate the probability that at least one pair
# students has the same birthday.
# you can ignore the possibility of people being born on Feb 29 during a leap-year.


#This isn't working and I realized just now isn't using the correct method. So sorry I am very confused

birthday<-matrix(sample(1:365, 30, replace=T), ncol=1)

#formula from: https://medium.com/i-math/the-birthday-problem-307f31a9ac6f

# n is number of students
bday.prob<- function(n){
  return (1-(factorial(365)/(factorial(365-n)*365^n)))
}




bday.prob(30)


#using Josh's code:

new.class <- function(class){
  # since there are 365 days in a year, we can use the integers 1:365 to represent
  # birthdays
  birthdays <- sample(1:365, class, replace=T)
  
  # now we need to check if any two values in the birthdays array are the same.
  # there are many ways to do this. we could do it with a for loop:
  for(day in birthdays){
    number.of.matches <- sum(day == birthdays)
    if(number.of.matches > 1){
      return(TRUE)
    }
  }
  
  # if we go through the whole for loop and never return TRUE it means there are no matches
  # so we can return FALSE at this point in the code.
  return(FALSE)
}

# to estimate the probability for a class of size 30, we need to run the function many times
results <- replicate(10000, new.class(30))

#my own approach :) mean instead of sum/ length
mean(results)

# part 2 ####

# estimate the probability for class sizes from 5-60, and plot the resulting curve 
# (x axis is class size, y axis is probability of at least one shared birthday)


trials <- sample(5:60)
trials$data <- mapply(bday.prob, trials)


plot(trials, trials$data)

#with help...

#array to hold class size
class.size <- 5:60

# now we need to run a function for each element of this array. there are lots of 
# ways to do this.

# am stuck on this part, can't get it working

prob <- sapply(class.size, replicate(10000, new.class(100)))

mean<- mean(res)



probabilities <- sapply(class, function(s){
  res <- replicate(10000, new.class(s))
  return(mean(res))
})

# make the plot!

plot(class, prob, type="o")


