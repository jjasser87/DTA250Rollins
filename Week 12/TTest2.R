# DTA250
# JJ

# T-Test for a paired two sample

library(tidyverse)

# Load the UsingR library
library(UsingR)

install.packages("UsingR")

# Load the father.son dataset
data(father.son)

plot(father.son$fheight, father.son$sheight)

# Create a data frame of the t-distribution
t.df <- data.frame(x = seq(-4, 4, 0.01),
                   y = dt(seq(-4, 4, 0.01), df=10))

# Create a plot of the t-distribution
plot(t.df$x, t.df$y, type="l", col="blue", xlab="t", ylab="Density",
     main="T-Distribution")

# T-Test between fathers' height and sons' height
t.test(father.son$fheight, father.son$sheight, paired=TRUE)
# or t.test(fheight ~ sheight, data=father.son, paired=TRUE)

# paired means that the two samples are related. One sample depends on the other
# sample. In this case, the sons' height depends on the fathers' height.

# As with every statistical test, there are two hypotheses:
# The null hypothesis (H0) and the alternative hypothesis (H1)
# The null hypothesis is the hypothesis that there is no significant difference
# between specified populations, any observed difference being due to sampling
# or experimental error.
# The alternative hypothesis is the hypothesis that is contrary to the null
# hypothesis.

# The result of the t-test is a p-value. The p-value is the probability of
# obtaining test results at least as extreme as the results actually observed,
# under the assumption that the null hypothesis is correct.

# If the p-value is less than 0.05, we reject the null hypothesis and accept the
# alternative hypothesis. If the p-value is greater than 0.05, we accept the
# null hypothesis and reject the alternative hypothesis.

# The results of the t.test() function shows that the p-value is 0.0000000000000002
# which is less than 0.05. Therefore, we reject the null hypothesis and accept
# the alternative hypothesis. The alternative hypothesis is that there is a
# significant difference between the fathers' height and the sons' height.

# In other words, We can't accurately predict the height of the son based on the
# height of the father.

# Two-Sample T-Test

# Load the reshape2 package
library(reshape2)

# Load the tips dataset
data(tips)

# Load the GGally package
library(GGally)

# Run ggpairs() on the whole tips dataset
ggpairs(tips)

# Create a histogram plot of the tips by sex
ggplot(data = tips, aes(x=tip)) +
    geom_histogram(aes(fill = sex))

# We ask the question, Do Males tip more than Females? or vice versa?
# We can answer this question using a two-sample t-test.

# However, before we can run a two-sample t-test, we need to check if the
# distributions are normal. We can do this using the shapiro.test() function.

# Shapiro test
# H0: The distribution is normal
# H1: The distribution is not normal

# Shapiro test for tips by Males
tips |> filter(sex == "Male") |> pull(tip) |> shapiro.test()
# The p-value is smaller than 0.05, so we reject the null hypothesis and accept
# the alternative hypothesis. The distribution is not normal.

# Shapiro test for tips by Females
tips |> filter(sex == "Female") |> pull(tip) |> shapiro.test()
# The p-value is smaller than 0.05, so we reject the null hypothesis and accept
# the alternative hypothesis. The distribution is not normal.

# Depending on the result of the Shapiro test, we can use either the parametric
# or non-parametric version of the two-sample t-test.
# If both are normal, we can use the parametric version such as an f-test.
# If one or both are not normal, we can use the non-parametric version.
# The non-parametric version is more robust and can be used in all cases.

# Since the distributions are not normal, we will use the non-parametric
# Ansari-Bradley test.
ansari.test(tip ~ sex, data=tips)

# The p-value is greater than 0.05, so we accept the null hypothesis and reject
# the alternative hypothesis.
# Both samples have the same variance.

# Now we can run the two-sample t-test.
t.test(tips |> filter(sex == "Male") |> pull(tip),
       tips |> filter(sex == "Female") |> pull(tip))

# The p-value is greater than 0.05, so we accept the null hypothesis and reject
# the alternative hypothesis. There is no significant difference between the
# tip amount from Males to Females.