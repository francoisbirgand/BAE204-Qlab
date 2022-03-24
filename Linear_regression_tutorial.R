x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

plot(x,y)

# Apply the lm() function, lm stands for linear model

relation <- lm(y~x) # puts in a variable named relation the values associated with a linear regression of y as a function of x
# in this form, it assumes that the intercept is not 0

names(relation) # gives quite a few important parameters that are included in the object relation
summary(relation) # gives you a summary of important (same as above + additional) values compiled into a readable table. To obtain some of the values like 
# the R square or other things, you type
names(summary(relation))

# the regression line that will be go through the cloud of point will be of the form y = ax + b

relation$coefficients # is a vector that gives the coefficients of the regression 
relation$coefficients[1] # gives the intercept of the regression line or the coefficient b
relation$coefficients[2] # gives the slope of the regression line or the coefficient a

# you may thus also retrieve the coefficients of the regression using

summary(relation)$coefficients # you now have also access to the standard error on the intercept (first row) and on the slope
# (second row), the t value  gives the results of the t-test associated with testing the significance of the parameter listed 
# in the first column, and Pr(>|t|) gives you the p-value for that t-test 

# You could thus retrieve the value for the slope using 
summary(relation)$coefficients[2,1] #second row of the first column 

# You could thus retrieve the value for the intercept using 
summary(relation)$coefficients[1,1] #first row of the first column 

# So essentially relation$coefficients[1] is the same as summary(relation)$coefficients[1,1] and
# relation$coefficients[2] is the same as summary(relation)$coefficients[2,1]

# OK, now you want the intercept to be 0, you write
relation_no_intercept <- lm(y~x+0) 
relation_no_intercept$coefficients # now only has one value for the slope


