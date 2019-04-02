#get working directory: getwd()
#set working director: setwd(choose.dir())

#-----------assigning values-----------
myNum = 5
myNum <- 5 -> myNum2
#fancy, interesting, but pretty useless
cat(c(myNum,myNum2))

#difference between <- and =
#<- is defined on the top level whereas = only inside the functions, for eg

median(x = 1:10)
x
#in this case we cant find x, because its not on the top level

median(x <- 1:10)
x
#in this case what do you know x if on the top level, so for functions lets use the equal sign

#-----------different classes-----------:
print(class(4))
#numeric

print(class(4.5))
#also numeric in the floaty sense

print(class(4L))
#integer

print(class(T))
#TRUE, FALSE, T and F all work in R
#type logical

print(class(1+4i))
#type complex

print(class("sample"))
#type character

print(class(charToRaw("sample")))
print(charToRaw(("sample")))
#converts stuff to raw (Stored in bytes)
#type raw

#checking type of data
x <- 5
is.integer(x)
is.numeric(x)
is.matrix(x)
is.data.frame(x)
is.logical(x)
is.vector(x)
is.character(x)
#convert between data types
x <- as.integer(x)
x <- as.complex(x)
#etc,
x <- as.logical(x)
y <- as.logical(0)
y
z <- as.logical(-1)
z
#so a non-zero value is true, and a zero value is false
y <- as.numeric(y)
y
z <- as.numeric(z)
z
#so it just converts back to 0 and 1 from true and false

#-----------artithemetic-----------
#basics
sprintf("4 + 5 = %d", 4 + 5)
sprintf("4 - 5 = %d", 4 - 5)
sprintf("4 * 5 = %d", 4 * 5)
#% is the format place for the string, 1 is the number of digits before and 3f is the number of digits after the decimal
sprintf("4 / 5 = %.3f", 4 / 5)
#%s for string, %x.yf for float,d,i,o,x for integer values with different ones being for different cases
sprintf("%s %s","test","test")

#remainder (also typing %% prints the character '%')
sprintf("5 %% 4 = %d", 5%%4)

#power is just ^
sprintf("4^2 = %d", 4^2)

#-----------vectors-----------
#defining
numbers <- c(1,2,3,4,5)
numbers
#when defined this way is it the same?
numbers2 <- 1:5
numbers2
class(numbers) == class(numbers2)
#they arent the same apparently
class(numbers)
class(numbers2)
#one is numeric whereas two is integer
numbers3 <- as.numeric(numbers2)
class(numbers3)
class(numbers3) == class(numbers)
#so now they are the same, just needed to be converted to numeric

#get value from index:
numbers[1]
#remember, R starts from the 1 index

#get length
length(numbers)

#get last value
numbers[length(numbers)]

#get everything but an index
numbers[-1]
numbers[c(-1,-2)]

#get just cetain indices
numbers[c(1,2)]

#get second and third
numbers[2:3]

#sorting, by default sort by increasing
sort(numbers, decreasing = T)
numbers
#but the sort doesnt sort the original number, just returns the list sorted, unless you store it back
numbers = sort(numbers, decreasing = T)
numbers

#generating sequence
#this seems like pretty bad practice because seq is the name of the func to generate,
#but its interesting to know you can do this
seq = 1:10

#generating sequence
add3 = seq(from = 3, to = 27, by = 3)
add3
#what if its different ending, does it stop or error or what?
add4 = seq(from = 3, to = 28, by = 4)
add4
#apparently it just stops when it cant work

#what if you just want 10 units?
evens = seq(from = 2, by = 2, length.out = 10)
evens

#what if you wanna repeat values?
#print each value in x twice, for a total of 3 times
repeatednonsense = rep(x = c(1,2,3), times = 3, each = 2)
repeatednonsense

#---------relational operators---------
sprintf("4 == 5 : %s", 4 == 5)
sprintf("4 != 5 : %s", 4 != 5)
sprintf("4 > 5 : %s", 4 > 5)
sprintf("4 < 5 : %s", 4 < 5)
sprintf("4 >= 5 : %s", 4 >= 5)
sprintf("4 <= 5 : %s", 4 <= 5)
#same as python to be fair

#some tricks with vectors
#creating array of whether even from one to twenty
isEven <- c(1:20) %% 2 == 0
isEven

#creating an array of only evens
oneToTwenty = c(1:20)


oneToTwenty = oneToTwenty[T]
oneToTwenty

#take array one to twenty and modulo all values inside by 2 and return T or F
#depending on whether it is divisible by 2 or not, then take the new array of T
#and F to return just the Ts of the oneToTwenty
evens = oneToTwenty[oneToTwenty %% 2 == 0]
evens

#testing what happens for two to twenty one
twoToTwentyone = c(2:21)

#some tests
newevens = twoToTwentyone[twoToTwentyone %% 2 ==0]
newevens

print(twoToTwentyone[3])

newstring = c("hello","konichiwa","I don't know japanese")
print(newstring[1])

#----------logical operators----------
#cat combines strings, as mentioned
#and operator
cat("TRUE && FALSE = ", T && F, "\n")
#or operator
cat("TRUE || FALSE = ", T || F, "\n")
#not operator
cat("!TRUE = ", !T, "\n")

#----------switch----------
#finally a superior function

grade <- "Z"
#just did some research, double quotes are preferred because results are printed
#with double quotes, single quotes for delimiters

ans = switch(grade,
       "A" = "marvelous, finally pulling your own weight",
       "B" = "fine",
       "C" = "ok...",
       "D" = "hm...",
       "E" = "excuse me?",
       "F" = "classic philip grade",
       "dont lie to me")

print(ans)

#----------strings----------

str1 = "this is a string"

#number of characters
nchar(str1)

#comparing strings
sprintf("Dog > Egg : %s", "Dog" > "Egg")
#later letters are bigger
sprintf("Egg > Dog : %s", "Egg" > "Dog")
sprintf("Dog == Egg : %s", "Dog" == "Egg")

#combining 2 strings, seperator is selectable
str2 = paste("dog","cat",sep = "")
str2
#is seperableness definable for cat?
str3 = cat(c("one","two","three"), sep = "")
str3
#yes apparently so

#take particular stuff from string, taking from point 4 to 6, which just leaves cat
substr(x = str2, start = 4, stop = 6)

#substitute first instance in string
sub(x = str2, pattern = "dog", replacement = "monkey")

#substitude all instances in string
str4 = "boyboyboyboyboy"
gsub(x = str4, pattern = "boy", replacement = "girl")

#split string into vector
strVect = strsplit((str4), split = "")
strVect

#----------factors-----------
#creating factors
direction <- c("north","east","west","north")
#You are able to define the levels manually
factorDirection <- factor(direction, levels = c("north","south","east","west"))
factorDirection
#it stores the values, and also the different categories

#checking if factor
is.factor(factorDirection)

#generating factor with 5 items per levels for just the first 2 levels
v <- gl(2,5,labels = c("boy","girl","trans"))
v

#order factor by levels
days <- c("Monday", "Tuesday", "Wednesday", "Thursday",
          "Friday", "Saturday", "Sunday")

workingdays <- c("Friday","Monday")
factorWorkingDays = factor(x = workingdays, levels = days, ordered = T)
factorWorkingDays

#----------dataframes----------
#equal amount of data in each column
#table
#rows are called records and columns variables

custData <- data.frame(name = c("phil","sk","ali"),
                       age = c(21,22,23),
                       stringsAsFactors = F)
custData

#get cust data by unit (row then column)
custData[1,2]

#get entire row
custData[1,]

#get entire column
custData[,1]

#adding records
newRecord <- data.frame(name = "anish",
                       age = 24)
custData <- rbind(custData, newRecord)
custData
#If you go back and run by the line it will only that line in addition to
#whatever code was already run

#adding a new column to a data frame
debt <- c(100,200,0,400)
custData <- cbind(custData, debt)
custData

#check values of a certain kind
owesMoney = custData[custData$debt > 0,]
owesMoney

#----------looping-----------
#repeating until a condition is met
num <- 1

#repeat until broken
repeat{
  print(num)
  num = num + 1
  if(num>5){
    break
  }
}

num2 <- 1

#repeat while a certain condition is true
while(num2<=5){
  print(num2)
  num2 <- num2 + 1
}

#repeat for a certain amount
for(i in 1:5){
  print(i)
}

#----------matrices-----------

#single column matrix
matrix1 = matrix(c(1,2,3,4))
matrix1

#matrix with rows and columns defined
matrix2 = matrix(wow = c(1,2,3,4), nrow = 2, ncol = 2)
#why can you just use the word wow?
#by right use 'data'

#filling by column instead
matrix3 = matrix(data = c(1,2,3,4),nrow = 2,ncol = 2, byrow = T)
matrix3

#getting matrix dimensions
dim(matrix3)

#accessing by row, column
matrix3[1][1]
matrix3[1,1]

#get a whole row
matrix3[1,]

#get a whole column
#results are returned in vectors!
#t function transposes matrices
t(t(matrix3[,1]))

#need to figure out orientation if just taking single row or column
matrix(matrix3[1,])

#combining vectors to make matrix
#bind row
matrix4 <- rbind(c(1,2,3),c(4,5,6),c(7,8,9))
matrix4

#get certain rows
matrix4[2:3,]

#get certain columns
matrix4[,2:3]

#get by ommiting rows
matrix4[-1,]

#change value
matrix4[1][1] <- 17
matrix4

#change row
matrix4[1,] <- c(10,11,12)
matrix4

#----------multi dimensional arrays-----------
array1 <- array(1:8, dim = c(2,2,2))
array1

#every thing is the same as matrices to be fair

#----------functions----------

getSum <- function(x,y){
  return(x+y)
}
getSum(1,2)

#if no return is used, it just returns the last line of code
#you can define the default values inside the arguments
getDiff <- function(x=1,y=1){
  x-y
}
getDiff(2)

#You can handle if arguments are missing from the function when its called
#also remember that its brackets after the word
missFunc <- function(x){
  if(missing(x)){
    return("for goodness sake provide x")
  } else {
    return(x)
  }
}

missFunc()
missFunc(1)


#handling multiple arguments
summer <- function(...){
  numbers = list(...)
  sum = 0
  for(i in numbers){
    sum = sum + i
  }
  sum
}

summer(1,2,3,4,5)
sum

#anonymous functions
numlist = 1:10
#define the function and params, what the function does, what are you parsing into the function
sinlist = (function(x) sin(x))(numlist)
sinlist

#closures
#functions made by functions
#probably something that could have been used to optimise the heck out of the orbital code
power = function(exp){
  function(x){
    x ^ exp
  }
}

power2 = power(2)
power2(2)
#ho ho merry christmas the orbital function gonna be hecka fast

power2(1:5)

#storing functions in lists
iGotThePower = list(
  power1 = power(1),
  power2 = power(2),
  power3 = power(3)
)

iGotThePower$power2(17)

#----------Exception Handling----------
#Ah yes my favourite bad practice, just making everything an error handler

#trycatch
#function followed by the error
#trys to run the code first
#if there is an error, then it will switch to the error handler
#different types of error handlers
divide <- function(num1, num2){
  tryCatch({
    print(num1)
    num1/num2
  },
  error = function(e){
    if(is.character(num1)||is.character(num2)){
      return("dont divide by strings")
    }
  },  
  finally = {
    #insert cleanup code here if needed
  }
  )
}

divide(3,"3")

#----------Reading and writing files-----------

library(plyr)

peopleData <- read.table(file.choose(),
                         header = T, sep = ",",
                         na.strings = "`",
                         stringsAsFactors = F)

#peopleData is now a dataFrame
peopleData

#adding another person
newPers <- data.frame(first_name = "Donna",
                      last_name = "Yode",
                      company_name = "springs bau",
                      address = "17 Kensington",
                      city = "Singapore",
                      county = "howdy")

peopleData <- rbind.fill(peopleData, newPers)

peopleData[501,]

#updating a record
peopleData[501,2] <- "Yoda"
peopleData[501,]

#updating the file
#Do not use quotes to contain strings, and do not save the row numbers
write.table(x = peopleData,
            file = file.choose(),
            sep = ",", na = "<NA>",
            quote = F, row.names = F)

#get first few records
head(peopleData,3)

#get last few records
tail(peopleData,1)

#---------Basic Plotting----------
#creating a matrix to be plotted
xy1 <- matrix(data = c(1,2,3,4,5,
                       6,7,8,9,10),
              nrow = 5, ncol = 2)

xy1
#if you define too many columns it will repeat the fill from the original value!
plot(xy1)

#drawing a line
x1 <- c(1,2,3,4,5)
y1 <- c(1,2,3,4,5)
plot(x1,y1,type = "l")

#drawing both
plot(xy1,type = "b")

#drawing both but with no space bewtween
plot(xy1,type = "o",
     main = "Test Plot",
     xlab = "x-axis",
     ylab = "y-axis",
     col = "steelblue",
     #define the point type (1-25)
     pch = 3,
     #define the line type(1-6)
     lty = 5,
     #define the x and y limits
     xlim = c(0,10),
     ylim = c(0,10)
     )

#Adding straight lines
abline(h=c(2,4),v=c(1,3),col = "red",lty = 2)

#drawing segmented lines
segments(x0=c(1,2,3,4,5),y0=c(5,6,7,8,9),x1=c(5,6,7,8,9),y1=c(5,6,7,8,9))

#drawing arrows
arrows(x0=1.5,y0=4.55,x1=2.7,y1=3.3,col = "blue")

#print text
text(x=5,y=5,labels = "centre")

#load built in datafram
plot(faithful)

#highlight eruptions with waiting time greater than 4
eruptions4 <- with(faithful,faithful[eruptions>4,])

#now add in the points
points(eruptions4, pch = 2, col = "red")

#----------maths functions----------
sqrt(x = 100)
sqrt(100)

log(x = 4, base = 2)
log(x = exp(1), base = exp(1))

#add values in a vector
sum(c(1,2,3,4,5))

#other stuff
variables = c(1,3,5,8)

mean(variables)

median(variables)

min(variables)

max(variables)

range(variables)

#rounding
ceiling(4.5)
floor(4.5)

#cumulatives, just continue adding and add the next term
cumsum(c(1,2,3))
cumprod(c(1,2,3))
cummax(c(1,2,1,2,1,2))
cummin(c(1,2,1,2,1,2))

#generating random samples flipping coin 10 times and weigh the probability from
#a sample of 0 to 10, take one value out and append to list. replace the value
#removed, and repeat this process 10 times
sample(0:1,10,replace=T)

#----------pie charts----------

#list percentages
food <- c(15,30,15,40)

#list labels
labels <- c("pizza","ice cream","chendol","rabbit meat")

#where to save image
png(file = "food_preferences.png")

#generate list of colors
colors = rainbow(length(food))
colors

#create chart
pie(food, labels = labels, main = "Food Preference", col = colors)

#set the legend for the pie (location, labels, fill to set colors)
legend("topright", labels, fill = colors)

dev.off()

#3d pie chart
library(plotrix)

#create the file
png(file = "3D_food_preferences.png")

#create chart
pie3D(food, labels = labels, main = "Food Preference", start = pi/2, col = colors, explode = 0.1, labelcex = 0.5)

#save the file
dev.off()


#----------bar charts-----------

#create the file
png(file = "bar_food_preferences.png")

#plot the chart
barplot(food, names.arg = labels, xlab = "food", ylab = "percentage", col = colors, main = "Food preferences")

#save the chart
dev.off()

#----------regression analysis----------

#open the file
players <- read.table(file.choose(),
                       header = T, sep = " ",
                       na.strings = "`",
                       stringsAsFactors = F)

players

#create the data file with the trait in question as well as other states
playerInterestedData <- players[,c("RBI","AVG","HR","OBP","SLG","OPS")]

#create the relationship model
relationship <- lm(playerInterestedData$RBI ~ playerInterestedData$AVG + 
                    playerInterestedData$HR +playerInterestedData$OBP + 
                    playerInterestedData$SLG +playerInterestedData$OPS)

relationship
