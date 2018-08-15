create_library_set -name lib_min\
   -timing\
    [list library/lib/fast.lib\
    library/lib/RF2SH64x16_fast@0C_syn.lib\
    library/lib/tpz013g3lt.lib]\
   -si\
    [list library/celtic/fast.cdB]
create_library_set -name lib_max\
   -timing\
    [list library/lib/slow.lib\
    library/lib/RF2SH64x16_slow_syn.lib\
    library/lib/tpz013g3wc.lib]\
   -si\
    [list library/celtic/slow.cdB]
create_rc_corner -name RC_corner\
   -cap_table library/tsmc013.capTbl\
   -preRoute_res 1.5\
   -postRoute_res 1.5\
   -preRoute_cap 1.5\
   -postRoute_cap 1.5\
   -postRoute_xcap 1.5\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file library/tsmc13_8lm.cl/icecaps_8lm.tch
create_delay_corner -name Delay_Corner_min\
   -library_set lib_min\
   -rc_corner RC_corner
create_delay_corner -name Delay_Corner_max\
   -library_set lib_max\
   -rc_corner RC_corner
create_constraint_mode -name func_mode\
   -sdc_files\
    [list CHIP.sdc]
create_analysis_view -name av_func_mode_max -constraint_mode func_mode -delay_corner Delay_Corner_max
