* run this script from the root of the dc-economics-v2.1 folder
use "data/raw/cepii/dist_cepii.dta", clear

replace dist = dist * 0.621371
label variable dist "Distance between pair of countries (miles)"

foreach var of varlist dist* {
    egen mean_`var' = mean(`var'), by(iso_o)
}

regress distw dist
twoway (scatter distw dist)

save "data/derived/mean_distances.dta", replace