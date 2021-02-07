library(plm)

## Import Data
df <- read.csv('panel_wage.csv')
head(df)

attach(df)

Y <- cbind(df$lwage)
head(Y)
X <- cbind(df$exp,df$exp2,df$wks,df$ed)
head(X)

## Set data to panel
pdata <- pdata.frame(df,index=c("id","t"))
View(pdata)

Summary(Y)
