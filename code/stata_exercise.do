cd "/Users/koren/Documents/workspace/dc-economics"
use "data/raw/cepii/dist_cepii.dta", clear

replace dist = dist * 0.621371
label variable dist "Distance between pair of countries (miles)"

foreach var of varlist dist distw {
    egen mean_`var' = mean(`var'), by(iso_o)
}

save "data/derived/mean_distances.dta", replace