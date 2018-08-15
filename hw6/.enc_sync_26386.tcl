cd /net/home/ywtseng/cvsd/hw6
source .edp_26386.enc.dat/CHIP.globals
catch { set_global timing_suppress_ilm_constraint_mismatches true }
set_global _read_library_without_ccs false
set_global timing_library_ccs_it_data false
set_global timing_library_read_ccs_noise_data false
loadConfig .edp_26386.enc.dat/CHIP.conf 0
setVar rda_Input(ui_settop) {1}
setVar rda_Input(ui_topcell) {CHIP}
setVar rda_Input(ui_view_definition_file) ""
setVar rda_Input(ui_ilmdir) ""
setVar rda_Input(ui_ilmlist) {}
setVar rda_Input(ui_pwrnet) {VDD }
setVar rda_Input(ui_gndnet) {VSS }
commitConfig
