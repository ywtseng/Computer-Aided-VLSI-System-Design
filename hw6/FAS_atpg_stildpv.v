// Verilog STILDPV testbench written by  TetraMAX (TM)  E-2010.12-SP3-i110418_160828 
// Date: Fri Dec  2 15:28:11 2016
// Module tested: FAS

`timescale 1 ns / 1 ns

module FAS_test;
   integer verbose;         // message verbosity level
   integer report_interval; // pattern reporting intervals
   integer diagnostic_msg;  // format miscompares for TetraMAX diagnostics
   parameter NINPUTS = 21, NOUTPUTS = 535;
   // The next two variables hold the current value of the TetraMAX pattern number
   // and vector number, while the simulation is progressing. $monitor or $display these
   // variables, or add them to waveform views, to see these values change with time
   integer pattern_number;
   integer vector_number;

   wire data_valid;  reg data_valid_REG ;
   wire clk;  reg clk_REG ;
   wire rst;  reg rst_REG ;
   wire fir_valid;
   wire fft_valid;
   wire done;
   wire test_si;  reg test_si_REG ;
   wire test_se;  reg test_se_REG ;
   wire [15:0] data;
//   reg [15:0] data_REG;
   reg \data_REG[0] ;
   reg \data_REG[1] ;
   reg \data_REG[2] ;
   reg \data_REG[3] ;
   reg \data_REG[4] ;
   reg \data_REG[5] ;
   reg \data_REG[6] ;
   reg \data_REG[7] ;
   reg \data_REG[8] ;
   reg \data_REG[9] ;
   reg \data_REG[10] ;
   reg \data_REG[11] ;
   reg \data_REG[12] ;
   reg \data_REG[13] ;
   reg \data_REG[14] ;
   reg \data_REG[15] ;
   wire [15:0] fir_d;
   wire [3:0] freq;
   wire [31:0] fft_d1;
   wire [31:0] fft_d2;
   wire [31:0] fft_d3;
   wire [31:0] fft_d4;
   wire [31:0] fft_d5;
   wire [31:0] fft_d6;
   wire [31:0] fft_d7;
   wire [31:0] fft_d8;
   wire [31:0] fft_d9;
   wire [31:0] fft_d10;
   wire [31:0] fft_d11;
   wire [31:0] fft_d12;
   wire [31:0] fft_d13;
   wire [31:0] fft_d14;
   wire [31:0] fft_d15;
   wire [31:0] fft_d0;

   // map register to wire for DUT inputs and bidis
   assign data_valid = data_valid_REG ;
   assign data = { \data_REG[15] , \data_REG[14] , \data_REG[13] , \data_REG[12]
          , \data_REG[11] , \data_REG[10] , \data_REG[9] , \data_REG[8] , \data_REG[7]
          , \data_REG[6] , \data_REG[5] , \data_REG[4] , \data_REG[3] , \data_REG[2]
          , \data_REG[1] , \data_REG[0]  };
   assign clk = clk_REG ;
   assign rst = rst_REG ;
   assign test_si = test_si_REG ;
   assign test_se = test_se_REG ;

   // instantiate the design into the testbench
   FAS dut (
      .data_valid(data_valid),
      .data({ data[15], data[14], data[13], data[12], data[11],
          data[10], data[9], data[8], data[7], data[6], data[5], data[4], data[3],
          data[2], data[1], data[0] }),
      .clk(clk),
      .rst(rst),
      .fir_d({ fir_d[15], fir_d[14], fir_d[13], fir_d[12],
          fir_d[11], fir_d[10], fir_d[9], fir_d[8], fir_d[7], fir_d[6], fir_d[5],
          fir_d[4], fir_d[3], fir_d[2], fir_d[1], fir_d[0] }),
      .fir_valid(fir_valid),
      .fft_valid(fft_valid),
      .done(done),
      .freq({ freq[3], freq[2],
          freq[1], freq[0] }),
      .fft_d1({ fft_d1[31], fft_d1[30], fft_d1[29], fft_d1[28], fft_d1[27],
          fft_d1[26], fft_d1[25], fft_d1[24], fft_d1[23], fft_d1[22], fft_d1[21],
          fft_d1[20], fft_d1[19], fft_d1[18], fft_d1[17], fft_d1[16], fft_d1[15],
          fft_d1[14], fft_d1[13], fft_d1[12], fft_d1[11], fft_d1[10], fft_d1[9],
          fft_d1[8], fft_d1[7], fft_d1[6], fft_d1[5], fft_d1[4], fft_d1[3], fft_d1[2],
          fft_d1[1], fft_d1[0] }),
      .fft_d2({ fft_d2[31], fft_d2[30], fft_d2[29], fft_d2[28],
          fft_d2[27], fft_d2[26], fft_d2[25], fft_d2[24], fft_d2[23], fft_d2[22],
          fft_d2[21], fft_d2[20], fft_d2[19], fft_d2[18], fft_d2[17], fft_d2[16],
          fft_d2[15], fft_d2[14], fft_d2[13], fft_d2[12], fft_d2[11], fft_d2[10],
          fft_d2[9], fft_d2[8], fft_d2[7], fft_d2[6], fft_d2[5], fft_d2[4], fft_d2[3],
          fft_d2[2], fft_d2[1], fft_d2[0] }),
      .fft_d3({ fft_d3[31], fft_d3[30], fft_d3[29],
          fft_d3[28], fft_d3[27], fft_d3[26], fft_d3[25], fft_d3[24], fft_d3[23],
          fft_d3[22], fft_d3[21], fft_d3[20], fft_d3[19], fft_d3[18], fft_d3[17],
          fft_d3[16], fft_d3[15], fft_d3[14], fft_d3[13], fft_d3[12], fft_d3[11],
          fft_d3[10], fft_d3[9], fft_d3[8], fft_d3[7], fft_d3[6], fft_d3[5], fft_d3[4],
          fft_d3[3], fft_d3[2], fft_d3[1], fft_d3[0] }),
      .fft_d4({ fft_d4[31], fft_d4[30],
          fft_d4[29], fft_d4[28], fft_d4[27], fft_d4[26], fft_d4[25], fft_d4[24],
          fft_d4[23], fft_d4[22], fft_d4[21], fft_d4[20], fft_d4[19], fft_d4[18],
          fft_d4[17], fft_d4[16], fft_d4[15], fft_d4[14], fft_d4[13], fft_d4[12],
          fft_d4[11], fft_d4[10], fft_d4[9], fft_d4[8], fft_d4[7], fft_d4[6], fft_d4[5],
          fft_d4[4], fft_d4[3], fft_d4[2], fft_d4[1], fft_d4[0] }),
      .fft_d5({ fft_d5[31], fft_d5[30],
          fft_d5[29], fft_d5[28], fft_d5[27], fft_d5[26], fft_d5[25], fft_d5[24],
          fft_d5[23], fft_d5[22], fft_d5[21], fft_d5[20], fft_d5[19], fft_d5[18],
          fft_d5[17], fft_d5[16], fft_d5[15], fft_d5[14], fft_d5[13], fft_d5[12],
          fft_d5[11], fft_d5[10], fft_d5[9], fft_d5[8], fft_d5[7], fft_d5[6], fft_d5[5],
          fft_d5[4], fft_d5[3], fft_d5[2], fft_d5[1], fft_d5[0] }),
      .fft_d6({ fft_d6[31], fft_d6[30],
          fft_d6[29], fft_d6[28], fft_d6[27], fft_d6[26], fft_d6[25], fft_d6[24],
          fft_d6[23], fft_d6[22], fft_d6[21], fft_d6[20], fft_d6[19], fft_d6[18],
          fft_d6[17], fft_d6[16], fft_d6[15], fft_d6[14], fft_d6[13], fft_d6[12],
          fft_d6[11], fft_d6[10], fft_d6[9], fft_d6[8], fft_d6[7], fft_d6[6], fft_d6[5],
          fft_d6[4], fft_d6[3], fft_d6[2], fft_d6[1], fft_d6[0] }),
      .fft_d7({ fft_d7[31], fft_d7[30],
          fft_d7[29], fft_d7[28], fft_d7[27], fft_d7[26], fft_d7[25], fft_d7[24],
          fft_d7[23], fft_d7[22], fft_d7[21], fft_d7[20], fft_d7[19], fft_d7[18],
          fft_d7[17], fft_d7[16], fft_d7[15], fft_d7[14], fft_d7[13], fft_d7[12],
          fft_d7[11], fft_d7[10], fft_d7[9], fft_d7[8], fft_d7[7], fft_d7[6], fft_d7[5],
          fft_d7[4], fft_d7[3], fft_d7[2], fft_d7[1], fft_d7[0] }),
      .fft_d8({ fft_d8[31], fft_d8[30],
          fft_d8[29], fft_d8[28], fft_d8[27], fft_d8[26], fft_d8[25], fft_d8[24],
          fft_d8[23], fft_d8[22], fft_d8[21], fft_d8[20], fft_d8[19], fft_d8[18],
          fft_d8[17], fft_d8[16], fft_d8[15], fft_d8[14], fft_d8[13], fft_d8[12],
          fft_d8[11], fft_d8[10], fft_d8[9], fft_d8[8], fft_d8[7], fft_d8[6], fft_d8[5],
          fft_d8[4], fft_d8[3], fft_d8[2], fft_d8[1], fft_d8[0] }),
      .fft_d9({ fft_d9[31], fft_d9[30],
          fft_d9[29], fft_d9[28], fft_d9[27], fft_d9[26], fft_d9[25], fft_d9[24],
          fft_d9[23], fft_d9[22], fft_d9[21], fft_d9[20], fft_d9[19], fft_d9[18],
          fft_d9[17], fft_d9[16], fft_d9[15], fft_d9[14], fft_d9[13], fft_d9[12],
          fft_d9[11], fft_d9[10], fft_d9[9], fft_d9[8], fft_d9[7], fft_d9[6], fft_d9[5],
          fft_d9[4], fft_d9[3], fft_d9[2], fft_d9[1], fft_d9[0] }),
      .fft_d10({ fft_d10[31],
          fft_d10[30], fft_d10[29], fft_d10[28], fft_d10[27], fft_d10[26], fft_d10[25],
          fft_d10[24], fft_d10[23], fft_d10[22], fft_d10[21], fft_d10[20], fft_d10[19],
          fft_d10[18], fft_d10[17], fft_d10[16], fft_d10[15], fft_d10[14], fft_d10[13],
          fft_d10[12], fft_d10[11], fft_d10[10], fft_d10[9], fft_d10[8], fft_d10[7],
          fft_d10[6], fft_d10[5], fft_d10[4], fft_d10[3], fft_d10[2], fft_d10[1],
          fft_d10[0] }),
      .fft_d11({ fft_d11[31], fft_d11[30], fft_d11[29], fft_d11[28], fft_d11[27],
          fft_d11[26], fft_d11[25], fft_d11[24], fft_d11[23], fft_d11[22], fft_d11[21],
          fft_d11[20], fft_d11[19], fft_d11[18], fft_d11[17], fft_d11[16], fft_d11[15],
          fft_d11[14], fft_d11[13], fft_d11[12], fft_d11[11], fft_d11[10], fft_d11[9],
          fft_d11[8], fft_d11[7], fft_d11[6], fft_d11[5], fft_d11[4], fft_d11[3],
          fft_d11[2], fft_d11[1], fft_d11[0] }),
      .fft_d12({ fft_d12[31], fft_d12[30], fft_d12[29],
          fft_d12[28], fft_d12[27], fft_d12[26], fft_d12[25], fft_d12[24], fft_d12[23],
          fft_d12[22], fft_d12[21], fft_d12[20], fft_d12[19], fft_d12[18], fft_d12[17],
          fft_d12[16], fft_d12[15], fft_d12[14], fft_d12[13], fft_d12[12], fft_d12[11],
          fft_d12[10], fft_d12[9], fft_d12[8], fft_d12[7], fft_d12[6], fft_d12[5],
          fft_d12[4], fft_d12[3], fft_d12[2], fft_d12[1], fft_d12[0] }),
      .fft_d13({ fft_d13[31],
          fft_d13[30], fft_d13[29], fft_d13[28], fft_d13[27], fft_d13[26], fft_d13[25],
          fft_d13[24], fft_d13[23], fft_d13[22], fft_d13[21], fft_d13[20], fft_d13[19],
          fft_d13[18], fft_d13[17], fft_d13[16], fft_d13[15], fft_d13[14], fft_d13[13],
          fft_d13[12], fft_d13[11], fft_d13[10], fft_d13[9], fft_d13[8], fft_d13[7],
          fft_d13[6], fft_d13[5], fft_d13[4], fft_d13[3], fft_d13[2], fft_d13[1],
          fft_d13[0] }),
      .fft_d14({ fft_d14[31], fft_d14[30], fft_d14[29], fft_d14[28], fft_d14[27],
          fft_d14[26], fft_d14[25], fft_d14[24], fft_d14[23], fft_d14[22], fft_d14[21],
          fft_d14[20], fft_d14[19], fft_d14[18], fft_d14[17], fft_d14[16], fft_d14[15],
          fft_d14[14], fft_d14[13], fft_d14[12], fft_d14[11], fft_d14[10], fft_d14[9],
          fft_d14[8], fft_d14[7], fft_d14[6], fft_d14[5], fft_d14[4], fft_d14[3],
          fft_d14[2], fft_d14[1], fft_d14[0] }),
      .fft_d15({ fft_d15[31], fft_d15[30], fft_d15[29],
          fft_d15[28], fft_d15[27], fft_d15[26], fft_d15[25], fft_d15[24], fft_d15[23],
          fft_d15[22], fft_d15[21], fft_d15[20], fft_d15[19], fft_d15[18], fft_d15[17],
          fft_d15[16], fft_d15[15], fft_d15[14], fft_d15[13], fft_d15[12], fft_d15[11],
          fft_d15[10], fft_d15[9], fft_d15[8], fft_d15[7], fft_d15[6], fft_d15[5],
          fft_d15[4], fft_d15[3], fft_d15[2], fft_d15[1], fft_d15[0] }),
      .fft_d0({ fft_d0[31],
          fft_d0[30], fft_d0[29], fft_d0[28], fft_d0[27], fft_d0[26], fft_d0[25],
          fft_d0[24], fft_d0[23], fft_d0[22], fft_d0[21], fft_d0[20], fft_d0[19],
          fft_d0[18], fft_d0[17], fft_d0[16], fft_d0[15], fft_d0[14], fft_d0[13],
          fft_d0[12], fft_d0[11], fft_d0[10], fft_d0[9], fft_d0[8], fft_d0[7], fft_d0[6],
          fft_d0[5], fft_d0[4], fft_d0[3], fft_d0[2], fft_d0[1], fft_d0[0] }),
      .test_si(test_si),
      .test_se(test_se)   );

   // STIL Direct Pattern Validate Access
   initial begin
      //
      // --- establish a default time format for %t
      //
      $timeformat(-9,2," ns",18);
      vector_number = 0;

      //
      // --- default verbosity to 0; use '+define+tmax_msg=N' on verilog compile line to change.
      //
      `ifdef tmax_msg
         verbose = `tmax_msg ;
      `else
         verbose = 0 ;
      `endif

      //
      // --- default pattern reporting interval is every 5 patterns;
      //     use '+define+tmax_rpt=N' on verilog compile line to change.
      //
      `ifdef tmax_rpt
         report_interval = `tmax_rpt ;
      `else
         report_interval = 5 ;
      `endif

      //
      // --- support generating Extened VCD output by using
      //     '+define+tmax_vcde' on verilog compile line.
      //
      `ifdef tmax_vcde
         // extended VCD, see Verilog specification, IEEE Std. 1364-2001 section 18.3
         if (verbose >= 1) $display("// %t : opening Extended VCD output file", $time);
         $dumpports( dut, "sim_vcde.out");
      `endif

      //
      // --- default miscompare messages are not formatted for TetraMAX diagnostics;
      //     use '+define+tmax_diag=N' on verilog compile line to format errors for diagnostics.
      //
      `ifdef tmax_diag
         diagnostic_msg = `tmax_diag ;
      `else
         diagnostic_msg = 0 ;
      `endif

      // '+define+tmax_parallel=N' on the command line overrides default simulation, using parallel load
      //   with N serial vectors at the end of each Shift
      // '+define+tmax_serial=M' on the command line forces M initial serial patterns,
      //   followed by the remainder in parallel (with N serial vectors if tmax_parallel is also specified)

      // +define+tmax_par_force_time on the command line overrides default parallel check/load time
      `ifdef tmax_par_force_time
         $STILDPV_parallel(,,,`tmax_par_force_time);
      `endif

      // TetraMAX parallel-mode simulation required for these patterns
      `ifdef tmax_parallel
         // +define+tmax_serial_timing on the command line overrides default minimal-time for parallel load behavior
         `ifdef tmax_serial_timing
         `else
            $STILDPV_parallel(,,0); // apply minimal time advance for parallel load_unload
            // if tmax_serial_timing is defined, use equivalent serial load_unload time advance
         `endif
         `ifdef tmax_serial
            $STILDPV_parallel(`tmax_parallel,`tmax_serial);
         `else
            $STILDPV_parallel(`tmax_parallel,0);
         `endif
      `else
         `ifdef tmax_serial
            // +define+tmax_serial_timing on the command line overrides default minimal-time for parallel load behavior
            `ifdef tmax_serial_timing
            `else
               $STILDPV_parallel(,,0); // apply minimal time advance for parallel load_unload
               // if tmax_serial_timing is defined, use equivalent serial load_unload time advance
            `endif
            $STILDPV_parallel(0,`tmax_serial);
         `else
            // default serial mode
         `endif
      `endif

      if (verbose>3)      $STILDPV_trace(1,1,1,1,1,report_interval,diagnostic_msg); // verbose=4; + trace each Vector
      else if (verbose>2) $STILDPV_trace(1,0,1,1,1,report_interval,diagnostic_msg); // verbose=3; + trace labels
      else if (verbose>1) $STILDPV_trace(0,0,1,1,1,report_interval,diagnostic_msg); // verbose=2; + trace WFT-changes
      else if (verbose>0) $STILDPV_trace(0,0,1,0,1,report_interval,diagnostic_msg); // verbose=1; + trace proc/macro entries
      else                $STILDPV_trace(0,0,0,0,0,report_interval,diagnostic_msg); // verbose=0; only pattern-interval

      $STILDPV_setup( "FAS_atpg.stil",,,"FAS_test.dut" );
      while ( !$STILDPV_done()) #($STILDPV_run( pattern_number, vector_number ));
      $display("Time %t: STIL simulation data completed.",$time);
      $finish; // comment this out if you terminate the simulation from other activities
   end

   // STIL Direct Pattern Validate Trace Options
   // The STILDPV_trace() function takes '1' to enable a trace and '0' to disable.
   // Unspecified arguments maintain their current state. Tracing may be changed at any time.
   // The following arguments control tracing of:
   // 1st argument: enable or disable tracing of all STIL labels
   // 2nd argument: enable or disable tracing of each STIL Vector and current Vector count
   // 3rd argument: enable or disable tracing of each additional Thread (new Pattern)
   // 4th argument: enable or disable tracing of each WaveformTable change
   // 5th argument: enable or disable tracing of each Procedure or Macro entry
   // 6th argument: interval to print starting pattern messages; 0 to disable
   // For example, a separate initial block may be used to control these options
   // (uncomment and change time values to use):
   // initial begin
   //    #800000 $STILDPV_trace(1,1);
   //    #600000 $STILDPV_trace(,0);
   // Additional calls to $STILDPV_parallel() may also be defined to change parallel/serial
   // operation during simulation. Any additional calls need a # time value.
   // 1st integer is number of serial (flat) cycles to simulate at end of each shift
   // 2nd integer is TetraMAX pattern number (starting at zero) to start parallel load
   // 3rd optional value '1' will advance time during the load_unload the same as a serial
   //     shift operation (with no events during that time), '0' will advance minimal time
   //     (1 shift vector) during the parallel load_unload.
   // For example,
   //    #8000 $STILDPV_parallel( 2,10 );
   // end // of initial block with additional trace/parallel options
endmodule
