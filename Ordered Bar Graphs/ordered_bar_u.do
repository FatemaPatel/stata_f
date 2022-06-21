cap drop mr_ordered_bar_u
program define mr_ordered_bar_u	// multiple response ordered bar graph userdefined

/*Code we want to turn into a program:

*This requires providing labels to Reason1, Reason2, and so on manually. To change the order, the variables have to be arranged accoridnly and labels have to updated.
*Time intense but useful since we don't require a legend. Looks prettier.

	loc varlistsum affect_you_1sum affect_you_2sum affect_you_3sum affect_you_4sum
  
gr hbar `varlist', ascat bar(1, color(ebblue*0.5)) graphregion(fcolor(white)) ylab(0 "0" 0.25 "25" 0.5 "50" 0.75 "75") ytitle("Percent") ///
	yvaroptions(relabel(1 "Reason1" 2 "Reason2" ///
	3 "Reason3" 4 "Reason4" ))	 ///
	ytitle("Percent of Respondents", size(medium)) ///
	graphregion(margin(5 2 2 2))  ///
	tit ("Ways Respondents Have Been Affected by" "C-19 & Lockdowns", size(small)) 
*/

/* 
*	Idea 1
	syntax varlist [if] 
	if "`if'"~=""{
		foreach v of `varlist'{
		keep 	
			}
		}
end
*/

/*
  *Idea 2
cap drop mr_ordered_bar_u
program define mr_ordered_bar_u	// multiple response bar graph no legend userdefined
	syntax varlist, figname() gphpath() [color()] ///
	[opacity()] [ylab()] [savinggph()] [ytitle()] ///
	[ytitsize()] [tit()] [titsize()] [graphregion()] 
  
	* ylab should be a compound double quotes Eg: '"0 "0" 0.25 "25" 0.5 "50" 0.75 "75""'
	* savinggph should be: saving(varname,replace)
	* graphregion should be: margin(7 5 2 2)
*/
