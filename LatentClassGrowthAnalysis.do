use "Y:\ICH_PPP_CENB_MAGNET\Paper 1\October 2018\Step 2\step2_data.dta" ,clear


*data are in wide format and include the repeated measures of the outcome variable, Log(BMI)
su lbmi*

/*
the observations were taken at age: 8,10,11,12,13,and 16
need to generate the variables holding these times
as we will use ploynomials of time, best to rescale time, by centering it at age 12 and dividing it by 10 
*/
gen t1=-0.4
gen t2=-0.2
gen t3=-0.1
gen t4=0
gen t5=0.1
gen t6=0.4

/*
use the users defined command "traj" 

If not already downloaded, type:
	net from http://www.andrew.cmu.edu/user/bjones/traj
	net install traj, replace  
*/

traj  , model(cnorm) var(lbmi8-lbmi16) indep(t1-t6) order(2 2 2 2 2 ) min(2) max(4)
trajplot, xtitle("Age") ytitle("LogBMI")

ex
