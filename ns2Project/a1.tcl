source values.tcl
source color.tcl
set temptr "a1.tr"
set tempnam "a1.nam"
set temp "nam"
set opt(tr)       "$opt(trs)$temptr" 
set opt(nam) 	  "$temp$opt(trs)$tempnam"	

source initialization.tcl
source config.tcl
source tabu.tcl
source topology.tcl
source options.tcl
set opt(percent)    1     ;#5% of the full network capacity
source compute.tcl
source run.tcl

