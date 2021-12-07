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



