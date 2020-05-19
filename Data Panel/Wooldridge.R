# Source : https://www.youtube.com/watch?v=2igMNODFypk
# Hlavac, Marek (2018). stargazer: Well-Formatted Regression and Summary Statistics Tables.
# R package version 5.2.2. https://CRAN.R-project.org/package=stargazer 

#Load packages
library(foreign)
library(plm)
library(stargazer)
library(lmtest)
library(xlsx)

#Load in Wooldridge data on crime
crime <- read.dta("http://fmwww.bc.edu/ec-p/data/wooldridge/crime4.dta")
head(crime)

#Declare our data to be a panel data set
crime.p <- pdata.frame(crime,index=c("county","year"))
head(crime.p)
View(crime.p)

#Run a panel model
#fixed effects / within
fixedeff <- plm(log(crmrte)~polpc,data=crime.p,model="within")
stargazer(fixedeff,type='text')

#Random effects
randomeff <- plm(log(crmrte)~polpc,data=crime.p,model="random")
stargazer(randomeff,type='text')

#First difference effects
firstdiff <- plm(log(crmrte)~polpc,data=crime.p,model="fd")
stargazer(firstdiff,type='text')

#Run a hausman test comparing random and fixed effects
phtest(fixedeff,randomeff)

#Include a lag
fixedeffwithlag <- plm(log(crmrte)~lag(log(crmrte))+polpc,data=crime.p,model="within")
stargazer(fixedeffwithlag,type='text')

#Cluster standard errors at the individual level
coeftest(fixedeff,vcovHC(fixedeff,type="HC0",cluster="group"))
