##### | When you are at the R prompt (>):
#| -- Typing skip() allows you to skip the current question.
#| -- Typing play() lets you experiment with R on your own; swirl will ignore what you do...
#| -- UNTIL you type nxt() which will regain swirl's attention.
#| -- Typing bye() causes swirl to exit. Your progress will be saved.
#| -- Typing main() returns you to swirl's main menu.
#| -- Typing info() displays these options again.


######  1: Basic Building Blocks

######create a sequence of numbers(1 to 20):
x <- 1:20
x
##### create a vector - c() which stans for 'concatanate' or 'combine': 
z <- c(1.1, 9, 3.14)
z
##### combine vectors to make a new vector 
v <- c(z, 555, z)
v
### adding vectors of different sizes 
> c(1, 2, 3, 4) + c(0, 10)
[1]  1 12  3 14

###### 2: Workspace and Files 

###  Determine which directory your R session is using as its current working directory using getwd().
###  List all the objects in your local workspace using ls().
###  Type list.files() to all the files in your working directory.
###  Type list.files(recursive = TRUE) to list all the files in your working directory recursively.
###  Using the args() function on a function name is also a handy way to see what arguments a function can take
###  Type dir.create("testdir") to create a directory in the current working directory called "testdir".
###  Set your working directory to "testdir".     -> setwd("testdir")
###  Create a file in your working directory called "mytest.R"  -> file.create("mytest.R")
###  Use file.exists("mytest.R") to check that a file exists.
###  what command, along with the appropriate argument, will return information about the file "mytest.R"?
  # file.info("mytest.R") will do the trick!
### | Change the name of the file "mytest.R" to "mytest2.R". --> file.rename("mytest.R", "mytest2.R")
### Make a copy of "mytest2.R" called "mytest3.R". --> file.copy("mytest2.R", "mytest3.R")
### Provide the full path to the file "mytest3.R". --> file.path("mytest3.R") 
### Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3",
  # all in one command.
### Delete the "testdir2" directory that you created. --> unlink("testdir2", recursive = TRUE)
  # > dir.create("testdir2", "testdir3")
### Delete the "testdir" directory that you just left (and everything in it) --> unlink("testdir", recursive= TRUE)

##### 3: Sequences of Numbers 

 seq(1,20)                  #this gives us the same output as 1:20
 seq(0, 10, by=0.5)         #incremented by 0.5. 
 seq(5, 10,length=30)       #sequence of 30 numbers between 5 and 10
 rep(0, times = 40)         #creating a vector that contains 40 zeros
 seq_along(my_seq)          #a new vector (1, 2, 3, ...) that is the same  length as my_seq
 rep(c(0,1,2), times = 10)  #vector that  contains 10 repetitions of the vector (0, 1, 2)
 rep(c(0,1,2), each = 10)   #vector that contains 10 zeros, then 10 ones, then 10 twos


###### 4: Vectors

 num_vect <- c(0.5, 55, -10, 6)    #create a numeric vector num_vect that contains the values 0.5, 55, -10, and 6.
   tf <- num_vect < 1              # Now, create a variable called tf that gets the result of num_vect < 1, which is read as  'num_vect is less than 1'
 my_char <- c("My", "name", "is")  #create a character vector that contains the following words: "My", "name", "is"
 paste(my_char, collapse = " ")    #let's say we want to join the elements of my_char together into one continuous character string
 c(my_char, "Ivana")               #To add (or 'concatenate') your name to the end of my_char
 paste (c(1:3), c("X", "Y", "Z"), sep = "")
paste(LETTERS, 1:4, sep = "-")     # Try paste(LETTERS, 1:4, sep = "-"), where LETTERS is a predefined variable in R containing
                                   #a character vector of all 26 letters in the English alphabet.



###### 5: Missing Values 

x <- c(44, NA, 5, NA)
x *3                   # [1] 132  NA  15  NA
y <- rnorm(1000)       # create a vector containing 1000 draws from a standard normal distribution
z <- rep(NA, 1000)     # create a vector containing 1000 NAs
my_data <- sample(c(y, z), 100) # select 100 elements at random combining y and z
my_na <- is.na(my_data)         # where our NAs are located in our data?
sum(my_na)             # to count the total number of TRUEs in my_na
0/0                    # [1] NaN  Not a Number



##### 6: Subsetting Vectors 

# The way you tell R that you want to select some particular elements (i.e. a 'subset') 
#from a vector is by placing  an 'index vector' in square brackets immediately following the name of the vector

y[1:10]           #to view the first ten elements of y
y<- x[!is.na(x)]  #creates a vector called y that contains all of the non-NA values from x
                  # isolated the non-missing values of x and put them in y
y[y>0]            # to islolate all the positive elements of y
x[!is.na(x) & x > 0] ## doing the same in one step
x[c(3, 5, 7)]      # subset the 3rd, 5th, and 7th elements of x?
x[c(-2, -10)]   or x[-c(2, 10)]    #all elements of x EXCEPT the 2nd and 10th

vect <- c(foo = 11, bar = 2, norf = NA)  #Create a numeric vector with three named elements using vect
> vect             #result


foo  bar norf 
11    2   NA 
names(vect)       # [1] "foo"  "bar"  "norf"

vect2 <- c(11, 2, NA)   #create an unnamed vector vect2 with c(11, 2, NA)
names(vect2) <- c("foo", "bar", "norf")  # add the `names` attribute to vect2 after the fact 

identical (vect, vect2)   #heck that vect and vect2 are the same





##### 7: Matrices and Data Frames 
my_vector <- 1:20 #create a vector containing the numbers 1 through 20 using the `:` operator
                   # remember that you don't need the c() function when using `:`

dim(my_vector)     # dimensions of the vector
length(my_vector)  # ength of the vector
dim(my_vector) <- c(4, 5) # the first number is the number of rows and the second is the number of columns
dim(my_vector)     # [1] 4 5
attributes(my_vector) # Another way to see this is by calling the attributes()
## now we have 4by5 matrix 
class(my_vector)  # to confirm it's actually a matrix by using the class() function
##A more direct method of creating the same matrix uses the matrix() function.
my_matrix2 <- matrix( 1:20, nrow=4, ncol=5) #create a matrix containing the same numbers (1-20) and dimensions (4 rows, 5 columns) 
 #  add a column to the matrix, which contains the names of all four people.
patients <- c("Bill", "Gina", "Kelly", "Sean") #1. creating a character vector 
cbind(patients, my_matrix)                     #2. 'combine columns'.
 # how to include the names of our patients in the table without destroying the integrity of our numeric data
my_data <- data.frame(patients, my_matrix)
# It looks like the data.frame() function allowed us to store our character vector of names right alongside 
#our  matrix of numbers. That's exactly what we were hoping for!
#data.frame() function takes any number of arguments and returns a single object of 
#class data.frame` that is composed of the original objects.

##assigning names to the columns of our data frame:
cnames <- c("patient", "age", "weight", "bp", "rating", "test") # first create a vector containing one element for each column
colnames(my_data) <- cnames #use the colnames() function to set the `colnames` attribute for our data frame
> my_data                   #result:
patient age weight bp rating test
1    Bill   1      5  9     13   17
2    Gina   2      6 10     14   18
3   Kelly   3      7 11     15   19
4    Sean   4      8 12     16   20




#####  8: Logic 
#The equals operator `==` tests whether two boolean values or numbers are equal, the
# not equals operator `!=` tests whether two boolean values or numbers are unequal, and the NOT operator `!` negates
# logical expressions so that TRUE expressions become FALSE and FALSE expressions become TRUE.
isTRUE(6 > 4)
identical('twins', 'twins') 
xor(5 == 6, !FALSE)   #stands for exclusive OR. If one argument evaluates to TRUE and one argument evaluates
                      # to FALSE, then this function will return TRUE  otherwise it will return FALSE
ints <- sample(10)    # the vector `ints` is a random sampling of integers from 1 to 10 without replacement
ints > 5 #[1] FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
#The which() function takes a logical vector as an argument and returns the indices of the vector that are TRUE. For example which(c(TRUE, FALSE, TRUE))
#would return the vector c(1, 3)
which(ints > 7)   #[1]  2  7 10
#The any() function will return TRUE if one or more of the elements in the logical vector is TRUE. 
#The all() function will return TRUE if every element in the logical vector is TRUE.
any(ints <0)    #to see if any of the elements of ints are less than zero
all(ints > 0)    #to see if all of the elements of ints are greater than zero

#### 9 Functions :
boring_function <- function(x) {
    x
}
#| If you want to see the source code for any function, just type the function name without any arguments or
#parentheses. Let's try this out with the function you just created. Type: boring_function to view its source code.

#" To understand computations in R, two slogans are helpful: 1. Everything that exists is an object. 2.
# Everything that happens is a function call."

# You're free to implement the function my_mean however you want, as long as it
# returns the average of all of the numbers in `my_vector`.

my_mean <- function(my_vector) {
    # Write your code here!
    sum <- sum(my_vector)
    length<- length(my_vector)
    mean <- sum/length
    # Remember: the last expression evaluated will be returned!
}
# You're going to write a function called "remainder." remainder() will take
# two arguments: "num" and "divisor" where "num" is divided by "divisor" and
# the remainder is returned. Imagine that you usually want to know the remainder
# when you divide by 2, so set the default value of "divisor" to 2. Please be
# sure that "num" is the first argument and "divisor" is the second argument.

remainder <- function(num, divisor= 2) {
    # Write your code here!
    remeinder <- num %% divisor
    
    # Remember: the last expression evaluated will be returned!
}
# Finish the function definition below so that if a function is passed into the
# "func" argument and some data (like a vector) is passed into the dat argument
# the evaluate() function will return the result of dat being passed as an
# argument to func.
evaluate <- function(func, dat){
    # Write your code here!
    func(dat)
    # Remember: the last expression evaluated will be returned!
}
> evaluate( sd,c(1.4, 3.6, 7.9, 8.8))
[1] 3.514138

# Telegrams used to be peppered with the words START and STOP in order to
# demarcate the beginning and end of sentences. Write a function below called
# telegram that formats sentences for telegrams.
# For example the expression `telegram("Good", "morning")` should evaluate to:
# "START Good morning STOP"

telegram <- function(...){
    paste("START",..., "STOP")
    
    
}

# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
    # Do your argument unpacking here!
    args <- list(...)
    place <- args[["place"]]
    adjective  <- args[["adjective"]]
    noun <- args[["noun"]]
    
    # Don't modify any code below this comment.
    # Notice the variables you'll need to create in order for the code below to
    # be functional!
    paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}

# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

"%p%" <- function(first, second){ # Remember to add arguments!
    paste (first, second)
    
}

#####  10: lapply and sapply  (also known as loop functions)

#Each of the *apply functions will SPLIT up some data into smaller pieces, APPLY a function to each piece,
# then COMBINE the results.

head (flags)  # to preview the first six lines of dataset
dim (flags)   # check out the dimensions of the dataset  
              # (This tells us that there are 194 rows, or observations, and 30 columns, or variables.)
class(flags)  # That just tells us that the entire dataset is stored as a 'data.frame'

# The lapply() function takes a list as input, applies a function to each element of the list, then returns a list of
# the same length as the original one. Since a data frame is really just a list of vectors (you can see this with
# as.list(flags)), we can use lapply() to apply the class() function to each column of the flags dataset.
cls_list <- lapply(flags, class)    # The 'l' in 'lapply' stands for 'list'. Type class(cls_list) to confirm that lapply() returned a list.

as a result we have :
> cls_list
$name
[1] "factor"

$landmass
[1] "integer"

$zone
[1] "integer"

$area
[1] "integer"

as.character(cls_list)   # cls_list can be simplified to a character vector
#| sapply() allows you to automate this process by calling lapply() behind the scenes, but then attempting to simplify 
#(hence the 's'in 'sapply') the result for you. Use sapply() the same way you used lapply() to get the class of each
#column of the flags dataset and store the result in cls_vect. If you need help, type ?sapply to bring up the documentation.
cls_vect <- sapply(flags, class)

sum(flags$orange)               # to see how much flags with orange color are in our dataset
flag_colors <- flags[, 11:17]   # extract the columns 11 to 17
lapply(flag_colors, sum)        # To get a list containing the sum of each column of flag_colors
                                #The first argument is the object over which we are looping (i.e. flag_colors) and
                                #the second argument is the name of the function we wish to apply to each column (i.e. sum)
sapply (flag_colors , sum)      #Each element of this list is of length one, so the result can be 
                                # simplified to a vector by calling sapply() instead of lapply()

unique()                        # returns a vector with all duplicate elements removed
unique_vals <- lapply(flags, unique) #We want to know the unique values for each variable in the flags dataset

lapply(unique_vals, function(elem) elem[2])  #will return a list containing the second item from each element of the unique_vals list

##### 11: vapply and tapply

vapply(flags, unique, numeric(1))  # says that you expect each element of the result to be a numeric vector of length 1
vapply(flags, class, character(1)) #'character(1)' argument tells R that we expect the class function to return a character vector of length 1
                                   # when applied to EACHcolumn of the flags dataset
table(flags$landmass)              #to see how many flags/countries fall into each group
table(flags$animate)               #to see how many flags contain an animate image

#| If you take the arithmetic mean of a bunch of 0s and 1s, you get the proportion of 1s. Use tapply(flags$animate,
#| flags$landmass, mean) to apply the mean function to the 'animate' variable separately for each of the six landmass
#| groups, thus giving us the proportion of flags containing an animate image WITHIN each landmass group.
tapply(flags$animate, flags$landmass, mean)

##### 12: Looking at Data

#| Whenever you're working with a new dataset, the first thing you should do is look at it!
## What is the format of thedata? 
## What are the dimensions? 
## What are the variable names? 
## How are the variables stored? 
## Are there missing data?
## Are there any flaws in the data?

ls()          # to list the variables in your workspace
class(plants) # checking the class of the plants variable --> ("data.frame")
dim(plants)   # to see exactly how many rows and columns we're dealing with --> (5166, 10)
nrow(plants)  # to see only the number of rows --> (5166)
ncol(plants)  # to see only the number of columns --> (10)
object.size(plants)  # how much space the dataset is occupying in memory
names(plants) # will return a character vector of column (i.e. variable) names
head(plants)  # allows you to preview the top of the dataset
head(plants, n=10)   # preview the first 10 rows of plants
tail(plants, n=15)   # preview the end of the dataset (last 15)
summary(plants)      # provides different output for each variable, depending on its class. 
                     ##For numeric data such as Precip_Min, summary() displays the minimum, 1st quartile, median, mean, 3rd quartile, and maximum. 
                     ##These values help us understand how the data are distributed.
                     ## For categorical variables (called 'factor' variables in R), summary() displays  
                     ##the number of times each value (or'level') occurs in the data
table(plants$Active_Growth_Period) #we can see how many times each value actually occurs in the data

#For categorical variables (called 'factor' variables in R), summary() displays the number of times each value
#  (or 'level') occurs in the data. For example, each value of Scientific_Name only appears once, since it is
#unique to a specific plant. In contrast, the summary for Duration (also a factor variable) tells us that our
# dataset contains 3031 Perennial plants, 682 Annual plants, etc.
str(plants)
#| The beauty of str() is that it combines many of the features of the other functions you've already seen, all
#in a concise and readable format. At the very top, it tells us that the class of plants is 'data.frame' and
# that it has 5166 observations and 10 variables. It then gives us the name and class of each variable, as well
# as a preview of its contents.

### 13: Simulation

sample ()            # to generate a random numbers
sample (1:6, 4, replace = TRUE)  #instructs R to randomly select four numbers between 1 and 6, WITH replacement.
                                 #Sampling with replacement simply means that each number is "replaced" after it is selected, so that the same number can show up more than once.
#| LETTERS is a predefined variable in R containing a vector of all 26 letters of the English alphabet. Take a
#| look at it now.

#| Now, suppose we want to simulate 100 flips of an unfair two-sided coin. This particular coin has a 0.3  probability of landing 'tails' and a 0.7 probability of landing 'heads'
flips <- sample(c(0, 1), 100, prob = c(0.3,0.7), replace = TRUE)

 ?rbinom
#| Each probability distribution in R has an r*** function (for "random"),a d*** function (for "density"), a p*** (for "probability"), and q*** (for "quantile").

my_pois <- replicate(100, rpois(5, 10)) # Now use replicate(100, rpois(5, 10)) to perform this operation 100 times
#replicate() created a matrix, each column of which contains 5 random numbers generated from a Poisson distribution with mean 10.

#Now we can find the mean of each column in my_pois using the colMeans() function:
cm<- colMeans(my_pois)
#distribution of our column means by plotting a histogram with hist(cm)


### 14 Date and Time

d1 <- Sys.Date()                 #to get the current date and store it in the variable d1
t1 <- Sys.Time ()                #You can access the current date and time using the Sys.time() function with no arguments.
weekdays(d1)
months(t1)
difftime(Sys.time(), t1, units = 'days')  #to find the amount of time in DAYS that has passed since you created t1


##### 15: Base Graphics

data(cars)   #Load the included data frame cars with data(cars)
help(cars)   #Pull up the help page for cars
head(cars)   #Run head() on the cars data

#| Before plotting, it is always a good idea to get a sense of the data. Key R commands for doing so include,
#| dim(), names(), head(), tail() and summary().
plot(cars)   #Run the plot() command on the cars data frame
#Use plot() command to show speed on the x-axis and dist on the y-axis from the cars data frame. Use the form
# of the plot command in which vectors are explicitly passed in as arguments for x and y.
help(plot)   #Look up the help page for plot()
#| The help page for plot() highlights the different arguments that the function can take. The two most
#| important are x and y, the variables that will be plotted. For the next set of questions, include the
#| argument names in your answers. That is, do not type plot(cars$speed, cars$dist), although that will work.
#| Instead, use plot(x = cars$speed, y = cars$dist).
plot(cars$speed, cars$dist) #Use plot() command to show speed on the x-axis and dist on the y-axis from the cars  data frame. Use the form of the plot command in which vectors are explicitly passed in as arguments for x and
# y.
plot(x = cars$dist, y = cars$speed)
#| Use plot() command to show dist on the x-axis and speed on the y-axis from the cars data frame. This is the
#| opposite of what we did above
plot(x = cars$speed, y = cars$dist, xlab = "Speed") #Recreate the plot with the label of the x-axis set to "Speed".
plot(x = cars$speed, y = cars$dist, ylab = "Stopping Distance") #  Recreate the plot with the label of the y-axis set to "Stopping Distance"
plot(x = cars$speed, y = cars$dist, xlab= "Speed", ylab = "Stopping Distance") #Recreate the plot with "Speed" and "Stopping Distance" as axis labels
plot(cars, main = "My Plot")     #Plot cars with a main title of "My Plot"
plot(cars, sub = "My Plot Subtitle")  #Plot cars with a sub title of "My Plot Subtitle"
plot(cars, col = 2)  # Plot cars with a red color
plot(cars, xlim = c(10,15))  #Plot cars while limiting the x-axis to 10 through 15
plot(cars, pch = 2) #Plot cars using triangles


