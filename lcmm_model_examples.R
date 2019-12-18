library(lcmm)

#load data
data <- read.table("Data.csv",sep=",", header= TRUE, na.strings = NA)

#recenter and scale age
data$age12 <- (data$age - 12)/10

### Estimation of mixed-effect models and latent class mixed-effect models for continuous Gaussian outcomes ### 

#Estimate the model with only one class (ng = 1)
m1 <- hlme(bmi ~ age12+I(age12^2),random =~ age12+I(age12^2), subject = 'ID', data = data) 

#estimate the model with two classes (ng = 2): 
m2 <- hlme(bmi ~ age12+I(age12^2),random =~ age12+I(age12^2), subject = 'ID', data = data, ng = 2, mixture=~age12+I(age12^2), B=m1) # ng=2
postprob(m2)

#estimate the model with two classes using gridsearch:
m2_gridsearch <- gridsearch(hlme(bmi ~ age12+I(age12^2),random =~ age12+I(age12^2), subject = 'ID', data = data, ng = 2, mixture=~age12+I(age12^2)),rep=100, maxiter=50, minit=m1) #ng=2
postprob(m2_gridsearch)

#get summary of the models
summarytable(m1, m2, m2_gridsearch, which = c("G", "loglik", "conv", "npm", "AIC", "BIC", "SABIC", "entropy", "%class"))

### Estimation of mixed-effect models and latent class mixed-effect models for continuous non-Gaussian or ordinal outcomes ### 
m1_lcmm <- lcmm(fussy_eating ~ age12+I(age12^2),random =~ age12+I(age12^2), subject = 'ID', data = data, link='thresholds') 
summary(m1_lcmm) 

### Estimation of mixed-effect models and latent class mixed-effect models for multiple longitudinal markers measuring the same underlying latent process ### 
m1_mult_lin <- multlcmm(BMI + fussy_eating ~ age12+I(age12^2) + time + I(time^2/10), random =~ time +I(time^2 / 10), subject= 'ID', data = data, randomY = TRUE, cor = BM(time), link = c('linear','thresholds'))
summary(m1_mult_lin)

### Estimation of mixed-effect models and latent class mixed-effect models for longitudinal markers and time to event (possibly with competing risks) ### 
m1_jointlcmm <- Jointlcmm(BMI~ age12+I(age12^2),random=~age12+I(age12^2),subject='ID', data=data, ng=1, survival = Surv(Tevent,Event)~ time+event, hazard="3-quant-splines", hazardtype="PH") #ng=1
summary(m1_jointlcmm)

