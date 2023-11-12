# Q1
# Load the tidyverse package
# Load the reshape2 package
# Load the tips dataset
# Create a histogram of the tips by sex
# Create a box plot of the tips by sex
# Create a density plot of the tips by sex

library(tidyverse)
library(reshape2)
data(tips)

# Histogram of tips by sex
ggplot(data = tips, aes(x=tip)) +
    geom_histogram(aes(fill = sex))

# Boxplot of tips by sex
ggplot(data = tips, aes(x=sex)) +
    geom_boxplot(aes(y=tip))

# Density plot of tips by sex
ggplot(data = tips, aes(x=tip)) +
    geom_density(aes(fill=sex), alpha=0.5)

# From above, we can notice that perhaps the histogram plot is not
# the best in this scenario. Boxplots and Density plots give us a
# much better insight into the data.

# ANOVA - Analysis of Variance
# ANOVA is used to compare the means of more than two groups.
# It is an extension of the t-test.
# The null hypothesis is that all the means are equal.
# The alternative hypothesis is that at least one mean is different.

# Q2
# Create a box plot of the tips by day
# Create a violin plot of the tips by day

# Boxplot of tips by day
ggplot(data = tips, aes(x=day)) +
    geom_boxplot(aes(y=tip))

# Violin plot of tips by day
ggplot(data = tips, aes(x=day)) +
    geom_violin(aes(y=tip))

# In the above two plots, we can see that the boxplot is the better
# plot for this scenario. The violin plot is not very clear.

# Determining whether the means are different
# In other words, we want to determine whether people tip more
# on Sunday or Saturday.

# We use the aov() function to perform ANOVA.
# The first argument is a formula.
# The second argument is the data frame.

tip_aov <- aov(tip ~ day, data = tips)
summary(tip_aov)

# From the summary, you will notice that the p-value is greater
# than 0.05. Hence, we fail to reject the null hypothesis.
# This means that there is no difference in the means of the tips

# Sometimes, you will see the following code
tip_aov2 <- aov(tip ~ day - 1, data = tips)
summary(tip_aov2)
# Notice that the p-value is less than 0.05 which means we can reject
# the null hypotheses. In this case it is true because we are not comparing
# the tip distribution with the intercept.
# In other words, if we run the following code
tip_aov$coefficients
# You will notice that dayFriday is missing. That is because we used it as
# the intercept (baseline). Hence, all the other days tip distribution is
# compared with Friday's tip distribution.
# In the case of tip_aov2.
tip_aov2$coefficients
# You will notice that all the days are present. That is because we are
# not using any intercept. Hence, all the days tip distribution is compared
# with a hypothetical distribution that has a mean of 0. In other words,
# we are comparing the days to hypothetical day where no one tips.

# Linear Modeling
# We can perform the same test using the lm() function
tip_lm <- lm(tip ~ day, data = tips)
summary(tip_lm)
# Notice that this test will give us more information than aov()
# Notice that dayFriday is also missing since we used it as the intercept.

# What if we want to use Sunday as the intercept
# For this scenario, we need to define Sunday as the first level
# in the day column.
# We can do this using the factor() function
tips$day <- factor(tips$day, levels = c("Sun", "Sat", "Thur", "Fri"))
tip_lm2 <- lm(tip ~ day, data = tips)
summary(tip_lm2)

# Notice, that compared to dayThur, the p-value is less than 0.05 which means
# we can reject the null hypothesis. Hence, we can say that people tip more
# on Sunday than on Thursday.