#install.packages("ggpubr")
#devtools::install_github("r-lib/rlang", build_vignettes = TRUE)
#install.packages("rlang", dependencies = TRUE)


## Load Package
library(survival)
library(survminer)
library(concordance)
options(scipen=999)

## Load data
data(nafld)
head(nafld1)
head(nafld2)
head(nafld3)

## Deskripsi data
## Variabel tersensor adalah status
## status = 0 aritnya dia tersensor
df = nafld1
head(df)

fit <- survfit(Surv(futime, status)~1, data = df)
surv_table <- data.frame(time=fit$time,
                         n_risk=fit$n.risk,
                         n_event=fit$n.event,
                         n_censor=fit$n.censor,
                         sur_prob=fit$surv)
surv_table

plot(x=surv_table$time,
     y=surv_table$sur_prob,
     type="l", 
     ylab="survival probability",
     xlab="time")

ggsurvplot(fit,
           surv.median.line = "hv",
           ggtheme = theme_bw(),
           color="blue",
           legend="none",
           xlab = "Time in Days") +
  ggtitle("Kaplan Meier Curve nafld")

### Perbandingan dua kategori
fit2 <- survfit(Surv(futime,status)~male,data=df)
surv_table <- data.frame(time=fit2$time,
                         n_risk=fit2$n.risk,
                         n_event = fit2$n.event,
                         n_censor = fit2$n.censor,
                         sur_prob=fit2$surv)
surv_table

fit2 <- survfit(Surv(futime, status)~male, data = df)
win.graph()
ggsurvplot(fit2,
           pval = TRUE,
           surv.median.line = "hv",
           ggtheme = theme_bw(),
           palette = c("red","blue"),
           legend="left",
           legend.labs = c("Male", "Female"),
           xlab = "Time in Days") +
  ggtitle("Kaplan Meier Curve Lung Dataset")

## Regresi Cox Proportional Hazard
options(scipen=999)
df$male <- as.factor(df$male) # convert to dummy variable
model_coxph <- coxph (Surv(futime, status) ~ age + male + weight +  height +
                       bmi,data=df)

summary(model_coxph)


## Model Survival dengan disribusi exponensial
options(scipen=999)
df$male <- as.factor(df$male) # convert to dummy variable
model_exp <- survreg(Surv(futime, status) ~ age + male + weight +  height +
                        bmi,dist="exponential",data=df)

summary(model_exp)

## Metrik Evaluation
concordance(model_coxph)

concordance(model_exp)

