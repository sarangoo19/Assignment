/* Question 5. Automate repeating tasks using Stata "for" loops */

clear

use lakisha_aer

gen white = 1 if (race =="w")
replace white = 0 if(race =="b")
egen LWmean = mean(call) if(white==1) & (l==1)


/* Question 6. Break up work into smaller components using Stata .do files */

egen mexp = mean(yearsexp)
gen EXP = yearsexp - mexp 
gen EXP2 = EXP * EXP


/* Question 7. Read .csv data in in Stata */

insheet using "gender.csv", comma clear


/* Question 8. Fix common data quality errors in Stata (for example, string vs number, missing value) */

replace fed=0 if fed==.


/* Question 9. Aggregate, reshape, and combine data for analysis in Stata */

collapse (mean) new_l=l (mean) new_h=h, by(race)


/* Question 10.	Prepare a sample for analysis by filtering observations and variables and creating transformations of variables. Demonstrate all three */

use nls

set seed 1234

keep lwage76 age76 black ed76 daded nodaded momed nomomed famed momdad14 sinmom14 step14 nearc4 nearc2 kww south66 smsa66 reg661-reg669 south76 smsa76

gen momlog=log(momed)


/* Question 11. Save data in Stata */

save "nls.dta", replace


/* Question 12.	Run ordinary least squares regression in Stata */

reg lwage76 age76 black ed76 daded momed nearc4 kww south76 smsa76


/* Question 13.	Create a graph (of any type) in Stata*/

 twoway (scatter lwage76 ed76), ytitle(lwage) xtitle(ed76) title(Effect of age and education on salary)


/* 14. Save regression tables and graphs as files. Demonstrate both */

outreg2 using wage, excel replace ctitle("Wage") label

graph export wage, as(pdf)

 
/* Question 15.	Install a Stata package */

ssc install outreg2






















