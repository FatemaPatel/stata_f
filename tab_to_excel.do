

***** SIMPLE TAB TO EXCEL *****

clear
cd "enter path of working directory"
set more off

* Create labels file
sysuse auto, clear  // read your data
preserve
    describe, replace
    list
	keep name varlab
	sxpose, clear firstnames
    save  var_labs, replace  // labels file gets created
restore


* Program for tables
** the program will create a tabel and export it is .xlsx. 
capture program drop tab_u
program define tab_u   // u stands for user defined
preserve
keep `1'
tostring `1', replace
replace `1'= stritrim(`1')
replace `1'= strtrim(`1')
bysort `1': g frequency= _N
gsort -frequency `1'
duplicates drop `1' frequency, force
egen percent= total(frequency)
sum(frequency)
scal tot=r(sum)
replace percent=(frequency/percent)*100
gen percent_s = string(percent, "%3.2f")  // can change format
drop percent
rename percent_s percent
tostring frequency percent, replace
insobs 1, before(1)

foreach var of varlist * {
replace `var' ="`var'" in 1
}
*
append using var_labs
foreach var of varlist*{
 if `var'[1]==""{
 drop `var'
		}
	}
*
replace `1' = `1'[`=_N'] in 1
replace `1'="Total" in l
replace frequency=strofreal(tot) in l
replace percent="100" in l
export excel using "path\filename.xlsx OR .xls",replace   // specify path for saving file
restore
end


* Try it out
tab_u rep78  // rep78 is one of the variables of auto.dta
tab_u mpg   // mpg is one of the variables of auto.dta



