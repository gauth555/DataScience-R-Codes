''''
#Created on Tue Oct 13
#
#@author: Goutham
#
#The goal of this exercise is for us to see how you would analyze or provide 
#predictions from a dataset.
#
#Data Set Details - Leads (Potential customers with attributes, and a flag 
#                          where these leads became a customer)
#
#Tools Used - Analytical methods used in R.
#
#Some methods shown here
#- Descriptive Statistics (Coefficient, Std. Error, T Value, P- value)
#- Descriptive Statistics (Residual - Minimum, First Quartile, Median, 3Q, Max)
#- Other Statistics Used (Residual Standard Error, Adj. R Sq, F-statistics)
#- T-test
#- Correlations
#- Regression - Linear Regression Used
#
#Other Statistics To be shown
#- Distributions
#- Graphing interesting findings
#- Confidence Intervals

''''
require(ggplot2)
setwd("C:/Users/Goutham/Documents/R")

data <- read.csv("lead_data.csv", header=TRUE, sep = ",")

# To find the name of the columns to do a Regression
#> colnames(data)
#[1] "Lead.ID"          "SaleType"         "Lead.Age"         "Urban"           
#[5] "Married"          "Mobile"           "NumberHighBrands" "NumberLowBrands" 
#[9] "NumberFashionMag" "HHIncome"         "Converted"     

# Linear Model Regression
fit <- lm(Converted ~ Lead.Age + Urban + Married + Mobile + NumberHighBrands + 
            NumberLowBrands + NumberFashionMag + HHIncome, data=data)
summary (fit)

#  Residuals:
#  Min       1Q   Median       3Q      Max 
#-0.62060 -0.10929 -0.01586  0.08109  0.67725 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)      -1.0266809  0.0342212 -30.001  < 2e-16 ***
#  Lead.Age          0.0085388  0.0008460  10.093  < 2e-16 ***
#  Urban             0.1164510  0.0161241   7.222 1.02e-12 ***
#  Married           0.2142706  0.0174020  12.313  < 2e-16 ***
#  Mobile           -0.0222664  0.0139226  -1.599   0.1101    
#NumberHighBrands -0.0076965  0.0039801  -1.934   0.0534 .  
#NumberLowBrands   0.0011897  0.0050905   0.234   0.8153    
#NumberFashionMag  0.0734135  0.0044951  16.332  < 2e-16 ***
#  HHIncome          0.0134720  0.0003741  36.011  < 2e-16 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
#Residual standard error: 0.1662 on 991 degrees of freedom
#Multiple R-squared:  0.8753,  Adjusted R-squared:  0.8743 
#F-statistic: 869.9 on 8 and 991 DF,  p-value: < 2.2e-16

# To Draw a ggplot2 Scatterplots
ggplot(data, aes(x = HHIncome, y = Converted)) + geom_point()

