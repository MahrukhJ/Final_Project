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

detach()
attach(Life_Expectancy)

use_varb_idk <- (Location =="Battery Park/Tribeca"&"Greenwich Village")
attempt_manhattan <- subset(Life_Expectancy, use_varb_idk)

Observe scatter plots on Income Diversity Ratios throughout the five boroughs from 2010 - 2019. 
Observe scatter plots on Life Expectancy in the five boroughs through community districts, 2014-18. 


Noticing how high the income diversity ratio is for Manhattan, that too consistently, 
it would help explain the differing life expectancies in various community districts within Manhattan. 
I want to go further into this and observe the significance that x, y, and z, have on health, specifcally in Manhattan. 

Central Harlem Educational Attainment:
attach(Educational_Attainment)
use_varb7 <- (Location == "Central Harlem")
EDUC_CH <- subset(Educational_Attainment, use_varb7)
attach(EDUC_CH)
detach(Educational_Attainment)
detach(Life_Expectancy)
detach(EDUC_CH)
"Notes","The Federal Poverty Level (FPL) is an income threshold calculated by the U.S. Census Bureau each year for the purpose of estimating the number of individuals and households living in poverty. The income threshold varies based on the number of children and adults in a household and the age of the head of household. In 2019, the FPL for a household consisting of two adults and two children was $25,750. The Census Bureau excludes institutionalized individuals, individuals living in military group quarters or college dorms, and unrelated individuals under 15 years of age from poverty estimates. Percents refer to the percent of the total population for whom poverty status was determined."

Central Harlem Povery Level:
attach(Poverty)
use_varb8 <- (Location == "Central Harlem")
Pov_CH <- subset(Poverty, use_varb8)
attach(Pov_CH)
detach(Poverty)
use_varb9 <- (DataFormat == 'Number')
Pov_CH1 <- subset(Pov_CH, use_varb9)
attach(Pov_CH1)
detach(Pov_CH)
plot(TimeFrame,Data,xlab="Years",ylab="Poverty Number Estimated",pch=3)
title("Scatter Plot of Poverty Number Estimated in Central Harlem")
detach()
Upper West Side Poverty Estimation:
attach(Poverty)
use_varb11 <- (Location == "Upper West Side")
UWS_pov <- subset(Poverty, use_varb11)
attach(UWS_pov)
detach(Poverty)
use_varb_again <- (DataFormat == 'Number')
UWS_pov1 <- subset(UWS_pov, use_varb_again)
attach(UWS_pov1)
detach(UWS_pov)
plot(TimeFrame,Data,xlab="Years",ylab="Poverty Number Estimated",pch=3)
title("Scatter Plot of Poverty Number Estimated in the Upper West Side")

detach()
attach(Income_Diversity_Ratio)
use_varb12 <- (TimeFrame >= 2014)
IDR1 <- subset(Income_Diversity_Ratio, use_varb12)
attach(IDR1)
detach(Income_Diversity_Ratio)
detach()
use_varb13 <- (TimeFrame <=2018)
IDR2 <- subset(IDR1, use_varb13)
attach(IDR2)
detach(IDR1)
detach()

attach(Life_Expectancy)
use_varb14 <- (TimeFrame >= 2014)
LifeExpect1 <- subset(Life_Expectancy, use_varb14)
attach(LifeExpect1)
detach(Life_Expectancy)

Now, IDR2 and LifeExpect1 have the same length which means that I can run a regression on the variables from both datasets since they have the same length. 

--------------------Single Regression Model!!!!!--------------------
model_attempt1 <- lm(LifeExpect1$Data ~ IDR2$Data)
summary(model_attempt1)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.2572 -1.7559 -0.0674  2.1975  5.5139 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 81.46033    0.66970 121.636   <2e-16 ***
IDR2$Data    0.04589    0.10648   0.431    0.667    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.815 on 298 degrees of freedom
Multiple R-squared:  0.0006229,	Adjusted R-squared:  -0.002731 
F-statistic: 0.1858 on 1 and 298 DF,  p-value: 0.6668"

Income Diversity Ratio is not significant, when compared as a whole, to Life Expectancy, in a single regressional model.


detach()
attach(Poverty)
use_varb_idk <- (TimeFrame >= 2014)
Pov <- subset(Poverty, use_varb_idk)
detach(Poverty)
attach(Pov)
use_varb_idk1 <- (TimeFrame <= 2018)
Poverty1 <- subset(Pov, use_varb_idk1)
detach(Pov)
attach(Poverty1)
use_varbb <- (DataFormat == "Number")
Poverty2 <- subset(Poverty1, use_varbb)
detach(Poverty1)
attach(Poverty2)

model_attempt2 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data)
summary(model_attempt2)

"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.2803 -1.7658 -0.0245  2.1771  5.4829 

Coefficients:
                Estimate Std. Error t value Pr(>|t|)    
(Intercept)    8.148e+01  6.702e-01 121.571   <2e-16 ***
IDR2$Data      4.918e-02  1.066e-01   0.461    0.645    
Poverty2$Data -7.364e-07  8.079e-07  -0.912    0.363    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.816 on 297 degrees of freedom
Multiple R-squared:  0.003411,	Adjusted R-squared:  -0.0033 
F-statistic: 0.5083 on 2 and 297 DF,  p-value: 0.6021"

The monthly rent (in dollars) agreed to or contracted for, regardless of any furnishings, utilities, fees, meals, or services that may be included.&nbsp;

detach(Poverty2)
attach(Monthly_Rent)
use_varbbb <- (TimeFrame >= 2014)
Mon_rent <- subset(Monthly_Rent, use_varbbb)
detach(Monthly_Rent)
attach(Mon_rent)
use_varb15 <- (TimeFrame <= 2018)
Mon_rent1 <- subset(Mon_rent, use_varb15)
detach(Mon_rent)
attach(Mon_rent1)
use_v <- (DataFormat == "Number")
Mon_rent2 <- subset(Mon_rent1, use_v)
detach(Mon_rent1)
attach(Mon_rent2)
use_varb16 <- (TimeFrame == 2014)
MonthRent14 <- subset(Mon_rent2, use_varb16)
use_varb17 <- (TimeFrame == 2015)
MonthRent15 <- subset(Mon_rent2, use_varb17)
use_varb18 <- (TimeFrame == 2016)
MonthRent16 <- subset(Mon_rent2, use_varb18)
use_varb19 <- (TimeFrame == 2017)
MonthRent17 <- subset(Mon_rent2, use_varb19)
use_varb20 <- (TimeFrame == 2018)
MonthRent18 <- subset(Mon_rent2, use_varb20)

model_attempt3 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + MonthRent18$Data)
summary(model_attempt3)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + 
    MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + 
    MonthRent18$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.6703 -1.7588  0.0301  2.2168  5.4575 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)       8.148e+01  6.706e-01 121.511   <2e-16 ***
IDR2$Data         4.968e-02  1.069e-01   0.465    0.643    
Poverty2$Data    -1.371e-06  1.128e-06  -1.215    0.225    
MonthRent14$Data -3.857e-04  2.144e-04  -1.799    0.073 .  
MonthRent15$Data  6.274e-04  4.070e-04   1.542    0.124    
MonthRent16$Data -2.700e-04  2.435e-04  -1.109    0.269    
MonthRent17$Data  2.524e-05  6.202e-05   0.407    0.684    
MonthRent18$Data  1.959e-06  9.523e-06   0.206    0.837    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.813 on 292 degrees of freedom
Multiple R-squared:  0.02221,	Adjusted R-squared:  -0.001231 
F-statistic: 0.9475 on 7 and 292 DF,  p-value: 0.4701"

detach(Mon_rent2)
attach(Unemployment_Rate_)
use_varb21 <- (TimeFrame >= 2014)
UnER <- subset(Unemployment_Rate_, use_varb21)
detach(Unemployment_Rate_)
attach(UnER)
use_varb22 <- (TimeFrame <= 2018)
UnER1 <- subset(UnER, use_varb22)
detach(UnER)
attach(UnER1)

model_attempt4 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + MonthRent18$Data + 
                       UnER1$Data)
summary(model_attempt4)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + 
    MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + 
    MonthRent18$Data + UnER1$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.3269 -1.6544  0.1727  2.2495  5.2700 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)       8.083e+01  7.272e-01 111.153   <2e-16 ***
IDR2$Data         1.853e-02  1.071e-01   0.173   0.8627    
Poverty2$Data    -1.581e-06  1.125e-06  -1.405   0.1610    
MonthRent14$Data -4.070e-04  2.132e-04  -1.909   0.0572 .  
MonthRent15$Data  6.428e-04  4.043e-04   1.590   0.1129    
MonthRent16$Data -2.601e-04  2.419e-04  -1.075   0.2833    
MonthRent17$Data  2.140e-05  6.163e-05   0.347   0.7286    
MonthRent18$Data  2.191e-06  9.460e-06   0.232   0.8170    
UnER1$Data        1.164e+01  5.224e+00   2.227   0.0267 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.794 on 291 degrees of freedom
Multiple R-squared:  0.0386,	Adjusted R-squared:  0.01217 
F-statistic: 1.461 on 8 and 291 DF,  p-value: 0.1713"

FINALLY!!! Unemployment rate is significant to life expectancy!

detach()
attach(Educational_Attainment)
idk_varb <- (TimeFrame >= 2013)
Educ <- subset(Educational_Attainment, idk_varb)
detach(Educational_Attainment)
attach(Educ)
idk_varb1 <- (TimeFrame <= 2017)
Educ1 <- subset(Educ, idk_varb1)
detach(Educ)
attach(Educ1)
idk_varb2 <- (DataFormat == "Number")
Educ2 <- subset(Educ1, idk_varb2)
detach(Educ1)
attach(Educ2)
#want the lengths to be equal, so dividing the subset by year:
argh_varb1 <- (TimeFrame == 2013)
Educ2013 <- subset(Educ2, argh_varb1)
argh_varb2 <- (TimeFrame == 2014)
Educ2014 <- subset(Educ2, argh_varb2)
argh_varb3 <- (TimeFrame == 2015)
Educ2015 <- subset(Educ2, argh_varb3)
argh_varb4 <- (TimeFrame == 2017)
Educ2017 <- subset(Educ2, argh_varb4)


model_attempt5 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + MonthRent18$Data + 
                       UnER1$Data + Educ2013$Data + Educ2014$Data + Educ2015$Data)
summary(model_attempt5)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + 
    MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + 
    MonthRent18$Data + UnER1$Data + Educ2013$Data + Educ2014$Data + 
    Educ2015$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.5136 -1.6990  0.1507  2.2378  5.3897 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)       8.084e+01  7.358e-01 109.866   <2e-16 ***
IDR2$Data         9.687e-04  1.090e-01   0.009   0.9929    
Poverty2$Data    -2.897e-06  1.401e-06  -2.068   0.0396 *  
MonthRent14$Data -5.841e-04  2.542e-04  -2.298   0.0223 *  
MonthRent15$Data  1.003e-03  5.091e-04   1.969   0.0499 *  
MonthRent16$Data -4.497e-04  2.977e-04  -1.510   0.1320    
MonthRent17$Data  1.708e-05  6.244e-05   0.273   0.7847    
MonthRent18$Data  3.216e-05  2.533e-05   1.269   0.2053    
UnER1$Data        1.268e+01  5.296e+00   2.395   0.0173 *  
Educ2013$Data     4.803e-05  6.772e-05   0.709   0.4787    
Educ2014$Data    -5.324e-05  6.695e-05  -0.795   0.4271    
Educ2015$Data     1.636e-06  1.169e-06   1.400   0.1626    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.791 on 288 degrees of freedom
Multiple R-squared:  0.05047,	Adjusted R-squared:  0.0142 
F-statistic: 1.392 on 11 and 288 DF,  p-value: 0.1759"

Concentrated Poverty: 
The total population living in extreme-poverty neighborhoods. Extreme-poverty neighborhoods are census tracts with poverty rates of 40 percent or higher.

detach()
attach(Concentrated_Poverty)
varb_1 <- (TimeFrame >= 2014)
ConPov <- subset(Concentrated_Poverty, varb_1)
detach(Concentrated_Poverty)
attach(ConPov)
varb_2 <- (TimeFrame <= 2018) & (DataFormat == "Number")
ConPov1 <- subset(ConPov, varb_2)
detach(ConPov)
attach(ConPov1)

model_attempt6 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + MonthRent18$Data + 
                       UnER1$Data + Educ2013$Data + Educ2014$Data + Educ2015$Data + ConPov1$Data)
summary(model_attempt6)
"Call:
  lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + 
       MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + 
       MonthRent18$Data + UnER1$Data + Educ2013$Data + Educ2014$Data + 
       Educ2015$Data)

Residuals:
  Min      1Q  Median      3Q     Max 
-7.5136 -1.6990  0.1507  2.2378  5.3897 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)       8.084e+01  7.358e-01 109.866   <2e-16 ***
IDR2$Data         9.687e-04  1.090e-01   0.009   0.9929    
Poverty2$Data    -2.897e-06  1.401e-06  -2.068   0.0396 *  
MonthRent14$Data -5.841e-04  2.542e-04  -2.298   0.0223 *  
MonthRent15$Data  1.003e-03  5.091e-04   1.969   0.0499 *  
MonthRent16$Data -4.497e-04  2.977e-04  -1.510   0.1320    
MonthRent17$Data  1.708e-05  6.244e-05   0.273   0.7847    
MonthRent18$Data  3.216e-05  2.533e-05   1.269   0.2053    
UnER1$Data        1.268e+01  5.296e+00   2.395   0.0173 *  
Educ2013$Data     4.803e-05  6.772e-05   0.709   0.4787    
Educ2014$Data    -5.324e-05  6.695e-05  -0.795   0.4271    
Educ2015$Data     1.636e-06  1.169e-06   1.400   0.1626
ConPov1$Data     -2.110e-06  5.846e-06  -0.361   0.7184
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.791 on 288 degrees of freedom
Multiple R-squared:  0.05047,	Adjusted R-squared:  0.0142 
F-statistic: 1.392 on 11 and 288 DF,  p-value: 0.1759"

detach()
attach(Graduation_Rate)
arr_varb <- (TimeFrame >= 2014)
Grad_Rate <- subset(Graduation_Rate, arr_varb)
detach(Graduation_Rate)
attach(Grad_Rate)
arr_varb1 <- (TimeFrame <= 2018)
Grad_Rate1 <- subset(Grad_Rate, arr_varb1)
detach(Grad_Rate)
attach(Grad_Rate1)

model_attempt7 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + MonthRent18$Data + 
                       UnER1$Data + Educ2013$Data + Educ2014$Data + Educ2015$Data + ConPov1$Data + Graduation_Rate$Data)
summary(model_attempt7)
"Call:
  lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + 
       MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + 
       MonthRent18$Data + UnER1$Data + Educ2013$Data + Educ2014$Data + 
       Educ2015$Data)

Residuals:
  Min      1Q  Median      3Q     Max 
-7.5136 -1.6990  0.1507  2.2378  5.3897 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)       8.084e+01  7.358e-01 109.866   <2e-16 ***
IDR2$Data         9.687e-04  1.090e-01   0.009   0.9929    
Poverty2$Data    -2.897e-06  1.401e-06  -2.068   0.0396 *  
MonthRent14$Data -5.841e-04  2.542e-04  -2.298   0.0223 *  
MonthRent15$Data  1.003e-03  5.091e-04   1.969   0.0499 *  
MonthRent16$Data -4.497e-04  2.977e-04  -1.510   0.1320    
MonthRent17$Data  1.708e-05  6.244e-05   0.273   0.7847    
MonthRent18$Data  3.216e-05  2.533e-05   1.269   0.2053    
UnER1$Data        1.268e+01  5.296e+00   2.395   0.0173 *  
Educ2013$Data     4.803e-05  6.772e-05   0.709   0.4787    
Educ2014$Data    -5.324e-05  6.695e-05  -0.795   0.4271    
Educ2015$Data     1.636e-06  1.169e-06   1.400   0.1626
ConPov1$Data     -2.110e-06  5.846e-06  -0.361   0.7184
Graduation_Rate$Data  1.330e-01  1.490e+00   0.089   0.9289
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.791 on 288 degrees of freedom
Multiple R-squared:  0.05047,	Adjusted R-squared:  0.0142 
F-statistic: 1.392 on 11 and 288 DF,  p-value: 0.1759"

Home Ownership:
detach()
attach(Home_Ownership)
idk_varb3 <- (TimeFrame >= 2014)
Home_Own <- subset(Home_Ownership, idk_varb3)
detach(Home_Ownership)
attach(Home_Own)
idk_varb4 <- (TimeFrame <= 2018)
Home_Own1 <- subset(Home_Own, idk_varb4)
detach(Home_Own)
attach(Home_Own1)

model_attempt8 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + MonthRent18$Data + 
                       UnER1$Data + Educ2013$Data + Educ2014$Data + Educ2015$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data)
summary(model_attempt8)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + 
    MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + 
    MonthRent18$Data + UnER1$Data + Educ2013$Data + Educ2014$Data + 
    Educ2015$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.3272 -1.6896  0.1828  2.1758  5.3604 

Coefficients:
                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)           8.005e+01  1.326e+00  60.359  < 2e-16 ***
IDR2$Data             3.168e-02  1.130e-01   0.280  0.77947    
Poverty2$Data        -2.957e-06  1.407e-06  -2.102  0.03647 *  
MonthRent14$Data     -5.614e-04  2.745e-04  -2.045  0.04179 *  
MonthRent15$Data      9.652e-04  5.475e-04   1.763  0.07899 .  
MonthRent16$Data     -4.406e-04  3.168e-04  -1.391  0.16535    
MonthRent17$Data      2.511e-05  6.306e-05   0.398  0.69078    
MonthRent18$Data      3.250e-05  2.558e-05   1.270  0.20501    
UnER1$Data            1.550e+01  5.747e+00   2.696  0.00743 ** 
Educ2013$Data         4.831e-05  6.821e-05   0.708  0.47940    
Educ2014$Data        -5.356e-05  6.733e-05  -0.795  0.42701    
Educ2015$Data         1.661e-06  1.173e-06   1.416  0.15787    
ConPov1$Data         -1.301e-06  5.886e-06  -0.221  0.82520    
Graduation_Rate$Data  6.912e-04  1.492e+00   0.000  0.99963    
Home_Own1$Data        1.251e+00  9.935e-01   1.260  0.20884    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.798 on 285 degrees of freedom
Multiple R-squared:  0.05618,	Adjusted R-squared:  0.009816 
F-statistic: 1.212 on 14 and 285 DF,  p-value: 0.2658"  
  
confint(model_attempt8)"
                             2.5 %        97.5 %
(Intercept)           7.744047e+01  8.266145e+01
IDR2$Data            -1.907876e-01  2.541420e-01
Poverty2$Data        -5.725512e-06 -1.875088e-07
MonthRent14$Data     -1.101749e-03 -2.101290e-05
MonthRent15$Data     -1.124696e-04  2.042827e-03
MonthRent16$Data     -1.064145e-03  1.829319e-04
MonthRent17$Data     -9.901460e-05  1.492373e-04
MonthRent18$Data     -1.785793e-05  8.285832e-05
UnER1$Data            4.183618e+00  2.680883e+01
Educ2013$Data        -8.595334e-05  1.825656e-04
Educ2014$Data        -1.860766e-04  7.896543e-05
Educ2015$Data        -6.479395e-07  3.970026e-06
ConPov1$Data         -1.288774e-05  1.028512e-05
Graduation_Rate$Data -2.936644e+00  2.938027e+00
Home_Own1$Data       -7.040811e-01  3.206802e+00"

detach()
attach(Household_Income)
idk_varb5 <- (TimeFrame >= 2014)
HH_Inc <- subset(Household_Income, idk_varb5)
detach(Household_Income)
attach(HH_Inc)
idk_varb6 <- (TimeFrame <= 2018) & (DataFormat == "Number")
HH_Inc1 <- subset(HH_Inc, idk_varb6)
detach(HH_Inc)
attach(HH_Inc1)
idk_varb7 <- (`Income Level` == "$100,000 to $199,999")
HH_Inc_100k <- subset(HH_Inc1, idk_varb7)
idk_varb8 <- (`Income Level` == "$15,000 to $24,999")
HH_Inc_15k <- subset(HH_Inc1, idk_varb8)
idk_varb9 <- (`Income Level` == "$200,000 or more")
HH_Inc_200k <- subset(HH_Inc1, idk_varb9)
idk_varb10 <- (`Income Level` == "$25,000 to $34,999")
HH_Inc_25k <- subset(HH_Inc1, idk_varb10)
idk_varb11 <- (`Income Level` == "$50,000 to $74,999")
HH_Inc_50k <- subset(HH_Inc1, idk_varb11)
idk_varb12 <- (`Income Level` == "$75,000 to $99,999")
HH_Inc_75k <- subset(HH_Inc1, idk_varb12)
idk_varb13 <- (`Income Level` == "Under $15,000")
HH_Inc_Under15k <- subset(HH_Inc1, idk_varb13)

model_attempt9 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + MonthRent18$Data + 
                       UnER1$Data + Educ2013$Data + Educ2014$Data + Educ2015$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                       HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data)
summary(model_attempt9)

"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MonthRent14$Data + 
    MonthRent15$Data + MonthRent16$Data + MonthRent17$Data + 
    MonthRent18$Data + UnER1$Data + Educ2013$Data + Educ2014$Data + 
    Educ2015$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-7.3941 -1.7231  0.1675  2.0648  5.8062 

Coefficients:
                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)           8.157e+01  1.558e+00  52.358   <2e-16 ***
IDR2$Data            -9.804e-02  1.792e-01  -0.547   0.5848    
Poverty2$Data        -3.034e-06  1.386e-06  -2.189   0.0294 *  
MonthRent14$Data     -6.700e-04  3.267e-04  -2.051   0.0413 *  
MonthRent15$Data      1.166e-03  6.072e-04   1.920   0.0559 .  
MonthRent16$Data     -5.869e-04  3.326e-04  -1.765   0.0787 .  
MonthRent17$Data      6.186e-05  6.401e-05   0.966   0.3347    
MonthRent18$Data     -1.991e-05  2.935e-05  -0.678   0.4981    
UnER1$Data            7.443e+00  6.081e+00   1.224   0.2220    
Educ2013$Data         6.564e-05  6.707e-05   0.979   0.3286    
Educ2014$Data        -6.450e-05  6.603e-05  -0.977   0.3295    
Educ2015$Data         1.013e-06  1.176e-06   0.861   0.3898    
ConPov1$Data          3.583e-06  1.414e-05   0.253   0.8001    
Graduation_Rate$Data  3.633e-02  1.470e+00   0.025   0.9803    
Home_Own1$Data        7.151e-01  1.100e+00   0.650   0.5161    
HH_Inc_100k$Data      8.451e-05  7.407e-05   1.141   0.2548    
HH_Inc_15k$Data      -1.219e-04  1.640e-04  -0.743   0.4580    
HH_Inc_200k$Data      9.663e-05  4.635e-05   2.085   0.0380 *  
HH_Inc_25k$Data       4.468e-04  1.893e-04   2.360   0.0190 *  
HH_Inc_50k$Data      -1.388e-04  1.370e-04  -1.014   0.3117    
HH_Inc_75k$Data      -2.534e-04  1.722e-04  -1.472   0.1422    
HH_Inc_Under15k$Data  1.883e-05  9.890e-05   0.190   0.8491
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.735 on 278 degrees of freedom
Multiple R-squared:   0.12,	Adjusted R-squared:  0.05355 
F-statistic: 1.806 on 21 and 278 DF,  p-value: 0.01803"

detach()
attach(Mon_rent2)
idk_varb14 <- (`Rent Level` == "Under $500")
MRent_500 <- subset(Mon_rent2, idk_varb14)
idk_varb15 <- (`Rent Level` == "$500 to $999")
MRent_999 <- subset(Mon_rent2, idk_varb15)
idk_varb16 <- (`Rent Level` == "$1,000 to $1,499")
MRent_1k <- subset(Mon_rent2, idk_varb16)
idk_varb17 <- (`Rent Level` == "$1,500 to $1,999")
MRent_1500k <- subset(Mon_rent2, idk_varb17)
idk_varb18 <- (`Rent Level` == "$2,000 or more")
MRent_2k <- subset(Mon_rent2, idk_varb18)


model_attempt10 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                       UnER1$Data + Educ2013$Data + Educ2014$Data + Educ2015$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                       HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data)
summary(model_attempt10)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ2013$Data + Educ2014$Data + Educ2015$Data + 
    ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + HH_Inc_100k$Data + 
    HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + 
    HH_Inc_75k$Data + HH_Inc_Under15k$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.5903 -1.4849  0.1641  1.8463  6.0964 

Coefficients:
                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)           8.078e+01  1.556e+00  51.929   <2e-16 ***
IDR2$Data            -5.773e-02  1.756e-01  -0.329   0.7425    
Poverty2$Data        -2.835e-06  1.280e-06  -2.216   0.0275 *  
MRent_500$Data       -2.226e-05  6.246e-05  -0.356   0.7219    
MRent_999$Data        6.248e-05  5.340e-05   1.170   0.2430    
MRent_1k$Data        -3.078e-05  5.397e-05  -0.570   0.5689    
MRent_1500k$Data     -5.020e-05  7.552e-05  -0.665   0.5068    
MRent_2k$Data         9.516e-05  2.886e-05   3.297   0.0011 ** 
UnER1$Data            1.204e+01  5.769e+00   2.087   0.0378 *  
Educ2013$Data         5.108e-05  6.527e-05   0.782   0.4346    
Educ2014$Data        -5.311e-05  6.431e-05  -0.826   0.4096    
Educ2015$Data         7.904e-07  1.119e-06   0.706   0.4807    
ConPov1$Data         -1.539e-05  1.301e-05  -1.183   0.2380    
Graduation_Rate$Data -2.138e-02  1.427e+00  -0.015   0.9881    
Home_Own1$Data        1.602e+00  1.076e+00   1.489   0.1376    
HH_Inc_100k$Data      2.442e-05  6.789e-05   0.360   0.7193    
HH_Inc_15k$Data       6.457e-06  1.399e-04   0.046   0.9632    
HH_Inc_200k$Data      5.898e-05  4.825e-05   1.222   0.2226    
HH_Inc_25k$Data       2.839e-04  1.569e-04   1.809   0.0715 .  
HH_Inc_50k$Data      -2.697e-04  1.125e-04  -2.398   0.0171 *  
HH_Inc_75k$Data       4.736e-05  1.183e-04   0.400   0.6891    
HH_Inc_Under15k$Data  3.234e-06  9.519e-05   0.034   0.9729    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.66 on 278 degrees of freedom
Multiple R-squared:  0.1675,	Adjusted R-squared:  0.1046 
F-statistic: 2.664 on 21 and 278 DF,  p-value: 0.0001529"


detach()
attach(Educational_Attainment)
idk_varb <- (TimeFrame >= 2014)
Educ <- subset(Educational_Attainment, idk_varb)
detach(Educational_Attainment)
attach(Educ)
idk_varb1 <- (TimeFrame <= 2018)
Educ1 <- subset(Educ, idk_varb1)
detach(Educ)
attach(Educ1)
idk_varb2 <- (DataFormat == "Number")
Educ2 <- subset(Educ1, idk_varb2)
detach(Educ1)
attach(Educ2)
lol_varb <- (`Education Level` == "Less than High School Degree")
Educ_nohs <- subset(Educ2, lol_varb)
lol_varb1 <- (`Education Level` == "High School Degree")
Educ_HS <- subset(Educ2, lol_varb1)
lol_varb2 <- (`Education Level` == "Some College")
Educ_SC <- subset(Educ2, lol_varb2)
lol_varb3 <- (`Education Level` == "Associate's Degree")
Educ_AD <- subset(Educ2, lol_varb3)
lol_varb4 <- (`Education Level` == "Bachelor's Degree or Higher")
Educ_BD <- subset(Educ2, lol_varb4)

model_attempt10 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data)
summary(model_attempt10)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.8715 -1.6899  0.1618  1.8098  6.0405 

Coefficients:
                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)           8.189e+01  1.568e+00  52.213  < 2e-16 ***
IDR2$Data            -1.837e-01  1.673e-01  -1.097  0.27338    
Poverty2$Data        -8.041e-07  1.448e-06  -0.555  0.57906    
MRent_500$Data       -4.270e-05  6.132e-05  -0.696  0.48678    
MRent_999$Data        9.377e-05  5.094e-05   1.841  0.06669 .  
MRent_1k$Data        -5.898e-05  5.371e-05  -1.098  0.27307    
MRent_1500k$Data     -2.075e-05  7.716e-05  -0.269  0.78822    
MRent_2k$Data         8.169e-05  2.902e-05   2.816  0.00522 ** 
UnER1$Data            1.041e+01  5.961e+00   1.746  0.08196 .  
Educ_nohs$Data       -2.208e-05  1.847e-05  -1.196  0.23289    
Educ_SC$Data          5.090e-05  4.134e-05   1.231  0.21922    
Educ_AD$Data         -2.038e-05  8.696e-05  -0.234  0.81485    
Educ_BD$Data         -6.576e-06  6.004e-06  -1.095  0.27430    
ConPov1$Data         -2.378e-05  1.288e-05  -1.846  0.06600 .  
Graduation_Rate$Data -2.860e-01  1.436e+00  -0.199  0.84226    
Home_Own1$Data        1.518e+00  1.086e+00   1.397  0.16355    
HH_Inc_100k$Data     -2.156e-05  7.126e-05  -0.303  0.76242    
HH_Inc_15k$Data       7.519e-07  1.361e-04   0.006  0.99560    
HH_Inc_200k$Data      8.898e-05  5.280e-05   1.685  0.09311 .  
HH_Inc_25k$Data       2.408e-04  1.564e-04   1.540  0.12469    
HH_Inc_50k$Data      -3.090e-04  1.163e-04  -2.656  0.00836 ** 
HH_Inc_75k$Data       1.075e-04  1.326e-04   0.811  0.41800    
HH_Inc_Under15k$Data  8.432e-05  8.458e-05   0.997  0.31969    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.652 on 277 degrees of freedom
Multiple R-squared:  0.1755,	Adjusted R-squared:   0.11 
F-statistic: 2.681 on 22 and 277 DF,  p-value: 0.0001059"

Households with no internet access. Internet access includes dial-up, broadband, and cellular data plans.&nbsp;

detach()
attach(Household_Internet_Access_)
used_varb <- (TimeFrame >= 2015)
Internet_Access <- subset(Household_Internet_Access_, used_varb)
detach(Household_Internet_Access_)
attach(Internet_Access)
used_varb1 <- (TimeFrame <= 2019) & (DataFormat == "Number")
Internet_Access1 <- subset(Internet_Access, used_varb1)
detach(Internet_Access)
attach(Internet_Access1)

model_attempt11 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data)
summary(model_attempt11)
"Call:
  lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
       MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
       UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
       Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
       HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
       HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
       Internet_Access1$Data)

Residuals:
  Min      1Q  Median      3Q     Max 
-6.7942 -1.6365  0.1591  1.8140  6.0404 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)            8.182e+01  1.590e+00  51.450  < 2e-16 ***
  IDR2$Data             -1.733e-01  1.728e-01  -1.003  0.31663    
Poverty2$Data         -7.682e-07  1.458e-06  -0.527  0.59859    
MRent_500$Data        -4.713e-05  6.397e-05  -0.737  0.46190    
MRent_999$Data         1.085e-04  7.828e-05   1.386  0.16689    
MRent_1k$Data         -6.371e-05  5.709e-05  -1.116  0.26536    
MRent_1500k$Data      -1.735e-05  7.850e-05  -0.221  0.82527    
MRent_2k$Data          8.045e-05  2.950e-05   2.727  0.00679 ** 
  UnER1$Data             1.019e+01  6.034e+00   1.689  0.09234 .  
Educ_nohs$Data        -2.163e-05  1.859e-05  -1.164  0.24556    
Educ_SC$Data           4.969e-05  4.169e-05   1.192  0.23430    
Educ_AD$Data          -1.822e-05  8.754e-05  -0.208  0.83525    
Educ_BD$Data          -6.717e-06  6.041e-06  -1.112  0.26709    
ConPov1$Data          -2.319e-05  1.312e-05  -1.768  0.07810 .  
Graduation_Rate$Data  -2.944e-01  1.439e+00  -0.205  0.83801    
Home_Own1$Data         1.575e+00  1.112e+00   1.416  0.15800    
HH_Inc_100k$Data      -2.103e-05  7.141e-05  -0.294  0.76860    
HH_Inc_15k$Data       -7.088e-06  1.400e-04  -0.051  0.95964    
HH_Inc_200k$Data       8.810e-05  5.301e-05   1.662  0.09765 .  
HH_Inc_25k$Data        2.563e-04  1.686e-04   1.520  0.12967    
HH_Inc_50k$Data       -3.109e-04  1.168e-04  -2.662  0.00821 ** 
HH_Inc_75k$Data        1.148e-04  1.360e-04   0.844  0.39932    
HH_Inc_Under15k$Data   8.080e-05  8.591e-05   0.941  0.34773    
Internet_Access1$Data -9.802e-06  3.954e-05  -0.248  0.80441    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.657 on 276 degrees of freedom
Multiple R-squared:  0.1757,	Adjusted R-squared:  0.107 
F-statistic: 2.558 on 23 and 276 DF,  p-value: 0.0001763"

detach()
attach(Poor_Population_Living_in_Concentrated_Poverty)
idkk_varb <- (TimeFrame >= 2014)
PPLCV <- subset(Poor_Population_Living_in_Concentrated_Poverty, idkk_varb)
detach(Poor_Population_Living_in_Concentrated_Poverty)
attach(PPLCV)
idkk_varb1 <- (TimeFrame <= 2018) & (DataFormat == "Number")
PPLCV1 <- subset(PPLCV, idkk_varb1)
detach(PPLCV)
attach(PPLCV1)

model_attempt12 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data)
summary(model_attempt12)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
    Internet_Access1$Data + PPLCV1$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.8145 -1.6191  0.1403  1.8478  5.9431 

Coefficients:
                        Estimate Std. Error t value Pr(>|t|)    
(Intercept)            8.179e+01  1.591e+00  51.403  < 2e-16 ***
IDR2$Data             -1.650e-01  1.730e-01  -0.954  0.34090    
Poverty2$Data         -6.773e-07  1.461e-06  -0.464  0.64326    
MRent_500$Data        -3.351e-05  6.553e-05  -0.511  0.60955    
MRent_999$Data         9.295e-05  7.995e-05   1.163  0.24603    
MRent_1k$Data         -5.498e-05  5.782e-05  -0.951  0.34252    
MRent_1500k$Data      -2.212e-05  7.867e-05  -0.281  0.77880    
MRent_2k$Data          8.545e-05  2.996e-05   2.852  0.00467 ** 
UnER1$Data             1.051e+01  6.044e+00   1.739  0.08323 .  
Educ_nohs$Data        -2.034e-05  1.864e-05  -1.091  0.27608    
Educ_SC$Data           4.551e-05  4.193e-05   1.085  0.27867    
Educ_AD$Data          -1.639e-05  8.758e-05  -0.187  0.85167    
Educ_BD$Data          -6.168e-06  6.069e-06  -1.016  0.31037    
ConPov1$Data          -1.463e-04  1.291e-04  -1.134  0.25797    
Graduation_Rate$Data  -3.128e-01  1.439e+00  -0.217  0.82808    
Home_Own1$Data         1.491e+00  1.116e+00   1.336  0.18270    
HH_Inc_100k$Data      -2.295e-05  7.145e-05  -0.321  0.74828    
HH_Inc_15k$Data       -9.298e-06  1.400e-04  -0.066  0.94709    
HH_Inc_200k$Data       8.717e-05  5.303e-05   1.644  0.10136    
HH_Inc_25k$Data        2.755e-04  1.698e-04   1.622  0.10586    
HH_Inc_50k$Data       -3.103e-04  1.168e-04  -2.657  0.00835 ** 
HH_Inc_75k$Data        1.154e-04  1.360e-04   0.848  0.39705    
HH_Inc_Under15k$Data   6.606e-05  8.728e-05   0.757  0.44977    
Internet_Access1$Data -5.278e-06  3.983e-05  -0.133  0.89467    
PPLCV1$Data            2.590e-04  2.701e-04   0.959  0.33847    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.657 on 275 degrees of freedom
Multiple R-squared:  0.1785,	Adjusted R-squared:  0.1068 
F-statistic: 2.489 on 24 and 275 DF,  p-value: 0.0002173"

detach()
attach(Public_Assistance)
tired_varb <- (TimeFrame >= 2007)
Pub_Assist <- subset(Public_Assistance, tired_varb)
detach(Public_Assistance)
attach(Pub_Assist)
tired_varb1 <- (TimeFrame <= 2017) & (DataFormat == "Percent")
Pub_Assist1 <- subset(Pub_Assist, tired_varb1)
detach(Pub_Assist)
attach(Pub_Assist1)

model_attempt13 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data)
summary(model_attempt13)
"Pub_Assist1$Data      -1.317e+00  5.617e+00  -0.235  0.81475"

16 17 18 19 20
Description,Recipients of SNAP by individuals and households.&nbsp;SNAP (Supplemental Nutrition Assistance Program) is a federal program that offers nutrition assistance to low-income individuals and families.
detach()
attach(SNAP_Food_Stamps_)
tired_varb_1 <- (TimeFrame >= 2016)
Snap <- subset(SNAP_Food_Stamps_, tired_varb_1)
detach(SNAP_Food_Stamps_)
attach(Snap)
tired_varb_2 <- (TimeFrame <= 2020) & (DataFormat == "Number")
Snap1 <- subset(Snap, tired_varb_2)
detach(Snap)
attach(Snap1)
something_varb <- (Recipient == "Individuals")
Snap_Ind <- subset(Snap1, something_varb)
something_varb1 <- (Recipient == "Households")
Snap_HH <- subset(Snap1, something_varb1)

model_attempt14 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + Snap_Ind$Data + Snap_HH$Data)
summary(model_attempt14)
"
Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
    Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + 
    Snap_Ind$Data + Snap_HH$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.5136 -1.7072  0.1008  1.8144  5.9371 

Coefficients:
                        Estimate Std. Error t value Pr(>|t|)    
(Intercept)            8.161e+01  1.653e+00  49.366  < 2e-16 ***
IDR2$Data             -1.276e-01  1.774e-01  -0.719  0.47247    
Poverty2$Data         -3.749e-07  1.482e-06  -0.253  0.80046    
MRent_500$Data        -1.177e-05  6.838e-05  -0.172  0.86343    
MRent_999$Data         6.960e-05  8.305e-05   0.838  0.40275    
MRent_1k$Data         -4.371e-05  5.912e-05  -0.739  0.46033    
MRent_1500k$Data      -1.285e-05  7.962e-05  -0.161  0.87189    
MRent_2k$Data          8.512e-05  3.039e-05   2.801  0.00546 ** 
UnER1$Data             1.020e+01  6.139e+00   1.661  0.09793 .  
Educ_nohs$Data        -2.289e-05  1.879e-05  -1.218  0.22427    
Educ_SC$Data           4.614e-05  4.204e-05   1.097  0.27345    
Educ_AD$Data          -1.555e-05  8.787e-05  -0.177  0.85965    
Educ_BD$Data          -5.564e-06  6.201e-06  -0.897  0.37031    
ConPov1$Data          -1.358e-04  1.299e-04  -1.046  0.29669    
Graduation_Rate$Data  -3.908e-01  1.444e+00  -0.271  0.78689    
Home_Own1$Data         1.437e+00  1.125e+00   1.278  0.20241    
HH_Inc_100k$Data      -2.476e-05  7.228e-05  -0.343  0.73217    
HH_Inc_15k$Data       -7.919e-06  1.456e-04  -0.054  0.95665    
HH_Inc_200k$Data       9.048e-05  5.370e-05   1.685  0.09314 .  
HH_Inc_25k$Data        3.145e-04  1.732e-04   1.816  0.07053 .  
HH_Inc_50k$Data       -3.239e-04  1.190e-04  -2.722  0.00692 ** 
HH_Inc_75k$Data        1.465e-04  1.418e-04   1.033  0.30263    
HH_Inc_Under15k$Data   6.559e-05  9.156e-05   0.716  0.47441    
Internet_Access1$Data -5.081e-07  4.010e-05  -0.013  0.98990    
PPLCV1$Data            2.371e-04  2.725e-04   0.870  0.38496    
Pub_Assist1$Data       7.809e-01  6.039e+00   0.129  0.89722    
Snap_Ind$Data          3.033e-05  3.368e-05   0.901  0.36860    
Snap_HH$Data          -7.643e-05  6.528e-05  -1.171  0.24272    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.662 on 272 degrees of freedom
Multiple R-squared:  0.1842,	Adjusted R-squared:  0.1032 
F-statistic: 2.274 on 27 and 272 DF,  p-value: 0.0005021"

#Unbanked Households: 
The share of households without a checking or savings account. 

model_attempt15 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data)
summary(model_attempt15)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
    Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + 
    Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.5032 -1.6974  0.1144  1.8312  5.9465 

Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)               8.150e+01  1.791e+00  45.497  < 2e-16 ***
IDR2$Data                -1.219e-01  1.808e-01  -0.674  0.50076    
Poverty2$Data            -3.916e-07  1.488e-06  -0.263  0.79261    
MRent_500$Data           -1.264e-05  6.869e-05  -0.184  0.85409    
MRent_999$Data            7.047e-05  8.336e-05   0.845  0.39865    
MRent_1k$Data            -4.344e-05  5.925e-05  -0.733  0.46405    
MRent_1500k$Data         -1.317e-05  7.978e-05  -0.165  0.86906    
MRent_2k$Data             8.424e-05  3.089e-05   2.727  0.00680 ** 
UnER1$Data                1.015e+01  6.155e+00   1.649  0.10022    
Educ_nohs$Data           -2.311e-05  1.887e-05  -1.225  0.22179    
Educ_SC$Data              4.634e-05  4.214e-05   1.100  0.27237    
Educ_AD$Data             -1.487e-05  8.812e-05  -0.169  0.86609    
Educ_BD$Data             -5.628e-06  6.223e-06  -0.904  0.36660    
ConPov1$Data             -1.351e-04  1.302e-04  -1.037  0.30061    
Graduation_Rate$Data     -3.717e-01  1.451e+00  -0.256  0.79802    
Home_Own1$Data            1.470e+00  1.143e+00   1.286  0.19968    
HH_Inc_100k$Data         -2.407e-05  7.253e-05  -0.332  0.74023    
HH_Inc_15k$Data          -1.012e-06  1.515e-04  -0.007  0.99467    
HH_Inc_200k$Data          9.195e-05  5.450e-05   1.687  0.09271 .  
HH_Inc_25k$Data           3.128e-04  1.738e-04   1.799  0.07305 .  
HH_Inc_50k$Data          -3.230e-04  1.193e-04  -2.707  0.00723 ** 
HH_Inc_75k$Data           1.473e-04  1.422e-04   1.036  0.30121    
HH_Inc_Under15k$Data      6.055e-05  9.646e-05   0.628  0.53076    
Internet_Access1$Data    -5.079e-07  4.017e-05  -0.013  0.98992    
PPLCV1$Data               2.342e-04  2.735e-04   0.856  0.39262    
Pub_Assist1$Data          3.686e-01  6.525e+00   0.056  0.95499    
Snap_Ind$Data             3.127e-05  3.420e-05   0.914  0.36128    
Snap_HH$Data             -7.838e-05  6.641e-05  -1.180  0.23896    
Unbanked_Households$Data  6.350e-01  3.763e+00   0.169  0.86612    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.667 on 271 degrees of freedom
Multiple R-squared:  0.1843,	Adjusted R-squared:  0.09997 
F-statistic: 2.186 on 28 and 271 DF,  p-value: 0.0007789"

detach()
attach(Uninsured)
something_varb2 <- (TimeFrame >= 2014)
Uninsured1 <- subset(Uninsured, something_varb2)
detach(Uninsured)
attach(Uninsured1)
something_varb3 <- (TimeFrame <= 2018) & (DataFormat == "Percent")
Uninsured2 <- subset(Uninsured1, something_varb3)
detach(Uninsured1)
attach(Uninsured2)
something_varb4 <- (`Age Group` == "Adults 19 Years and Older")
Uninsured_Adults <- subset(Uninsured2, something_varb4)
something_varb5 <- (`Age Group` == "All Ages")
Uninsured_All <- subset(Uninsured2, something_varb5)
something_varb6 <- (`Age Group` == "Children Under 19 Years")
Uninsured_Child <- subset(Uninsured2, something_varb6)

model_attempt16 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + Uninsured_Adults$Data + 
                        Uninsured_All$Data + Uninsured_Child$Data)
summary(model_attempt16)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
    Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + 
    Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + 
    Uninsured_Adults$Data + Uninsured_All$Data + Uninsured_Child$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.7868 -1.5941  0.1101  1.8080  6.0259 

Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)               8.132e+01  1.866e+00  43.571   <2e-16 ***
IDR2$Data                -3.110e-02  1.916e-01  -0.162   0.8712    
Poverty2$Data            -1.831e-07  1.496e-06  -0.122   0.9027    
MRent_500$Data           -9.923e-06  6.891e-05  -0.144   0.8856    
MRent_999$Data            7.085e-05  8.406e-05   0.843   0.4001    
MRent_1k$Data            -5.134e-05  5.957e-05  -0.862   0.3895    
MRent_1500k$Data         -3.342e-06  8.092e-05  -0.041   0.9671    
MRent_2k$Data             8.066e-05  3.113e-05   2.591   0.0101 *  
UnER1$Data                1.196e+01  6.246e+00   1.915   0.0566 .  
Educ_nohs$Data           -1.798e-05  1.911e-05  -0.941   0.3475    
Educ_SC$Data              2.858e-05  4.362e-05   0.655   0.5129    
Educ_AD$Data              7.870e-07  8.902e-05   0.009   0.9930    
Educ_BD$Data             -4.356e-06  6.269e-06  -0.695   0.4877    
ConPov1$Data             -1.607e-04  1.320e-04  -1.218   0.2244    
Graduation_Rate$Data     -5.287e-01  1.458e+00  -0.363   0.7171    
Home_Own1$Data            1.558e+00  1.148e+00   1.357   0.1759    
HH_Inc_100k$Data         -2.888e-05  7.321e-05  -0.394   0.6936    
HH_Inc_15k$Data           1.281e-05  1.541e-04   0.083   0.9338    
HH_Inc_200k$Data          7.917e-05  5.537e-05   1.430   0.1539    
HH_Inc_25k$Data           3.541e-04  1.786e-04   1.982   0.0485 *  
HH_Inc_50k$Data          -2.908e-04  1.207e-04  -2.410   0.0166 *  
HH_Inc_75k$Data           1.473e-04  1.422e-04   1.036   0.3013    
HH_Inc_Under15k$Data      3.397e-05  1.013e-04   0.335   0.7377    
Internet_Access1$Data    -2.336e-06  4.028e-05  -0.058   0.9538    
PPLCV1$Data               2.636e-04  2.755e-04   0.957   0.3395    
Pub_Assist1$Data         -1.755e+00  6.621e+00  -0.265   0.7912    
Snap_Ind$Data             2.819e-05  3.439e-05   0.820   0.4130    
Snap_HH$Data             -7.064e-05  6.718e-05  -1.051   0.2940    
Unbanked_Households$Data  2.123e+00  4.651e+00   0.456   0.6484    
Uninsured_Adults$Data     6.102e+01  4.648e+01   1.313   0.1903    
Uninsured_All$Data       -8.557e+01  5.900e+01  -1.450   0.1482    
Uninsured_Child$Data      1.875e+01  1.565e+01   1.198   0.2320    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.665 on 268 degrees of freedom
Multiple R-squared:  0.1945,	Adjusted R-squared:  0.1013 
F-statistic: 2.087 on 31 and 268 DF,  p-value: 0.001025"

detach()
attach(Arrests)
some_varb <- (`Offense Type` == "Violent Felonies")
Arrest_VF <- subset(Arrests, some_varb)
some_varb1 <- (`Offense Type` == "Non-Violent Felonies")
Arrest_NVF <- subset(Arrests, some_varb1)
some_varb2 <- (`Offense Type` == "Misdemeanors")
Arrest_M <- subset(Arrests, some_varb2)

model_attempt17 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + Uninsured_Adults$Data + 
                        Uninsured_All$Data + Uninsured_Child$Data + Arrest_VF$Data + Arrest_NVF$Data + Arrest_M$Data)
summary(model_attempt17)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
    Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + 
    Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + 
    Uninsured_Adults$Data + Uninsured_All$Data + Uninsured_Child$Data + 
    Arrest_VF$Data + Arrest_NVF$Data + Arrest_M$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.9221 -1.6193  0.0778  1.7566  5.8417 

Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)               8.053e+01  1.919e+00  41.957   <2e-16 ***
IDR2$Data                -1.905e-02  1.902e-01  -0.100   0.9203    
Poverty2$Data            -4.812e-07  1.488e-06  -0.323   0.7466    
MRent_500$Data           -2.077e-05  6.864e-05  -0.303   0.7625    
MRent_999$Data            8.367e-05  8.435e-05   0.992   0.3221    
MRent_1k$Data            -5.359e-05  5.950e-05  -0.901   0.3686    
MRent_1500k$Data         -2.090e-06  8.085e-05  -0.026   0.9794    
MRent_2k$Data             7.593e-05  3.118e-05   2.435   0.0155 *  
UnER1$Data                1.179e+01  6.325e+00   1.865   0.0633 .  
Educ_nohs$Data           -2.240e-05  1.904e-05  -1.176   0.2406    
Educ_SC$Data              3.573e-05  4.351e-05   0.821   0.4123    
Educ_AD$Data              8.820e-06  8.972e-05   0.098   0.9218    
Educ_BD$Data             -5.803e-06  6.368e-06  -0.911   0.3629    
ConPov1$Data             -1.352e-04  1.319e-04  -1.025   0.3062    
Graduation_Rate$Data     -6.132e-01  1.447e+00  -0.424   0.6721    
Home_Own1$Data            1.578e+00  1.147e+00   1.376   0.1701    
HH_Inc_100k$Data         -2.476e-05  7.276e-05  -0.340   0.7339    
HH_Inc_15k$Data           1.104e-05  1.531e-04   0.072   0.9425    
HH_Inc_200k$Data          7.946e-05  5.521e-05   1.439   0.1513    
HH_Inc_25k$Data           3.385e-04  1.783e-04   1.898   0.0588 .  
HH_Inc_50k$Data          -2.837e-04  1.197e-04  -2.370   0.0185 *  
HH_Inc_75k$Data           1.400e-04  1.419e-04   0.987   0.3247    
HH_Inc_Under15k$Data      3.713e-05  1.005e-04   0.369   0.7121    
Internet_Access1$Data    -7.804e-06  4.019e-05  -0.194   0.8462    
PPLCV1$Data               2.121e-04  2.752e-04   0.771   0.4415    
Pub_Assist1$Data         -2.968e+00  6.630e+00  -0.448   0.6548    
Snap_Ind$Data             1.557e-05  3.463e-05   0.450   0.6533    
Snap_HH$Data             -4.767e-05  6.727e-05  -0.709   0.4792    
Unbanked_Households$Data  1.829e+00  4.666e+00   0.392   0.6953    
Uninsured_Adults$Data     7.814e+01  4.691e+01   1.666   0.0969 .  
Uninsured_All$Data       -1.056e+02  5.945e+01  -1.777   0.0768 .  
Uninsured_Child$Data      2.315e+01  1.564e+01   1.480   0.1400    
Arrest_VF$Data           -2.240e-04  1.553e-03  -0.144   0.8854    
Arrest_NVF$Data           4.188e-04  2.859e-04   1.465   0.1442    
Arrest_M$Data            -2.543e-06  1.579e-04  -0.016   0.9872    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.642 on 265 degrees of freedom
Multiple R-squared:  0.2171,	Adjusted R-squared:  0.1167 
F-statistic: 2.162 on 34 and 265 DF,  p-value: 0.0003944"

Child Abuse and Neglect Investigations: Consolidated investigations

detach()
attach(Child_Abuse_and_Neglect_Investigations)
some_varb3 <- (TimeFrame >= 2014)
CANI <- subset(Child_Abuse_and_Neglect_Investigations, some_varb3)
detach(Child_Abuse_and_Neglect_Investigations)
attach(CANI)
some_varb4 <- (TimeFrame <= 2018)
CANI1 <- subset(CANI, some_varb4)
detach(CANI)
attach(CANI1)

model_attempt18 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + Uninsured_Adults$Data + 
                        Uninsured_All$Data + Uninsured_Child$Data + Arrest_VF$Data + Arrest_NVF$Data + Arrest_M$Data + CANI1$Data)
summary(model_attempt18)
"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
    Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + 
    Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + 
    Uninsured_Adults$Data + Uninsured_All$Data + Uninsured_Child$Data + 
    Arrest_VF$Data + Arrest_NVF$Data + Arrest_M$Data + CANI1$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.7818 -1.6583  0.0346  1.7779  6.2138 

Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)               7.982e+01  1.952e+00  40.903  < 2e-16 ***
IDR2$Data                -3.119e-02  1.895e-01  -0.165  0.86941    
Poverty2$Data            -1.693e-07  1.492e-06  -0.113  0.90973    
MRent_500$Data            1.096e-05  7.064e-05   0.155  0.87683    
MRent_999$Data            3.836e-05  8.775e-05   0.437  0.66233    
MRent_1k$Data            -2.501e-05  6.138e-05  -0.407  0.68400    
MRent_1500k$Data         -1.382e-05  8.079e-05  -0.171  0.86428    
MRent_2k$Data             8.547e-05  3.151e-05   2.713  0.00712 ** 
UnER1$Data                1.052e+01  6.340e+00   1.659  0.09836 .  
Educ_nohs$Data           -2.175e-05  1.897e-05  -1.147  0.25262    
Educ_SC$Data              3.840e-05  4.336e-05   0.886  0.37666    
Educ_AD$Data              1.756e-05  8.949e-05   0.196  0.84461    
Educ_BD$Data             -8.521e-06  6.522e-06  -1.307  0.19252    
ConPov1$Data             -1.021e-04  1.327e-04  -0.769  0.44231    
Graduation_Rate$Data     -2.597e-01  1.455e+00  -0.179  0.85842    
Home_Own1$Data            1.691e+00  1.144e+00   1.479  0.14045    
HH_Inc_100k$Data          6.036e-06  7.449e-05   0.081  0.93548    
HH_Inc_15k$Data          -9.087e-05  1.628e-04  -0.558  0.57716    
HH_Inc_200k$Data          5.685e-05  5.643e-05   1.007  0.31465    
HH_Inc_25k$Data           3.479e-04  1.777e-04   1.958  0.05130 .  
HH_Inc_50k$Data          -2.424e-04  1.215e-04  -1.996  0.04701 *  
HH_Inc_75k$Data           1.570e-04  1.416e-04   1.109  0.26858    
HH_Inc_Under15k$Data      1.015e-04  1.064e-04   0.954  0.34100    
Internet_Access1$Data     2.268e-06  4.042e-05   0.056  0.95530    
PPLCV1$Data               1.402e-04  2.770e-04   0.506  0.61328    
Pub_Assist1$Data         -1.460e-01  6.790e+00  -0.022  0.98286    
Snap_Ind$Data             1.680e-05  3.449e-05   0.487  0.62652    
Snap_HH$Data             -4.433e-05  6.702e-05  -0.661  0.50892    
Unbanked_Households$Data  5.264e+00  5.029e+00   1.047  0.29626    
Uninsured_Adults$Data     1.009e+02  4.842e+01   2.083  0.03820 *  
Uninsured_All$Data       -1.354e+02  6.152e+01  -2.201  0.02858 *  
Uninsured_Child$Data      2.871e+01  1.589e+01   1.807  0.07185 .  
Arrest_VF$Data           -9.354e-05  1.549e-03  -0.060  0.95189    
Arrest_NVF$Data           4.023e-04  2.849e-04   1.412  0.15915    
Arrest_M$Data            -5.518e-06  1.572e-04  -0.035  0.97203    
CANI1$Data               -9.960e-04  5.580e-04  -1.785  0.07544 .  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.631 on 264 degrees of freedom
Multiple R-squared:  0.2265,	Adjusted R-squared:  0.1239 
F-statistic: 2.208 on 35 and 264 DF,  p-value: 0.0002376"

teen unemployment: Teens 16 to 19 years actively seeking employment who are unemployed.

detach()
attach(Teen_Unemployment_16_to_19_Years_)
some_varb5 <- (TimeFrame >= 2014)
Unemploy_Teen <- subset(Teen_Unemployment_16_to_19_Years_, some_varb5)
detach(Teen_Unemployment_16_to_19_Years_)
attach(Unemploy_Teen)
some_varb6 <- (TimeFrame <= 2018)
Unemploy_Teen1 <- subset(Unemploy_Teen, some_varb6)
detach(Unemploy_Teen)
attach(Unemploy_Teen1)

model_attempt19 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + Uninsured_Adults$Data + 
                        Uninsured_All$Data + Uninsured_Child$Data + Arrest_VF$Data + Arrest_NVF$Data + Arrest_M$Data + CANI1$Data + Unemploy_Teen1$Data)
summary(model_attempt19)
"Unemploy_Teen1$Data      -1.636e+00  1.306e+00  -1.253  0.21140"

Youth Unemployment: Youth 20 to 24 years who are without a job and were actively seeking employment within the last four weeks.
detach()
attach(Youth_Unemployment_20_to_24_Years_)
some_varb7 <- (TimeFrame >= 2014)
Unemploy_Youth <- subset(Youth_Unemployment_20_to_24_Years_, some_varb7)
detach(Youth_Unemployment_20_to_24_Years_)
attach(Unemploy_Youth)
some_varb8 <- (TimeFrame <= 2018)
Unemploy_Youth1 <- subset(Unemploy_Youth, some_varb8)
detach(Unemploy_Youth)
attach(Unemploy_Youth1)

model_attempt20 <- lm(LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
                        UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
                        HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data 
                      + Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + Uninsured_Adults$Data + 
                        Uninsured_All$Data + Uninsured_Child$Data + Arrest_VF$Data + Arrest_NVF$Data + Arrest_M$Data + CANI1$Data + Unemploy_Teen1$Data + 
                        Unemploy_Youth1$Data)
summary(model_attempt20)
Unemploy_Youth1$Data     -5.796e+00  3.571e+00  -1.623   0.1058

#Attempting Plots

plot(x=Life_Expectancy_Attempt$Data, y=MonthlyRent2kAttempt$Data)
^not very helpful in explaining anything
plot(x=LifeExpect1$Data, y=Poverty2$Data)


"Call:
lm(formula = LifeExpect1$Data ~ IDR2$Data + Poverty2$Data + MRent_500$Data + 
    MRent_999$Data + MRent_1k$Data + MRent_1500k$Data + MRent_2k$Data + 
    UnER1$Data + Educ_nohs$Data + Educ_SC$Data + Educ_AD$Data + 
    Educ_BD$Data + ConPov1$Data + Graduation_Rate$Data + Home_Own1$Data + 
    HH_Inc_100k$Data + HH_Inc_15k$Data + HH_Inc_200k$Data + HH_Inc_25k$Data + 
    HH_Inc_50k$Data + HH_Inc_75k$Data + HH_Inc_Under15k$Data + 
    Internet_Access1$Data + PPLCV1$Data + Pub_Assist1$Data + 
    Snap_Ind$Data + Snap_HH$Data + Unbanked_Households$Data + 
    Uninsured_Adults$Data + Uninsured_All$Data + Uninsured_Child$Data + 
    Arrest_VF$Data + Arrest_NVF$Data + Arrest_M$Data + CANI1$Data + 
    Unemploy_Teen1$Data + Unemploy_Youth1$Data)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.9731 -1.6366  0.0211  1.7653  6.0471 

Coefficients:
                           Estimate Std. Error t value Pr(>|t|)    
(Intercept)               8.146e+01  2.105e+00  38.691   <2e-16 ***
IDR2$Data                -7.624e-02  1.943e-01  -0.392   0.6950    
Poverty2$Data             1.061e-08  1.488e-06   0.007   0.9943    
MRent_500$Data            2.292e-05  7.066e-05   0.324   0.7459    
MRent_999$Data            4.249e-05  8.833e-05   0.481   0.6309    
MRent_1k$Data            -2.314e-05  6.124e-05  -0.378   0.7059    
MRent_1500k$Data         -2.528e-05  8.074e-05  -0.313   0.7544    
MRent_2k$Data             9.074e-05  3.166e-05   2.866   0.0045 ** 
UnER1$Data                1.152e+01  6.344e+00   1.816   0.0706 .  
Educ_nohs$Data           -2.477e-05  1.897e-05  -1.305   0.1929    
Educ_SC$Data              3.488e-05  4.324e-05   0.807   0.4206    
Educ_AD$Data              1.472e-05  8.919e-05   0.165   0.8690    
Educ_BD$Data             -5.331e-06  6.706e-06  -0.795   0.4274    
ConPov1$Data             -1.087e-04  1.322e-04  -0.822   0.4118    
Graduation_Rate$Data     -4.946e-01  1.458e+00  -0.339   0.7346    
Home_Own1$Data            1.739e+00  1.139e+00   1.526   0.1282    
HH_Inc_100k$Data          1.923e-05  7.472e-05   0.257   0.7971    
HH_Inc_15k$Data          -9.868e-05  1.622e-04  -0.608   0.5435    
HH_Inc_200k$Data          3.123e-05  5.834e-05   0.535   0.5929    
HH_Inc_25k$Data           3.430e-04  1.770e-04   1.938   0.0537 .  
HH_Inc_50k$Data          -2.566e-04  1.212e-04  -2.118   0.0351 *  
HH_Inc_75k$Data           1.470e-04  1.412e-04   1.042   0.2985    
HH_Inc_Under15k$Data      1.168e-04  1.070e-04   1.092   0.2758    
Internet_Access1$Data     2.241e-06  4.067e-05   0.055   0.9561    
PPLCV1$Data               1.483e-04  2.760e-04   0.537   0.5915    
Pub_Assist1$Data         -2.419e+00  6.880e+00  -0.352   0.7254    
Snap_Ind$Data             8.170e-06  3.466e-05   0.236   0.8139    
Snap_HH$Data             -3.004e-05  6.729e-05  -0.446   0.6557    
Unbanked_Households$Data  8.462e+00  5.333e+00   1.587   0.1138    
Uninsured_Adults$Data     1.025e+02  4.825e+01   2.124   0.0346 *  
Uninsured_All$Data       -1.397e+02  6.131e+01  -2.279   0.0235 *  
Uninsured_Child$Data      3.063e+01  1.586e+01   1.932   0.0545 .  
Arrest_VF$Data           -1.067e-04  1.544e-03  -0.069   0.9450    
Arrest_NVF$Data           3.330e-04  2.857e-04   1.165   0.2449    
Arrest_M$Data             1.880e-05  1.570e-04   0.120   0.9048    
CANI1$Data               -9.257e-04  5.647e-04  -1.639   0.1024    
Unemploy_Teen1$Data      -1.666e+00  1.302e+00  -1.279   0.2019    
Unemploy_Youth1$Data     -5.796e+00  3.571e+00  -1.623   0.1058    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.621 on 262 degrees of freedom
Multiple R-squared:  0.2387,	Adjusted R-squared:  0.1312 
F-statistic:  2.22 on 37 and 262 DF,  p-value: 0.000163"

#Interpreting:
###
MRent_2k$Data             9.074e-05  3.166e-05   2.866   0.0045 **
  For every increase in the number of people paying above 2k rent monthly, everything else held constant, 
the life expectancy would can be expected to change by .0009074.  

####
For every increase in the number of people uninsured, everything else held constant, the life expectancy
can be expected to decrease by 0.000397. 


