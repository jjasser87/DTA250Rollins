new_sales = sample(30:100, size=50, replace=TRUE)

t.test(new_sales, alternative = "greater", mu=50)
new_sales_ttest <- t.test(new_sales, alternative = "greater", mu=50)

randT <- rt(30000, df=29) 
# rt is the t distribution, df is the degree of freedom
ggplot(data.frame(x=randT)) +
  geom_density(aes(x=x), fill="grey", color="grey") +
  geom_vline(xintercept = new_sales_ttest$statistic) +
  geom_vline(xintercept = mean(randT) + 1.69, linetype=2)

shapiro.test(new_sales)

ggplot(data = data.frame(new_sales), aes(x=new_sales)) +
  geom_density()
