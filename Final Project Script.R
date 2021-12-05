Mahrukh Jaura
Final Project Draft (for now)

Life expectancy at birth indicates the number of years a newborn infant would live if prevailing 
patterns of mortality at the time of its birth were to stay the same throughout its life.

I think it would be interesting to investigate the relationship between income and life expectancy and 
examining the factors that can lead to an increase or decrease in life expectancy.
'Introduction:'
Life expectancy has increased significantly over the past centuries. This paper will study the impact of 
income inequality on life expectancy along with observing other variables that may play a significant factor. 

One of the first studies that established a relationship between income inequality and life expectancy 
measured the level, temporal trend, and geographical variability in the association between income and 
life expectancy while identifying factors related to small area variation within the association. 
After evaluating factors associated with differences in life expectancy and estimating said expectancy by 
household income percentile, sex & geographic area, the study found that higher income was associated with 
higher life expectancy throughout the income distribution.
  
'Literature Review:'
A notable study that established the relationship between income and life expectancy written in 2016 by Chetty et al., 
The Association Between Income and Life Expectancy in the United States, 2001 – 2014, measured the level, temporal trend, 
and geographical variability in the association between income and life expectancy while identifying factors related to 
small area variation within the association. Income data for the U.S. population was obtained from 1.4 billion de-identified
tax records from 1999-2014; mortality data obtained through the Social Security Administration death records. With the objective 
of evaluating factors associated with differences in life expectancy and estimating said expectancy by household income percentile, 
sex & geographic area, the study found that higher income was associated with higher life expectancy throughout the income distribution. 
Inequality in life expectancy increased over time, life expectancy for low-income individuals was positively correlated with the local 
area fraction of immigrants, college graduates & local government expenditures and geographic differences in life expectancy for 
individuals in the lowest income quartile were significantly correlated with smoking but not significantly correlated with access to 
medical care, labor market conditions or income inequality. 

'Data:'
I am using the BRFSS2013 data downloaded from the class page. The data includes information on education, income, and various factors regarding health, which 
are all relevant to my project. 

attach(dat3)
table(dat3$INCOME2, dat3$EDUCA)
Analyzing the table that depicts income across education levels leads to the observation that as a persons level of education attained increases, 
the larger the number of people who earn $75,000 or more, will be, for that category. Reasonably, higher education levels can lead to better 
occupations and a healthier lifestyle, which can contribute to longer life expectancy.

Since the data is very large, I will subset to include observations from New York only which results in 8979 observations. 
> use_varb <- (X_STATE == "New York")
> dat_use <- subset(dat3,use_varb)
> attach(dat_use)

While still struggling with locating data on life expectancy or mortality data in NYC, the table below depicts the relationship between the state of a persons
health in relation to income level. Based on the table, 

table(dat3$INCOME2, dat3$GENHLTH)
                                                  Excellent Very good  Good  Fair  Poor
Less than $10,000                                      2311      3971  7498  6936  4505
Less than $15,000 ($10,000 to less than $15,000)       2115      4577  8443  7173  4291
Less than $20,000 ($15,000 to less than $20,000)       3548      7474 11964  8060  3671
Less than $25,000 ($20,000 to less than $25,000)       4713     10799 14947  7839  3270
Less than $35,000 ($25,000 to less than $35,000)       6529     14764 17254  7559  2574
Less than $50,000 ($35,000 to less than $50,000)       9980     21660 20466  7164  2048
Less than $75,000 ($50,000 to less than $75,000)      12730     26041 19701  5214  1423
$75,000 or more                                       32377     48988 27428  5648  1298

I wanted to base my project around NYC and compare boroughs but the datasets are not that geographically detailed so 
following the contents of lab 3 and employing k-nn techniques of machine learning to try to guess people’s neighborhoods, 
I decided to replicate that and predict the borough someone lives in based on acs2017_ny and brfss data, since acs2017_ny 
includes stuff like housing cost, hours worked per week, total family income, poverty status, etc. and the brfss data incorporates
a myriad of health-related variables. 


"The income diversity ratio is a single value meant to represent the variability in the distribution of income in a geography. In this instance CCC uses an 80:20 ratio, which compares income at the 80th percentile (the upper limit of the fourth quintile) with income at the 20th percentile (the upper limit of the bottom quintile)"
Additionally, the ratio for the 80th-to-20th percentiles of income distribution is just one of a variety of ways to measure income inequality. Research underscores the importance of considering more than one metric of inequality (e.g. the Gini Coefficient, Theil index, Palma Ratio, and other distribution ratios). However, some findings suggest that income inequality in New York City does not vary as much as other metropolitan areas when comparing across different metrics of inequality


use_varb1 <- (Location == "New York City")
nyc_le <- subset(Life_Expectancy,use_varb1)
attach(nyc_le)
plot(TimeFrame,Data,xlab="Years",ylab="Life Expectancy",pch=3)
title("Scatter Plot of Life Expectancy In NYC Over the Years")
detach(nyc_le)

attach(Income_Diversity_Ratio)
use_varb2 <- (Location == "Bronx")
bronx_IDR <- subset(Income_Diversity_Ratio,use_varb2)
attach(bronx_IDR)
plot(TimeFrame,Data,xlab="Years",ylab="Income Diversity Ratio",pch=3)
title("Scatter Plot of Income Diversity Ratio In The Bronx From 2010-19")
detach(bronx_IDR)

use_varb3 <- (Location == "Brooklyn")
brooklyn_IDR <- subset(Income_Diversity_Ratio,use_varb3)
attach(brooklyn_IDR)
plot(TimeFrame,Data,xlab="Years",ylab="Income Diversity Ratio",pch=3)
title("Scatter Plot of Income Diversity Ratio In Brooklyn From 2010-19")
detach(brooklyn_IDR)

use_varb4 <- (Location == "Manhattan")
manhattan_IDR <- subset(Income_Diversity_Ratio,use_varb4)
attach(manhattan_IDR)
plot(TimeFrame,Data,xlab="Years",ylab="Income Diversity Ratio",pch=3)
title("Scatter Plot of Income Diversity Ratio In Manhattan From 2010-19")
detach(manhattan_IDR)

use_varb5 <- (Location == "Queens")
queens_IDR <- subset(Income_Diversity_Ratio,use_varb5)
attach(queens_IDR)
plot(TimeFrame,Data,xlab="Years",ylab="Income Diversity Ratio",pch=3)
title("Scatter Plot of Income Diversity Ratio In Queens From 2010-19")
detach(queens_IDR)

use_varb6 <- (Location == "Staten Island")
SI_IDR <- subset(Income_Diversity_Ratio,use_varb6)
attach(SI_IDR)
plot(TimeFrame,Data,xlab="Years",ylab="Income Diversity Ratio",pch=3)
title("Scatter Plot of Income Diversity Ratio In Staten Island From 2010-19")
detach(SI_IDR)





