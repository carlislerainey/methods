
***********************************************************************************************************
****************   This do file runs the analysis in De La O, A.L. "Do Conditional     ********************
*****************  Cash Transfers Affect Electoral Behavior?" AJPS 57(1):1-14          ********************
****************** January  2013                                                       ******************** 
***********************************************************************************************************


clear
set mem 500m
set more off

/*Change directory*/
cd "C:\Documents and Settings\ald59\My Documents\My Dropbox\Progresa\Progresa\Replication files\"

/* Call the data*/
use DeLaO_AJPS2013_rep_file.dta


/*Analysis*/

/* Table 2. Baseline characteristics by treatment*/
	ttest avgpoverty , by (treatment) 
	ttest pobtot1994 , by(treatment) 
 	ttest pobelegiblep , by (treatment) 
 	ttest t1994 , by (treatment)
	ttest pri1994s , by (treatment)
	ttest pan1994s , by (treatment)
	ttest prd1994s , by (treatment)
	ttest villages, by(treatment)
	ttest one_random, by(treatment)
	ttest two_random, by (treatment)

/*Additional tests of baseline covariates*/

ttest votos_totales1994, by (treatment)
ttest pri1994, by (treatment)
ttest pan1994, by (treatment)
ttest prd1994, by (treatment)


*******************************************************
*******************************************************
*** Main analysis:                             ********
*** Precincts with one treated or one control village**
*******************************************************


/* Table 3. Panel A. Intent to Treat Estimates (no controls) */

areg t2000 treatment if (numerotreated==1 | numerocontrol==1) , absorb(villages) robust
areg pri2000s treatment if (numerotreated==1 | numerocontrol==1), absorb(villages) robust
areg pan2000s treatment if (numerotreated==1 | numerocontrol==1), absorb(villages) robust
areg prd2000s treatment if (numerotreated==1 | numerocontrol==1), absorb(villages) robust

/* Table 3: Panel B. IV estimates (no controls)*/

xi: ivregress 2sls t2000 i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1 , robust
xi: ivregress 2sls pri2000s i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1, robust
xi: ivregress 2sls pan2000s i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1, robust
xi: ivregress 2sls prd2000s i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1, robust


/* Table 4. ITT estimates on party observers*/ 

areg rep_total treatment if (numerotreated==1 | numerocontrol==1), absorb(villages) robust
areg rep_PRI treatment if (numerotreated==1 | numerocontrol==1), absorb(villages) robust	
areg rep_PAN treatment if (numerotreated==1 | numerocontrol==1), absorb(villages) robust
areg rep_PRD treatment if (numerotreated==1 | numerocontrol==1), absorb(villages) robust


/* Table SI.2. Panel A. ITT with controls */

/*Note: Baseline controls include total votes, and votes for pri,
 pan and prd in 1994, among others. I do not include 1994 election outcomes calculated as
 a share of people eligible to vote, because I only have the share of people 
 eligible to vote from the 2000 census. Therefore, including the 1994 election outcomes as a share of
 2000 population eligible to vote could introduce post-treatment bias. */
       
areg t2000 treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==1 | numerocontrol==1) , absorb(villages) robust
areg pri2000s treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==1 | numerocontrol==1), absorb(villages) robust
areg pan2000s treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==1 | numerocontrol==1), absorb(villages) robust
areg prd2000s treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==1 | numerocontrol==1), absorb(villages) robust

/* Table SI.2. Panel B. IV with controls*/

xi: ivregress 2sls t2000 avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1 , robust
xi: ivregress 2sls pri2000s avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1, robust
xi: ivregress 2sls pan2000s avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1, robust
xi: ivregress 2sls prd2000s avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages (early_progresa_p=treatment) if numerotreated==1 | numerocontrol==1, robust

*******************************************************
*******************************************************
*** Secondary analysis:                        ********
*** Precincts with two treated or two control village**
*******************************************************

/* Table SI.3 Impact among precincts with two experimental villages*/
/* Panel A. ITT for precincts with 2 randomized village */

areg t2000 treatment if (numerotreated==2 | numerocontrol==2) , absorb(villages2) robust
areg t2000 treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==2 | numerocontrol==2) , absorb(villages2) robust
areg pri2000s treatment if (numerotreated==2 | numerocontrol==2), absorb(villages2) robust
areg pri2000s treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==2 | numerocontrol==2), absorb(villages2) robust
areg pan2000s treatment if (numerotreated==2 | numerocontrol==2), absorb(villages2) robust
areg pan2000s treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==2 | numerocontrol==2), absorb(villages2) robust
areg prd2000s treatment if (numerotreated==2 | numerocontrol==2), absorb(villages2) robust
areg prd2000s treatment avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 if (numerotreated==2 | numerocontrol==2), absorb(villages2) robust


/*Panel B. IV for the precincts with 2 randomized villages*/
xi: ivregress 2sls t2000 i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2 , robust
xi: ivregress 2sls t2000 avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2 , robust
xi: ivregress 2sls pri2000s i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2, robust
xi: ivregress 2sls pri2000s avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2, robust
xi: ivregress 2sls pan2000s i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2, robust
xi: ivregress 2sls pan2000s avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2, robust
xi: ivregress 2sls prd2000s i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2, robust
xi: ivregress 2sls prd2000s avgpoverty pobtot1994 votos_totales1994 pri1994 pan1994 prd1994 i.villages2 (early_progresa_p=treatment) if numerotreated==2 | numerocontrol==2, robust

