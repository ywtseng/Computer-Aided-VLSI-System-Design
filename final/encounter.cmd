#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Fri Jan  6 17:22:22 2017                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v10.13-s272_1 (32bit) 04/18/2012 16:36 (Linux 2.6)
#@(#)CDS: NanoRoute v10.13-s027 NR120403-1008/10_10_USR3-UB (database version 2.30, 132.4.1) {superthreading v1.16}
#@(#)CDS: CeltIC v10.13-s063_1 (32bit) 02/29/2012 09:38:16 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: AAE 10.13-s008 (32bit) 04/18/2012 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CTE 10.13-s018_1 (32bit) Feb 28 2012 22:08:25 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CPE v10.13-s225

win
getenv ENCOUNTER_CONFIG_RELATIVE_CWD
setDoAssign
getIoFlowFlag
setUIVar rda_Input ui_gndnet VSS
setUIVar rda_Input ui_leffile {library/lef/tsmc13fsg_8lm_cic.lef library/lef/tpz013g3_8lm_cic.lef library/lef/RF2SH64x16.vclef library/lef/antenna_8.lef}
setUIVar rda_Input ui_netlist LZSS_syn.v
setUIVar rda_Input ui_io_file CHIP.ioc
setUIVar rda_Input ui_pwrnet VDD
create_rc_corner -name RC_corner -cap_table {library/tsmc013.capTbl} -preRoute_res {1.0} -preRoute_cap {1.0} -preRoute_clkres {0.0} -preRoute_clkcap {0.0} -postRoute_res {1.0} -postRoute_cap {1.0} -postRoute_xcap {1.0} -postRoute_clkres {0.0} -postRoute_clkcap {0.0} -qx_tech_file {library/tsmc13_8lm.cl/icecaps_8lm.tch}
create_library_set -name lib_max -timing {library/lib/slow.lib library/lib/RF2SH64x16_slow_syn.lib library/lib/tpz013g3wc.lib} -si {library/celtic/slow.cdB}
create_library_set -name lib_min -timing {library/lib/fast.lib library/lib/RF2SH64x16_fast@0C_syn.lib library/lib/tpz013g3lt.lib} -si {library/celtic/fast.cdB}
create_constraint_mode -name func_mode -sdc_files {LZSS_DC.sdc}
create_constraint_mode -name scan_mode -sdc_files {CHIP_scan_ideal.sdc}
create_delay_corner -name Delay_Corner_max -library_set {lib_max} -rc_corner {RC_corner}
create_delay_corner -name Delay_Corner_min -library_set {lib_min} -rc_corner {RC_corner}
create_analysis_view -name av_func_mode_max -constraint_mode {func_mode} -delay_corner {Delay_Corner_max}
create_analysis_view -name av_func_mode_min -constraint_mode {func_mode} -delay_corner {Delay_Corner_min}
create_analysis_view -name av_scan_mode_max -constraint_mode {scan_mode} -delay_corner {Delay_Corner_max}
create_analysis_view -name av_scan_mode_min -constraint_mode {scan_mode} -delay_corner {Delay_Corner_min}
set_analysis_view -setup {av_func_mode_max av_scan_mode_max} -hold {av_func_mode_min av_scan_mode_min}
commitConfig
getenv ENCOUNTER_CONFIG_RELATIVE_CWD
setDoAssign
getIoFlowFlag
setUIVar rda_Input ui_gndnet VSS
setUIVar rda_Input ui_timingcon_file LZSS_DC.sdc
setUIVar rda_Input ui_leffile {library/lef/tsmc13fsg_8lm_cic.lef library/lef/tpz013g3_8lm_cic.lef library/lef/RF2SH64x16.vclef library/lef/antenna_8.lef}
setUIVar rda_Input ui_timelib {library/lib/slow.lib library/lib/RF2SH64x16_slow_syn.lib library/lib/tpz013g3wc.lib}
setUIVar rda_Input ui_netlist LZSS_syn.v
setUIVar rda_Input ui_io_file CHIP.ioc
setUIVar rda_Input ui_topcell CHIP
setUIVar rda_Input ui_captbl_file library/tsmc013.capTbl
setUIVar rda_Input ui_pwrnet VDD
setUIVar rda_Input ui_gndnet VSS
setUIVar rda_Input ui_timingcon_file LZSS_DC.sdc
setUIVar rda_Input ui_leffile {library/lef/tsmc13fsg_8lm_cic.lef library/lef/tpz013g3_8lm_cic.lef library/lef/RF2SH64x16.vclef library/lef/antenna_8.lef}
setUIVar rda_Input ui_timelib {library/lib/slow.lib library/lib/RF2SH64x16_slow_syn.lib library/lib/tpz013g3wc.lib}
setUIVar rda_Input ui_netlist LZSS_syn.v
setUIVar rda_Input ui_io_file CHIP.ioc
setUIVar rda_Input ui_topcell CHIP
setUIVar rda_Input ui_captbl_file library/tsmc013.capTbl
setUIVar rda_Input ui_pwrnet VDD
loadConfig CHIP.conf 0
