version 8.0 
log using electoral.log, replace
 #delimit ;

*     ***************************************************************** *;
*     ***************************************************************** *;
*       File-Name:      electoral.do                                    *;
*       Date:           1/22/05                                         *;
*       Author:         MRG                                             *;
*       Purpose:        Do-file to replicate results for CPS version    *;
*                       of number of parties paper where dependent      *;
*                       variable is electoral parties.                  *;
*       Input File:     legislative_new.dta                             *;
*       Output File:    electoral.log                                   *;
*       Data Output:    None                                            *;
*       Previous file:                                                  *;
*       Machine:        Office                                          *;
*     ****************************************************************  *;
*     ****************************************************************  *;

set mem 10m;
set matsize 150;

use "C:\Documents and Settings\Matt Golder\My Documents\fsu\publications\cps2\legislative_new.dta", clear;

*     ****************************************************************  *;
*                           Summary Statistics                          *;
*     ****************************************************************  *;

sum;

*     ****************************************************************  *;
*                    Relabel and Define Variables                       *;
*     ****************************************************************  *;

label var country  "countryname";
label var newdem "first election as new democracy";
label var countrynumber "countrynumber";
label var year "year";
label var regime "regime as of 31 December of given year 0=democracy 1=dictatorship";
label var regime_leg "regime type at time of legislative election 0 = democracy 1=dictatorship";
label var legelec "legislative election";
label var preselec "presidential election";
label var eighties "election in 1980s closest to 1985";
label var old "elections in countries that did not transition to democracy in 1990s";
label var nineties "elections in 1990s closest to 1995";
label var proximity1 "proximity - continuous";
label var proximity2 "proximity - dichotomous";
label var enpp "parliamentary parties - uncorrected";
label var enpp1 "parliamentary parties - corrected";
label var enep "electoral parties - uncorrected";
label var enep1 "electoral parties - corrected";
label var enpres "effective number of presidential candidates";
label var seats "assembly size";
label var districts "number of electoral districts";
label var avemag "average district magnitude";
label var medmag "median district magnitude";
label var upperseats "number of uppertier seats";
label var uppertier "percentage of uppertier seats";
label var eneg "effective number of ethnic groups  fearon";

describe;


*     ****************************************************************  *;
*       Would like to drop countries that have no recognizable parties  *;
*       since I am interested in determining the number of parties.     *;
*       Drop Kiribati, Marshall Islands, Micronesia, Nauru, Palau,      *;
*       Lebanon (at least no votes by party), Kyrgzstan.                *;
*       Since I am interested in competitive elections I drop the       *;
*       elections that occurred in Colombia between 1958 and 1970 due   *;
*       to a constitutional agreement to share power between the        *;
*       conservative and liberal parties.                               *;
*       Also drop the Congolese elections of 1963.  Although there were *;
*       multiple parties permitted, all candidates ran on a single list.*;
*       Thus, there was no actual competition in this election.         *;
*     ****************************************************************  *;

drop if countrynumber==163;
drop if countrynumber==165;
drop if countrynumber==197;
drop if countrynumber==189;
drop if countrynumber==146;
drop if countrynumber==198;
drop if countrynumber==167;
drop if countrynumber==70 & year==1958;
drop if countrynumber==70 & year==1960;
drop if countrynumber==70 & year==1962;
drop if countrynumber==70 & year==1964;
drop if countrynumber==70 & year==1966;
drop if countrynumber==70 & year==1968;
drop if countrynumber==70 & year==1970;
drop if countrynumber==12 & year==1963;

sum;

*     ****************************************************************  *;
*       Does it matter if I use avemag instead of medmag?               *;
*     ****************************************************************  *;

correlate avemag medmag;
correlate avemag medmag if avemag~=1;

*     ****************************************************************  *;
*       Correlation is extremely high in both cases i.e. greater than   *;
*       99%.                                                            *;
*     ****************************************************************  *;

*     ****************************************************************  *;
*       Generate interaction variables ready for regressions.           *;
*     ****************************************************************  *;

generate logmag=ln(avemag);
generate uppertier_eneg = uppertier*eneg;
generate logmag_eneg = logmag*eneg;
generate proximity1_enpres = proximity1*enpres;

*     ****************************************************************  *;
*       Need to drop elections that use a fused vote in legislative     *;
*       and presidential elections.                                     *;
*       Drop Bolivia, Uruguay, Honduras up to and including the 1993    *;
*       elections, Guatemala elections in 1990 (fused vote with         *;
*       national district), Dominican Republic elections in 1966, 1970, *;
*       1974 and 1986.                                                  *;
*     ****************************************************************  *;

drop if countrynumber==67;
drop if countrynumber==76;
drop if countrynumber==59 & year==1957;
drop if countrynumber==59 & year==1971;
drop if countrynumber==59 & year==1985;
drop if countrynumber==59 & year==1989;
drop if countrynumber==59 & year==1993;
drop if countrynumber==57 & year==1990;
drop if countrynumber==54 & year==1966;
drop if countrynumber==54 & year==1970;
drop if countrynumber==54 & year==1974;
drop if countrynumber==54 & year==1986;

*     ****************************************************************  *;
*       Drop those countries where enep1 others are greater than 15% of *;
*       the vote or seats.                                              *;
*     ****************************************************************  *;

drop if enep_others>15 & enep_others<100;

*     ****************************************************************  *;
*     ****************************************************************  *;
*       Now, let's run some cross-sections for the 1990s. In the paper, *;
*       I drop countries with non-compensatory upper tier seats. Before *;
*       I do this, let me check that nothing changes if I include these *;
*       observations.                                                   *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*                               1990s                                   *;
*     ****************************************************************  *;
*     ****************************************************************  *;

regress enep1  eneg logmag uppertier enpres proximity1 logmag_eneg uppertier_eneg   proximity1_enpres if nineties==1;

regress enep1  eneg logmag uppertier enpres proximity1 logmag_eneg uppertier_eneg   proximity1_enpres if nineties==1 & old==1;

*     ****************************************************************  *;
*       As you will see, these results are qualitatively similar to the *;
*       results that I get when i drop non-compensatory upper tier      *;
*       seats.                                                          *;
*     ****************************************************************  *;

*     ****************************************************************  *;
*     ****************************************************************  *;
*           Now drop countries with majoritarian uppertiers             *;
*     ****************************************************************  *;
*     ****************************************************************  *;

drop if countrynumber==132;
drop if countrynumber==29;
drop if countrynumber==87 & year==1988;
drop if countrynumber==87 & year==1992;
drop if countrynumber==87 & year==1996;
drop if countrynumber==116 & year==1987;
drop if countrynumber==116 & year==1996;

sum;

*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*               So, now let's run stuff - results for Table 2           *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;

*     ****************************************************************  *;
*     ****************************************************************  *;
*                               1990s                                   *;
*     ****************************************************************  *;
*     ****************************************************************  *;

regress enep1  eneg logmag uppertier enpres proximity1 logmag_eneg uppertier_eneg proximity1_enpres if nineties==1;

regress enep1  eneg logmag uppertier enpres proximity1 logmag_eneg uppertier_eneg proximity1_enpres if nineties==1 & old==1;

*     ****************************************************************  *;
*                       So, now let's try pooling                       *;
*     ****************************************************************  *;

sum;

regress enep1  eneg logmag uppertier enpres proximity1 logmag_eneg uppertier_eneg proximity1_enpres, robust cluster(country);

regress enep1  eneg logmag uppertier enpres proximity1 logmag_eneg uppertier_eneg proximity1_enpres if old==1, robust cluster(country);


*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*       What if we did not use robust standard errors clustered by      *;
*       country? What if we used panel-corrected standard errors?       *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;
*     ****************************************************************  *;

*     ****************************************************************  *;
*       To use XTPCSE I can only have one election in each year. So, I  *;
*       need to drop one election from those years in which a country   *;
*       had two elections.                                              *;
*     ****************************************************************  *;

replace year=. if twoelections1==1;

sort country year;

*     ****************************************************************  *;
*       Now tsset the data.                                             *;
*     ****************************************************************  *;

tsset countrynumber year, yearly;

*     ****************************************************************  *;
*           XTPCSE without lagged dependent variable                    *;
*     ****************************************************************  *;

xtpcse enep1 proximity1 enpres  proximity1_enpres uppertier eneg uppertier_eneg  logmag  logmag_eneg, pairwise;

xtpcse enep1 proximity1 enpres  proximity1_enpres uppertier eneg uppertier_eneg  logmag  logmag_eneg if old==1, pairwise;

*     ****************************************************************  *;
*           XTPCSE with lagged dependent variable                       *;
*     ****************************************************************  *;

sort country year;

by country: generate enep1_lag=enep1[_n-1];

replace enep1_lag = . if newdem==1;

set matsize 150;

xtpcse enep1 enep1_lag proximity1 enpres  proximity1_enpres  eneg uppertier_eneg uppertier logmag logmag_eneg,pairwise;

xtpcse enep1 enep1_lag proximity1 enpres  proximity1_enpres  eneg uppertier_eneg uppertier logmag logmag_eneg if old==1,pairwise;


*     ****************************************************************  *;
*     ****************************************************************  *;
*                                   THE END                             *;
*     ****************************************************************  *;
*     ****************************************************************  *;

exit;
