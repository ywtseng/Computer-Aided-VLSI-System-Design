###############################################################
#  Generated by:      Cadence Encounter 10.13-s272_1
#  OS:                Linux x86_64(Host ID eda25)
#  Generated on:      Fri Jan  6 19:12:36 2017
#  Design:            CHIP
#  Command:           saveDesign cts.enc
###############################################################
set sdc_version 1.4
current_design CHIP
create_clock [get_ports {clk}]  -name clk -period 10 -waveform {0 5}
set_clock_latency 0.5  [get_clocks {clk}]
set_propagated_clock  [get_ports {clk}]
set_drive 1  [get_ports {clk}]
set_max_fanout 20  [get_ports {clk}]
set_drive 1  [get_ports {reset}]
set_max_fanout 20  [get_ports {reset}]
set_drive 1  [get_ports {data[31]}]
set_max_fanout 20  [get_ports {data[31]}]
set_drive 1  [get_ports {data[30]}]
set_max_fanout 20  [get_ports {data[30]}]
set_drive 1  [get_ports {data[29]}]
set_max_fanout 20  [get_ports {data[29]}]
set_drive 1  [get_ports {data[28]}]
set_max_fanout 20  [get_ports {data[28]}]
set_drive 1  [get_ports {data[27]}]
set_max_fanout 20  [get_ports {data[27]}]
set_drive 1  [get_ports {data[26]}]
set_max_fanout 20  [get_ports {data[26]}]
set_drive 1  [get_ports {data[25]}]
set_max_fanout 20  [get_ports {data[25]}]
set_drive 1  [get_ports {data[24]}]
set_max_fanout 20  [get_ports {data[24]}]
set_drive 1  [get_ports {data[23]}]
set_max_fanout 20  [get_ports {data[23]}]
set_drive 1  [get_ports {data[22]}]
set_max_fanout 20  [get_ports {data[22]}]
set_drive 1  [get_ports {data[21]}]
set_max_fanout 20  [get_ports {data[21]}]
set_drive 1  [get_ports {data[20]}]
set_max_fanout 20  [get_ports {data[20]}]
set_drive 1  [get_ports {data[19]}]
set_max_fanout 20  [get_ports {data[19]}]
set_drive 1  [get_ports {data[18]}]
set_max_fanout 20  [get_ports {data[18]}]
set_drive 1  [get_ports {data[17]}]
set_max_fanout 20  [get_ports {data[17]}]
set_drive 1  [get_ports {data[16]}]
set_max_fanout 20  [get_ports {data[16]}]
set_drive 1  [get_ports {data[15]}]
set_max_fanout 20  [get_ports {data[15]}]
set_drive 1  [get_ports {data[14]}]
set_max_fanout 20  [get_ports {data[14]}]
set_drive 1  [get_ports {data[13]}]
set_max_fanout 20  [get_ports {data[13]}]
set_drive 1  [get_ports {data[12]}]
set_max_fanout 20  [get_ports {data[12]}]
set_drive 1  [get_ports {data[11]}]
set_max_fanout 20  [get_ports {data[11]}]
set_drive 1  [get_ports {data[10]}]
set_max_fanout 20  [get_ports {data[10]}]
set_drive 1  [get_ports {data[9]}]
set_max_fanout 20  [get_ports {data[9]}]
set_drive 1  [get_ports {data[8]}]
set_max_fanout 20  [get_ports {data[8]}]
set_drive 1  [get_ports {data[7]}]
set_max_fanout 20  [get_ports {data[7]}]
set_drive 1  [get_ports {data[6]}]
set_max_fanout 20  [get_ports {data[6]}]
set_drive 1  [get_ports {data[5]}]
set_max_fanout 20  [get_ports {data[5]}]
set_drive 1  [get_ports {data[4]}]
set_max_fanout 20  [get_ports {data[4]}]
set_drive 1  [get_ports {data[3]}]
set_max_fanout 20  [get_ports {data[3]}]
set_drive 1  [get_ports {data[2]}]
set_max_fanout 20  [get_ports {data[2]}]
set_drive 1  [get_ports {data[1]}]
set_max_fanout 20  [get_ports {data[1]}]
set_drive 1  [get_ports {data[0]}]
set_max_fanout 20  [get_ports {data[0]}]
set_drive 1  [get_ports {data_valid}]
set_max_fanout 20  [get_ports {data_valid}]
set_drive 1  [get_ports {drop_done}]
set_max_fanout 20  [get_ports {drop_done}]
set_load -pin_load -max  1  [get_ports {busy}]
set_load -pin_load -min  1  [get_ports {busy}]
set_load -pin_load -max  1  [get_ports {codeword[10]}]
set_load -pin_load -min  1  [get_ports {codeword[10]}]
set_load -pin_load -max  1  [get_ports {codeword[9]}]
set_load -pin_load -min  1  [get_ports {codeword[9]}]
set_load -pin_load -max  1  [get_ports {codeword[8]}]
set_load -pin_load -min  1  [get_ports {codeword[8]}]
set_load -pin_load -max  1  [get_ports {codeword[7]}]
set_load -pin_load -min  1  [get_ports {codeword[7]}]
set_load -pin_load -max  1  [get_ports {codeword[6]}]
set_load -pin_load -min  1  [get_ports {codeword[6]}]
set_load -pin_load -max  1  [get_ports {codeword[5]}]
set_load -pin_load -min  1  [get_ports {codeword[5]}]
set_load -pin_load -max  1  [get_ports {codeword[4]}]
set_load -pin_load -min  1  [get_ports {codeword[4]}]
set_load -pin_load -max  1  [get_ports {codeword[3]}]
set_load -pin_load -min  1  [get_ports {codeword[3]}]
set_load -pin_load -max  1  [get_ports {codeword[2]}]
set_load -pin_load -min  1  [get_ports {codeword[2]}]
set_load -pin_load -max  1  [get_ports {codeword[1]}]
set_load -pin_load -min  1  [get_ports {codeword[1]}]
set_load -pin_load -max  1  [get_ports {codeword[0]}]
set_load -pin_load -min  1  [get_ports {codeword[0]}]
set_load -pin_load -max  1  [get_ports {enc_num[11]}]
set_load -pin_load -min  1  [get_ports {enc_num[11]}]
set_load -pin_load -max  1  [get_ports {enc_num[10]}]
set_load -pin_load -min  1  [get_ports {enc_num[10]}]
set_load -pin_load -max  1  [get_ports {enc_num[9]}]
set_load -pin_load -min  1  [get_ports {enc_num[9]}]
set_load -pin_load -max  1  [get_ports {enc_num[8]}]
set_load -pin_load -min  1  [get_ports {enc_num[8]}]
set_load -pin_load -max  1  [get_ports {enc_num[7]}]
set_load -pin_load -min  1  [get_ports {enc_num[7]}]
set_load -pin_load -max  1  [get_ports {enc_num[6]}]
set_load -pin_load -min  1  [get_ports {enc_num[6]}]
set_load -pin_load -max  1  [get_ports {enc_num[5]}]
set_load -pin_load -min  1  [get_ports {enc_num[5]}]
set_load -pin_load -max  1  [get_ports {enc_num[4]}]
set_load -pin_load -min  1  [get_ports {enc_num[4]}]
set_load -pin_load -max  1  [get_ports {enc_num[3]}]
set_load -pin_load -min  1  [get_ports {enc_num[3]}]
set_load -pin_load -max  1  [get_ports {enc_num[2]}]
set_load -pin_load -min  1  [get_ports {enc_num[2]}]
set_load -pin_load -max  1  [get_ports {enc_num[1]}]
set_load -pin_load -min  1  [get_ports {enc_num[1]}]
set_load -pin_load -max  1  [get_ports {enc_num[0]}]
set_load -pin_load -min  1  [get_ports {enc_num[0]}]
set_load -pin_load -max  1  [get_ports {out_valid}]
set_load -pin_load -min  1  [get_ports {out_valid}]
set_load -pin_load -max  1  [get_ports {finish}]
set_load -pin_load -min  1  [get_ports {finish}]
set_wire_load_model -library slow -max -name tsmc13_wl10
set_wire_load_model -library slow -min -name tsmc13_wl10
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[7]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[17]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[24]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[31]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[5]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[15]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[22]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[3]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[13]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[20]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[1]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[11]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data_valid}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {drop_done}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[29]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[27]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[8]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[18]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[25]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[6]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[16]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[23]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[30]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[4]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[14]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[21]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[2]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[12]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[0]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[10]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {reset}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[28]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[9]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[19]}]
set_input_delay -add_delay 1 -clock [get_clocks {clk}] [get_ports {data[26]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[8]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {finish}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[4]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[8]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {busy}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[6]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[4]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[2]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[11]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[0]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[10]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[9]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {out_valid}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[7]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[9]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[3]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[7]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {codeword[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[5]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[3]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[1]}]
set_output_delay -add_delay 0.5 -clock [get_clocks {clk}] [get_ports {enc_num[10]}]
set_clock_uncertainty 0.1 [get_clocks {clk}]