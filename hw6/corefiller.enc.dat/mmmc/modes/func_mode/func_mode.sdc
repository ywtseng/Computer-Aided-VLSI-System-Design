###############################################################
#  Generated by:      Cadence Encounter 10.13-s272_1
#  OS:                Linux x86_64(Host ID eda25)
#  Generated on:      Sun Jan  1 16:57:01 2017
#  Design:            CHIP
#  Command:           saveDesign corefiller.enc
###############################################################
set sdc_version 1.4
current_design CHIP
create_clock [get_ports {clk}]  -name clk -period 20 -waveform {0 10}
set_clock_latency 0.5  [get_clocks {clk}]
set_propagated_clock  [get_ports {clk}]
set_drive 1  [get_ports {val}]
set_max_fanout 6  [get_ports {val}]
set_drive 1  [get_ports {dat[15]}]
set_max_fanout 6  [get_ports {dat[15]}]
set_drive 1  [get_ports {dat[14]}]
set_max_fanout 6  [get_ports {dat[14]}]
set_drive 1  [get_ports {dat[13]}]
set_max_fanout 6  [get_ports {dat[13]}]
set_drive 1  [get_ports {dat[12]}]
set_max_fanout 6  [get_ports {dat[12]}]
set_drive 1  [get_ports {dat[11]}]
set_max_fanout 6  [get_ports {dat[11]}]
set_drive 1  [get_ports {dat[10]}]
set_max_fanout 6  [get_ports {dat[10]}]
set_drive 1  [get_ports {dat[9]}]
set_max_fanout 6  [get_ports {dat[9]}]
set_drive 1  [get_ports {dat[8]}]
set_max_fanout 6  [get_ports {dat[8]}]
set_drive 1  [get_ports {dat[7]}]
set_max_fanout 6  [get_ports {dat[7]}]
set_drive 1  [get_ports {dat[6]}]
set_max_fanout 6  [get_ports {dat[6]}]
set_drive 1  [get_ports {dat[5]}]
set_max_fanout 6  [get_ports {dat[5]}]
set_drive 1  [get_ports {dat[4]}]
set_max_fanout 6  [get_ports {dat[4]}]
set_drive 1  [get_ports {dat[3]}]
set_max_fanout 6  [get_ports {dat[3]}]
set_drive 1  [get_ports {dat[2]}]
set_max_fanout 6  [get_ports {dat[2]}]
set_drive 1  [get_ports {dat[1]}]
set_max_fanout 6  [get_ports {dat[1]}]
set_drive 1  [get_ports {dat[0]}]
set_max_fanout 6  [get_ports {dat[0]}]
set_drive 1  [get_ports {clk}]
set_max_fanout 6  [get_ports {clk}]
set_drive 1  [get_ports {rst}]
set_max_fanout 6  [get_ports {rst}]
set_load -pin_load -max  1  [get_ports {done}]
set_load -pin_load -min  1  [get_ports {done}]
set_load -pin_load -max  1  [get_ports {freq[3]}]
set_load -pin_load -min  1  [get_ports {freq[3]}]
set_load -pin_load -max  1  [get_ports {freq[2]}]
set_load -pin_load -min  1  [get_ports {freq[2]}]
set_load -pin_load -max  1  [get_ports {freq[1]}]
set_load -pin_load -min  1  [get_ports {freq[1]}]
set_load -pin_load -max  1  [get_ports {freq[0]}]
set_load -pin_load -min  1  [get_ports {freq[0]}]
set_wire_load_model -library slow -max -name tsmc13_wl10
set_wire_load_model -library slow -min -name tsmc13_wl10
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[8]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[6]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[4]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[2]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[0]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {val}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[14]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {rst}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[12]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[10]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[9]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[7]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[5]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[3]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[1]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[15]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[13]}]
set_input_delay -add_delay 10 -clock [get_clocks {clk}] [get_ports {dat[11]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {freq[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {freq[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {freq[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {done}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {freq[3]}]
set_clock_uncertainty 0.1 [get_clocks {clk}]
set_ideal_network  [get_ports {clk}]
