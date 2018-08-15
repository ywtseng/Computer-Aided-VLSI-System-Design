/*module  FAS (data_valid, data, clk, rst, fir_d, fir_valid, fft_valid, done, freq,
	 fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8,
	 fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0);*/

	 

	 
module  FAS (data_valid, data, clk, rst, done, freq);

	input clk, rst;
	input data_valid;
	input signed [15:0] data; 

	//output fir_valid, fft_valid;
	//output [15:0] fir_d;
	//output [31:0] fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8;
	//output [31:0] fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0;
	
	output done;
	output [3:0] freq;
	
	
	reg [35:0] d01,d02,d03,d04,d05,d06,d07,d08,d09,d10,d11,d12,d13,d14,d15,d16 ;
	reg [35:0] d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,d32 ;
	reg [5:0] counter ;
	reg FIR_STATE ;
	reg fir_valid ;
	reg [15:0] fir_d ;
	//wire [31:0] fir_out;
	
	`include "./dat/FIR_coefficient.dat"

//********************************* FIR *********************************//	

	wire [35:0] hd01,hd02,hd03,hd04,hd05,hd06,hd07,hd08,hd09,hd10,hd11,hd12,hd13,hd14,hd15,hd16 ;
	wire [35:0] hd17,hd18,hd19,hd20,hd21,hd22,hd23,hd24,hd25,hd26,hd27,hd28,hd29,hd30,hd31,hd32 ;
	wire [35:0] hd_a01,hd_a02,hd_a03,hd_a04,hd_a05,hd_a06,hd_a07,hd_a08,hd_a09,hd_a10,hd_a11,hd_a12,hd_a13,hd_a14,hd_a15,hd_a16 ;
	wire [35:0] hd_a17,hd_a18,hd_a19,hd_a20,hd_a21,hd_a22,hd_a23,hd_a24,hd_a25,hd_a26,hd_a27,hd_a28,hd_a29,hd_a30,hd_a31,hd_a32 ;
	
	assign hd01 = data * FIR_C00 ;
	assign hd02 = data * FIR_C01 ;
	assign hd03 = data * FIR_C02 ;
	assign hd04 = data * FIR_C03 ;
	assign hd05 = data * FIR_C04 ;
	assign hd06 = data * FIR_C05 ;
	assign hd07 = data * FIR_C06 ;
	assign hd08 = data * FIR_C07 ;
	assign hd09 = data * FIR_C08 ;
	assign hd10 = data * FIR_C09 ;
	assign hd11 = data * FIR_C10 ;
	assign hd12 = data * FIR_C11 ;
	assign hd13 = data * FIR_C12 ;
	assign hd14 = data * FIR_C13 ;
	assign hd15 = data * FIR_C14 ;
	assign hd16 = data * FIR_C15 ;
	assign hd17 = hd16 ;
	assign hd18 = hd15 ;
	assign hd19 = hd14 ;
	assign hd20 = hd13 ;
	assign hd21 = hd12 ;
	assign hd22 = hd11 ;
	assign hd23 = hd10 ;
	assign hd24 = hd09 ;
	assign hd25 = hd08 ;
	assign hd26 = hd07 ;
	assign hd27 = hd06 ;
	assign hd28 = hd05 ;
	assign hd29 = hd04 ;
	assign hd30 = hd03 ;
	assign hd31 = hd02 ;
	assign hd32 = hd01 ;
	
	assign hd_a01 = hd01 ;
	assign hd_a02 = hd02 + d01 ;
	assign hd_a03 = hd03 + d02 ;
	assign hd_a04 = hd04 + d03 ;
	assign hd_a05 = hd05 + d04 ;
	assign hd_a06 = hd06 + d05 ;
	assign hd_a07 = hd07 + d06 ;
	assign hd_a08 = hd08 + d07 ;
	assign hd_a09 = hd09 + d08 ;
	assign hd_a10 = hd10 + d09 ;
	assign hd_a11 = hd11 + d10 ;
	assign hd_a12 = hd12 + d11 ;
	assign hd_a13 = hd13 + d12 ;
	assign hd_a14 = hd14 + d13 ;
	assign hd_a15 = hd15 + d14 ;
	assign hd_a16 = hd16 + d15 ;
	assign hd_a17 = hd17 + d16 ;
	assign hd_a18 = hd18 + d17 ;
	assign hd_a19 = hd19 + d18 ;
	assign hd_a20 = hd20 + d19 ;
	assign hd_a21 = hd21 + d20 ;
	assign hd_a22 = hd22 + d21 ;
	assign hd_a23 = hd23 + d22 ;
	assign hd_a24 = hd24 + d23 ;
	assign hd_a25 = hd25 + d24 ;
	assign hd_a26 = hd26 + d25 ;
	assign hd_a27 = hd27 + d26 ;
	assign hd_a28 = hd28 + d27 ;
	assign hd_a29 = hd29 + d28 ;
	assign hd_a30 = hd30 + d29 ;
	assign hd_a31 = hd31 + d30 ;
	assign hd_a32 = hd32 + d31 ;
	
	//assign fir_d = d32[31:16] ;
	always@(*) begin
		if(d32[31] == 1'b1) fir_d = d32[31:16] + 16'd1 ;
		else 				fir_d = d32[31:16] ;
	end

	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			d01	<= 28'd0 ;
			d02	<= 28'd0 ;
			d03 <= 28'd0 ;
			d04 <= 28'd0 ;
			d05 <= 28'd0 ;
			d06 <= 28'd0 ;
			d07 <= 28'd0 ;
			d08 <= 28'd0 ;
			d09 <= 28'd0 ;
			d10 <= 28'd0 ;	
			d11 <= 28'd0 ;	
			d12 <= 28'd0 ;	
			d13 <= 28'd0 ;	
			d14 <= 28'd0 ;	
			d15 <= 28'd0 ;	
			d16 <= 28'd0 ;	
			d17 <= 28'd0 ;	
			d18 <= 28'd0 ;	
			d19 <= 28'd0 ;	
			d20 <= 28'd0 ;	
			d21 <= 28'd0 ;	
			d22 <= 28'd0 ;	
			d23 <= 28'd0 ;	
			d24 <= 28'd0 ;	
			d25 <= 28'd0 ;	
			d26	<= 28'd0 ;
			d27	<= 28'd0 ;
			d28	<= 28'd0 ;
			d29	<= 28'd0 ;
			d30	<= 28'd0 ;
			d31	<= 28'd0 ;
			d32 <= 28'd0 ;
		end
		
		else begin
			if(data_valid == 1'b1) begin
				d01	<= hd_a01 ;
				d02	<= hd_a02 ;
				d03 <= hd_a03 ;
				d04 <= hd_a04 ;
				d05 <= hd_a05 ;
				d06 <= hd_a06 ;
				d07 <= hd_a07 ;
				d08 <= hd_a08 ;
				d09 <= hd_a09 ;
				d10 <= hd_a10 ;	
				d11 <= hd_a11 ;	
				d12 <= hd_a12 ;	
				d13 <= hd_a13 ;	
				d14 <= hd_a14 ;	
				d15 <= hd_a15 ;	
				d16 <= hd_a16 ;	
				d17 <= hd_a17 ;	
				d18 <= hd_a18 ;	
				d19 <= hd_a19 ;	
				d20 <= hd_a20 ;	
				d21 <= hd_a21 ;	
				d22 <= hd_a22 ;	
				d23 <= hd_a23 ;	
				d24 <= hd_a24 ;	
				d25 <= hd_a25 ;	
				d26	<= hd_a26 ;
				d27	<= hd_a27 ;
				d28	<= hd_a28 ;
				d29	<= hd_a29 ;
				d30	<= hd_a30 ;
				d31	<= hd_a31 ;
				d32 <= hd_a32 ;

			end
			
			else begin
				d01	<= d01 ;
				d02	<= d02 ;
				d03 <= d03 ;
				d04 <= d04 ;
				d05 <= d05 ;
				d06 <= d06 ;
				d07 <= d07 ;
				d08 <= d08 ;
				d09 <= d09 ;
				d10 <= d10 ;	
				d11 <= d11 ;	
				d12 <= d12 ;	
				d13 <= d13 ;	
				d14 <= d14 ;	
				d15 <= d15 ;	
				d16 <= d16 ;	
				d17 <= d17 ;	
				d18 <= d18 ;	
				d19 <= d19 ;	
				d20 <= d20 ;	
				d21 <= d21 ;	
				d22 <= d22 ;	
				d23 <= d23 ;	
				d24 <= d24 ;	
				d25 <= d25 ;	
				d26	<= d26 ;
				d27	<= d27 ;
				d28	<= d28 ;
				d29	<= d29 ;
				d30	<= d30 ;
				d31	<= d31 ;
				d32 <= d32 ;
			end
		end
	end

	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			FIR_STATE <= 1'b0 ;
			fir_valid <= 1'b0 ;
		end
		
		else begin
			if(FIR_STATE == 1'b0 ) begin  // Before entering 31th data
				if(data_valid == 1'b1) begin
					fir_valid <= 1'b0 ;
					if(counter == 6'd31) FIR_STATE <= 1'b1 ;
					else 				 FIR_STATE <= FIR_STATE ;
				end
				
				else begin
					FIR_STATE <= FIR_STATE ;
					fir_valid <= fir_valid ;
				end
			end
			
			else begin	// After entering 31th data
				if(data_valid == 1'b1) begin
					fir_valid <= 1'b1 ;
					FIR_STATE <= FIR_STATE ;
				end
				else begin
					FIR_STATE <= FIR_STATE ;
					fir_valid <= fir_valid ;
				end
			end
		end

	end
//********************************* Counter *********************************//
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) counter <= 6'd0 ;

		else begin
			if(FIR_STATE == 1'b0 ) begin  // Before entering 31th data
				if(data_valid == 1'b1) counter <= counter + 6'd1 ;
				else counter <= counter ;
			end
			
			else begin	// After entering 31th data
				if(data_valid == 1'b1) counter <= counter + 6'd1 ;
				else counter <= 6'd0 ;
			end
		end

	end

//********************************* FFT *********************************//	
	
	
//Stage_1_BF2I
	reg [15:0] BF2I_a00_r,BF2I_a01_r,BF2I_a02_r,BF2I_a03_r,BF2I_a04_r,BF2I_a05_r,BF2I_a06_r,BF2I_a07_r ;
	reg [15:0] BF2I_a_er_n,BF2I_a_er_nadd8 ;
	wire [15:0] BF2I_a_xr_n,BF2I_a_xr_nadd8 ;
	reg BF2I_a_s ;
	
	assign BF2I_a_xr_nadd8 = fir_d  ;
	assign BF2I_a_xr_n =  BF2I_a00_r ;

	always@(*) begin
		if(BF2I_a_s == 1'b1) begin
			
			BF2I_a_er_n = BF2I_a_xr_n + BF2I_a_xr_nadd8 ;
			BF2I_a_er_nadd8 = BF2I_a_xr_n - BF2I_a_xr_nadd8 ;
		end
		
		else begin
			BF2I_a_er_n = BF2I_a_xr_n ;
			BF2I_a_er_nadd8 = BF2I_a_xr_nadd8 ;
		end
	end
	
	//Stage_1_BF2I_Register
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			BF2I_a00_r <= 16'b0 ;
			BF2I_a01_r <= 16'b0 ;
			BF2I_a02_r <= 16'b0 ;
			BF2I_a03_r <= 16'b0 ;
			BF2I_a04_r <= 16'b0 ;
			BF2I_a05_r <= 16'b0 ;
			BF2I_a06_r <= 16'b0 ;
			BF2I_a07_r <= 16'b0 ;
		end
		
		else begin
			if(fir_valid == 1'b0) begin
				BF2I_a00_r <= BF2I_a00_r ;
				BF2I_a01_r <= BF2I_a01_r ;
				BF2I_a02_r <= BF2I_a02_r ;
				BF2I_a03_r <= BF2I_a03_r ;
				BF2I_a04_r <= BF2I_a04_r ;
				BF2I_a05_r <= BF2I_a05_r ;
				BF2I_a06_r <= BF2I_a06_r ;
				BF2I_a07_r <= BF2I_a07_r ;
			end
			
			else begin
				BF2I_a00_r <= BF2I_a01_r ;
				BF2I_a01_r <= BF2I_a02_r ;
				BF2I_a02_r <= BF2I_a03_r ;
				BF2I_a03_r <= BF2I_a04_r ;
				BF2I_a04_r <= BF2I_a05_r ;
				BF2I_a05_r <= BF2I_a06_r ;
				BF2I_a06_r <= BF2I_a07_r ;
				BF2I_a07_r <= BF2I_a_er_nadd8 ;
			end
		end
	end
	
	//Stage_1_BF2I_Selector
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) BF2I_a_s <= 1'b0 ;
		else begin
			if(counter[3] == 0) BF2I_a_s <= 1'b0 ;
			else BF2I_a_s <= 1'b1 ;
		end
	end

//Stage_1_BF2II
	reg [15:0] BF2II_a00_r,BF2II_a01_r,BF2II_a02_r,BF2II_a03_r ;
	reg [15:0] BF2II_a00_i,BF2II_a01_i,BF2II_a02_i,BF2II_a03_i ;
	reg [15:0] BF2II_a_er_n,BF2II_a_er_nadd8 ;
	reg [15:0] BF2II_a_ei_n,BF2II_a_ei_nadd8 ;
	wire [15:0] BF2II_a_xr_n,BF2II_a_xr_nadd8 ;
	wire [15:0] BF2II_a_xi_n,BF2II_a_xi_nadd8 ;
	wire BF2II_a_t ;
	reg BF2II_a_s ;
	
	assign BF2II_a_xr_nadd8 = BF2I_a_er_n ;
	assign BF2II_a_xi_nadd8 = 16'd0 ;
	assign BF2II_a_xr_n =  BF2II_a00_r ;
	assign BF2II_a_xi_n =  BF2II_a00_i ;
	assign BF2II_a_t = BF2I_a_s ;
	
	always@(*) begin
		if(BF2II_a_s == 1'b1 && BF2II_a_t == 1'b1) begin
			BF2II_a_er_n = BF2II_a_xr_n + BF2II_a_xr_nadd8 ;
			BF2II_a_ei_n = BF2II_a_xi_n + BF2II_a_xi_nadd8 ;
			BF2II_a_er_nadd8 = BF2II_a_xr_n - BF2II_a_xr_nadd8 ;
			BF2II_a_ei_nadd8 = BF2II_a_xi_n - BF2II_a_xi_nadd8 ;
		end	
		
		else if(BF2II_a_s == 1'b1 && BF2II_a_t == 1'b0) begin
			BF2II_a_er_n = BF2II_a_xr_n + BF2II_a_xi_nadd8 ;
			BF2II_a_ei_n = BF2II_a_xi_n - BF2II_a_xr_nadd8 ;
			BF2II_a_er_nadd8 = BF2II_a_xr_n - BF2II_a_xi_nadd8 ;
			BF2II_a_ei_nadd8 = BF2II_a_xi_n + BF2II_a_xr_nadd8 ;
		end
		
		else begin
			BF2II_a_er_n = BF2II_a_xr_n ;
			BF2II_a_ei_n = BF2II_a_xi_n ;
			BF2II_a_er_nadd8 = BF2II_a_xr_nadd8 ;
			BF2II_a_ei_nadd8 = BF2II_a_xi_nadd8 ;
		
		end
	end
	
	//Stage_1_BF2II_Register
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			BF2II_a00_r <= 16'b0 ;
			BF2II_a01_r <= 16'b0 ;
			BF2II_a02_r <= 16'b0 ;
			BF2II_a03_r <= 16'b0 ;
			BF2II_a00_i <= 16'b0 ;
			BF2II_a01_i <= 16'b0 ;
			BF2II_a02_i <= 16'b0 ;
			BF2II_a03_i <= 16'b0 ;
		end
		
		else begin
			if(fir_valid == 1'b0) begin
				BF2II_a00_r <= BF2II_a00_r ;
				BF2II_a01_r <= BF2II_a01_r ;
				BF2II_a02_r <= BF2II_a02_r ;
				BF2II_a03_r <= BF2II_a03_r ;
				BF2II_a00_i <= BF2II_a00_i ;
				BF2II_a01_i <= BF2II_a01_i ;
				BF2II_a02_i <= BF2II_a02_i ;
				BF2II_a03_i <= BF2II_a03_i ;
			end
			
			else begin
				BF2II_a00_r <= BF2II_a01_r ;
				BF2II_a01_r <= BF2II_a02_r ;
				BF2II_a02_r <= BF2II_a03_r ;
				BF2II_a03_r <= BF2II_a_er_nadd8 ;
				BF2II_a00_i <= BF2II_a01_i ;
				BF2II_a01_i <= BF2II_a02_i ;
				BF2II_a02_i <= BF2II_a03_i ;
				BF2II_a03_i <= BF2II_a_ei_nadd8 ;
			end
		end
	end
	
	//Stage_1_BF2II_Selector
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) BF2II_a_s <= 1'b0 ;
		else begin
			if(counter[2] == 0) BF2II_a_s <= 1'b0 ;
			else BF2II_a_s <= 1'b1 ;
		end
	end

	
//Multiplier
	wire signed [15:0] multiplicand_r , multiplicand_i ;
	reg signed [31:0] multiplier_r , multiplier_i ;
	wire [47:0] result_r , result_i ;
	
	assign multiplicand_r = BF2II_a_er_n ;
	assign multiplicand_i = BF2II_a_ei_n ;
	assign result_r = multiplicand_r * multiplier_r - multiplicand_i * multiplier_i ;
	assign result_i = multiplicand_i * multiplier_r + multiplicand_r * multiplier_i ;
	
	always@(*) begin
		if(counter[3:0] == 4'h2) begin  
			multiplier_r = 32'h0000B504 ;
			multiplier_i = 32'hFFFF4AFC ;
		end
		
		else if(counter[3:0] == 4'h3) begin
			multiplier_r = 32'h00000000 ;
			multiplier_i = 32'hFFFF0000 ;
		end
		
		else if(counter[3:0] == 4'h4) begin
			multiplier_r = 32'hFFFF4AFC ;
			multiplier_i = 32'hFFFF4AFC ;
		end
		
		else if(counter[3:0] == 4'h6) begin
			multiplier_r = 32'h0000EC83 ;
			multiplier_i = 32'hFFFF9E09 ;
		end
		
		else if(counter[3:0] == 4'h7) begin
			multiplier_r = 32'h0000B504 ;
			multiplier_i = 32'hFFFF4AFC ;
		end
		
		else if(counter[3:0] == 4'h8) begin
			multiplier_r = 32'h000061F7 ;
			multiplier_i = 32'hFFFF137D ;
		end
		
		else if(counter[3:0] == 4'ha) begin
			multiplier_r = 32'h000061F7 ;
			multiplier_i = 32'hFFFF137D ;
		end
		
		else if(counter[3:0] == 4'hb) begin
			multiplier_r = 32'hFFFF4AFC ;
			multiplier_i = 32'hFFFF4AFC ;
		end
		
		else if(counter[3:0] == 4'hc) begin
			multiplier_r = ~32'h0000EC83 + 32'd1 ;
			multiplier_i = ~32'hFFFF9E09 + 32'd1 ;
		end
		
		else begin
			multiplier_r = 32'h00010000 ;
			multiplier_i = 32'h00000000 ;
		end
	end
	

//Stage_2_BF2I	
	reg [31:0] BF2I_b00_r,BF2I_b01_r ;
	reg [31:0] BF2I_b00_i,BF2I_b01_i ;
	reg [31:0] BF2I_b_er_n,BF2I_b_er_nadd2 ;
	reg [31:0] BF2I_b_ei_n,BF2I_b_ei_nadd2 ;
	wire [31:0] BF2I_b_xr_n,BF2I_b_xr_nadd2 ;
	wire [31:0] BF2I_b_xi_n,BF2I_b_xi_nadd2 ;
	reg BF2I_b_s ;
	
	assign BF2I_b_xr_nadd2 = result_r [31:0] ;
	assign BF2I_b_xi_nadd2 = result_i [31:0] ;
	assign BF2I_b_xr_n =  BF2I_b00_r ;
	assign BF2I_b_xi_n =  BF2I_b00_i ;
	
	always@(*) begin
		if(BF2I_b_s == 1'b1) begin
			BF2I_b_er_n = BF2I_b_xr_n + BF2I_b_xr_nadd2 ;
			BF2I_b_ei_n = BF2I_b_xi_n + BF2I_b_xi_nadd2 ;
			BF2I_b_er_nadd2 = BF2I_b_xr_n - BF2I_b_xr_nadd2 ;
			BF2I_b_ei_nadd2 = BF2I_b_xi_n - BF2I_b_xi_nadd2 ;
		end
		
		else begin
			BF2I_b_er_n = BF2I_b_xr_n ;
			BF2I_b_ei_n = BF2I_b_xi_n ;
			BF2I_b_er_nadd2 = BF2I_b_xr_nadd2 ;
			BF2I_b_ei_nadd2 = BF2I_b_xi_nadd2 ;
		
		end
	end
	
	//Stage_2_BF2I_Register
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			BF2I_b00_r <= 32'b0 ;
			BF2I_b01_r <= 32'b0 ;
			BF2I_b00_i <= 32'b0 ;
			BF2I_b01_i <= 32'b0 ;
		end
		
		else begin
			if(fir_valid == 1'b0) begin
				BF2I_b00_r <= BF2I_b00_r ;
				BF2I_b01_r <= BF2I_b01_r ;
				BF2I_b00_i <= BF2I_b00_i ;
				BF2I_b01_i <= BF2I_b01_i ;

			end
			
			else begin
				BF2I_b00_r <= BF2I_b01_r ;
				BF2I_b01_r <= BF2I_b_er_nadd2 ;
				BF2I_b00_i <= BF2I_b01_i ;
				BF2I_b01_i <= BF2I_b_ei_nadd2 ;
			end
		end
	end
	
	//Stage_2_BF2I_Selector
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) BF2I_b_s <= 1'b0 ;
		else begin
			if(counter[1] == 1'b0) BF2I_b_s <= 1'b0 ;
			else BF2I_b_s <= 1'b1 ;
		end
	end
	
	

//Stage_2_BF2II
	reg [31:0] BF2II_b00_r ;
	reg [31:0] BF2II_b00_i ;
	reg [31:0] BF2II_b_er_n,BF2II_b_er_nadd1 ;
	reg [31:0] BF2II_b_ei_n,BF2II_b_ei_nadd1 ;
	wire [31:0] BF2II_b_xr_n,BF2II_b_xr_nadd1 ;
	wire [31:0] BF2II_b_xi_n,BF2II_b_xi_nadd1 ;
	wire BF2II_b_t ;
	reg BF2II_b_s ;
	
	assign BF2II_b_xr_nadd1 = BF2I_b_er_n ;
	assign BF2II_b_xi_nadd1 = BF2I_b_ei_n ;
	assign BF2II_b_xr_n =  BF2II_b00_r ;
	assign BF2II_b_xi_n =  BF2II_b00_i ;
	assign BF2II_b_t = BF2I_b_s ;
	
	always@(*) begin
		if(BF2II_b_s == 1'b1 && BF2II_b_t == 1'b1) begin
			BF2II_b_er_n = BF2II_b_xr_n + BF2II_b_xr_nadd1 ;
			BF2II_b_ei_n = BF2II_b_xi_n + BF2II_b_xi_nadd1 ;
			BF2II_b_er_nadd1 = BF2II_b_xr_n - BF2II_b_xr_nadd1 ;
			BF2II_b_ei_nadd1 = BF2II_b_xi_n - BF2II_b_xi_nadd1 ;
		end	
		
		else if(BF2II_b_s == 1'b1 && BF2II_b_t == 1'b0) begin
			BF2II_b_er_n = BF2II_b_xr_n + BF2II_b_xi_nadd1 ;
			BF2II_b_ei_n = BF2II_b_xi_n - BF2II_b_xr_nadd1 ;
			BF2II_b_er_nadd1 = BF2II_b_xr_n - BF2II_b_xi_nadd1 ;
			BF2II_b_ei_nadd1 = BF2II_b_xi_n + BF2II_b_xr_nadd1 ;
		end
		
		else begin
			BF2II_b_er_n = BF2II_b_xr_n ;
			BF2II_b_ei_n = BF2II_b_xi_n ;
			BF2II_b_er_nadd1 = BF2II_b_xr_nadd1 ;
			BF2II_b_ei_nadd1 = BF2II_b_xi_nadd1 ;
		
		end
	end
	
	//Stage_2_BF2II_Register
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			BF2II_b00_r <= 32'b0 ;
			BF2II_b00_i <= 32'b0 ;
		end
		
		else begin
			if(fir_valid == 1'b0) begin
				BF2II_b00_r <= BF2II_b00_r ;
				BF2II_b00_i <= BF2II_b00_i ;
			end
			
			else begin
				BF2II_b00_r <= BF2II_b_er_nadd1 ;
				BF2II_b00_i <= BF2II_b_ei_nadd1 ;
			end
		end
	end
	
	//Stage_2_BF2II_Selector
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) BF2II_b_s <= 1'b0 ;
		else begin
			if(counter[0] == 0) BF2II_b_s <= 1'b0 ;
			else BF2II_b_s <= 1'b1 ;
		end
	end


//FFT Output
	reg fft_valid;
	reg [1:0] FFT_STATE ;
	reg [31:0] fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8;
	reg [31:0] fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0;
	reg [31:0] fft_d1_q, fft_d2_q, fft_d3_q, fft_d4_q, fft_d5_q, fft_d6_q, fft_d7_q, fft_d8_q;
	reg [31:0] fft_d9_q, fft_d10_q, fft_d11_q, fft_d12_q, fft_d13_q, fft_d14_q, fft_d15_q, fft_d0_q;
	
	always@(posedge clk or posedge rst) begin //FFT_STATE
		if(rst == 1'b1) FFT_STATE <= 2'b0 ;
	
		else begin
			if(FFT_STATE == 2'b0) begin
				if(counter == 6'd47) FFT_STATE <= 2'd1 ;
				else FFT_STATE <= FFT_STATE ;
			end
			
			else if(FFT_STATE == 2'd1) begin
				if(counter[3:0] == 4'h0) FFT_STATE <= 2'd2 ;
				else FFT_STATE <= FFT_STATE ;
			end
			
			else FFT_STATE <= FFT_STATE ;
		end
	end
	
	always@(posedge clk or posedge rst) begin //fft_d_q
		if(rst == 1'b1) begin
			fft_d0_q  <= 32'd0 ;
			fft_d1_q  <= 32'd0 ;
			fft_d2_q  <= 32'd0 ;
			fft_d3_q  <= 32'd0 ;
			fft_d4_q  <= 32'd0 ;
			fft_d5_q  <= 32'd0 ;
			fft_d6_q  <= 32'd0 ;
			fft_d7_q  <= 32'd0 ;
			fft_d8_q  <= 32'd0 ;
			fft_d9_q  <= 32'd0 ;
			fft_d10_q <= 32'd0 ;
			fft_d11_q <= 32'd0 ;
			fft_d12_q <= 32'd0 ;
			fft_d13_q <= 32'd0 ;
			fft_d14_q <= 32'd0 ;
			fft_d15_q <= 32'd0 ;
		end
		
		else begin
			if(FFT_STATE[1]||FFT_STATE[0] == 1'b1 & data_valid == 1'b1) begin
				fft_d0_q  <= fft_d8_q;
				fft_d8_q  <= fft_d4_q ;
				fft_d4_q  <= fft_d12_q ;
				fft_d12_q <= fft_d2_q ;
				fft_d2_q  <= fft_d10_q ;
				fft_d10_q <= fft_d6_q ;
				fft_d6_q  <= fft_d14_q ;
				fft_d14_q <= fft_d1_q ;
				fft_d1_q  <= fft_d9_q ;
				fft_d9_q  <= fft_d5_q ;
				fft_d5_q  <= fft_d13_q ;
				fft_d13_q <= fft_d3_q ;
				fft_d3_q  <= fft_d11_q ;
				fft_d11_q <= fft_d7_q ;
				fft_d7_q  <= fft_d15_q ;
				fft_d15_q <= { BF2II_b_er_n[31:16] , BF2II_b_ei_n[31:16] } ;
			end
			else begin
				fft_d0_q  <= fft_d0_q ;
				fft_d1_q  <= fft_d1_q ;
				fft_d2_q  <= fft_d2_q ;
				fft_d3_q  <= fft_d3_q ;
				fft_d4_q  <= fft_d4_q ;
				fft_d5_q  <= fft_d5_q ;
				fft_d6_q  <= fft_d6_q ;
				fft_d7_q  <= fft_d7_q ;
				fft_d8_q  <= fft_d8_q ;
				fft_d9_q  <= fft_d9_q ;
				fft_d10_q <= fft_d10_q ;
				fft_d11_q <= fft_d11_q ;
				fft_d12_q <= fft_d12_q ;
				fft_d13_q <= fft_d13_q ;
				fft_d14_q <= fft_d14_q ;
				fft_d15_q <= fft_d15_q ;
			end
		end
	end
	
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			fft_valid <= 1'b0 ;
			fft_d0  <= 32'd0 ;
			fft_d1  <= 32'd0 ;
			fft_d2  <= 32'd0 ;
			fft_d3  <= 32'd0 ;
			fft_d4  <= 32'd0 ;
			fft_d5  <= 32'd0 ;
			fft_d6  <= 32'd0 ;
			fft_d7  <= 32'd0 ;
			fft_d8  <= 32'd0 ;
			fft_d9  <= 32'd0 ;
			fft_d10 <= 32'd0 ;
			fft_d11 <= 32'd0 ;
			fft_d12 <= 32'd0 ;
			fft_d13 <= 32'd0 ;
			fft_d14 <= 32'd0 ;
			fft_d15 <= 32'd0 ;
		end
		
		else begin
			if(FFT_STATE == 2'd2 && counter[3:0] == 4'h0) begin
				fft_valid <= 1'b1 ;
				fft_d0  <= fft_d0_q ;
				fft_d1  <= fft_d1_q ;
				fft_d2  <= fft_d2_q ;
				fft_d3  <= fft_d3_q ;
				fft_d4  <= fft_d4_q ;
				fft_d5  <= fft_d5_q ;
				fft_d6  <= fft_d6_q ;
				fft_d7  <= fft_d7_q ;
				fft_d8  <= fft_d8_q ;
				fft_d9  <= fft_d9_q ;
				fft_d10 <= fft_d10_q ;
				fft_d11 <= fft_d11_q ;
				fft_d12 <= fft_d12_q ;
				fft_d13 <= fft_d13_q ;
				fft_d14 <= fft_d14_q ;
				fft_d15 <= fft_d15_q ;
			end
			
			else begin
				fft_valid <= 1'b0 ;
				fft_d0  <= 32'd0 ;
				fft_d1  <= 32'd0 ;
				fft_d2  <= 32'd0 ;
				fft_d3  <= 32'd0 ;
				fft_d4  <= 32'd0 ;
				fft_d5  <= 32'd0 ;
				fft_d6  <= 32'd0 ;
				fft_d7  <= 32'd0 ;
				fft_d8  <= 32'd0 ;
				fft_d9  <= 32'd0 ;
				fft_d10 <= 32'd0 ;
				fft_d11 <= 32'd0 ;
				fft_d12 <= 32'd0 ;
				fft_d13 <= 32'd0 ;
				fft_d14 <= 32'd0 ;
				fft_d15 <= 32'd0 ;
			end
		end
	end

	
//********************************* Analysis *********************************//		
	
	wire [31:0] fft_d ;
	wire signed [15:0] fft_real , fft_imag ;
	reg [31:0] fft_dmax;
	reg [3:0] freq_max ;
	reg Analysis_STATE ,AnalysisOutput_STATE;
	reg done;
	reg [3:0] freq ;
	
	assign fft_real = fft_d15_q [31:16] ;
	assign fft_imag = fft_d15_q [15:0] ;
	assign fft_d = fft_real * fft_real + fft_imag * fft_imag ;
	
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) Analysis_STATE <= 1'b0 ;
		
		else begin
			if(Analysis_STATE==0 && counter == 6'd48) Analysis_STATE <= 1'b1;
			else Analysis_STATE <= Analysis_STATE ;
		end
	end	
	
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) AnalysisOutput_STATE <= 1'b0 ;
		
		else begin
			if(Analysis_STATE==1 && AnalysisOutput_STATE==0 && counter == 6'd63) AnalysisOutput_STATE <= 1'b1;
			else AnalysisOutput_STATE <= AnalysisOutput_STATE ;
		end
	end	
	
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			fft_dmax <= 32'd0 ;
			freq_max <= 4'd0 ;
		end
		
		else begin
			if(Analysis_STATE ==1'b1) begin
				if(counter[3:0] == 4'd1) begin
					fft_dmax <= fft_d ;
					freq_max <= 4'd0 ;
				end
				
				else begin
					if(fft_d > fft_dmax) begin
						fft_dmax <= fft_d ;
						freq_max[3] <= ~counter[0] ;
						freq_max[2] <= ~counter[1]& ~counter[0] | counter[1] & counter[0] ;  
						freq_max[1] <= ~counter[2]&~counter[1]&~counter[0]|counter[2]&counter[0]|counter[2]&counter[1] ;
						freq_max[0] <= ~counter[3]&~counter[2]&~counter[1]&~counter[0]|counter[3]&counter[1]|counter[3]&counter[0]|counter[3]&counter[2]&~counter[1] ;
					end
					
					else begin
						fft_dmax <= fft_dmax ;
						freq_max <= freq_max ;
					end
				end
			end
			
			else begin
				fft_dmax <= 32'd0 ;
				freq_max <= 4'd0 ;
			end
		end
	end
	
	always@(posedge clk or posedge rst) begin
		if(rst == 1'b1) begin
			done <= 1'b0 ;
			freq <= 4'd0 ;
		end
		
		else begin
			if(AnalysisOutput_STATE ==1'b1) begin
				if(counter[3:0] == 4'd1) begin
					done <= 1'b1 ;
					freq <= freq_max ;
				end
				
				else begin
					done <= 1'b0 ;
					freq <= 4'd0 ;
				end
			end
			
			else begin
				done <= 1'b0 ;
				freq <= 4'd0 ;
			end
		end
	end
	
endmodule

module CHIP(val, data, clk, rst, done, freq);
input clk, rst;
input val;
input [15:0] data; 

output done;
output [3:0] freq;

wire  clk_i, rst_i, val_i;
wire  [15:0] data_i; 
     
wire done_i;
wire [3:0] freq_i;

FAS 		FAS(.data_valid(val_i), .data(data_i), .clk(clk_i), .rst(rst_i), .done(done_i), .freq(freq_i));


PDIDGZ 		ipad_clk(   .PAD(clk), 	  .C(clk_i) );
PDIDGZ 		ipad_rst(   .PAD(rst), 	  .C(rst_i) );
PDIDGZ 		ipad_val(   .PAD(val), 	  .C(val_i) );
PDIDGZ 		ipad_data00( .PAD(data[0 ]), .C(data_i[0 ]) );
PDIDGZ 		ipad_data01( .PAD(data[1 ]), .C(data_i[1 ]) );
PDIDGZ 		ipad_data02( .PAD(data[2 ]), .C(data_i[2 ]) );
PDIDGZ 		ipad_data03( .PAD(data[3 ]), .C(data_i[3 ]) );
PDIDGZ 		ipad_data04( .PAD(data[4 ]), .C(data_i[4 ]) );
PDIDGZ 		ipad_data05( .PAD(data[5 ]), .C(data_i[5 ]) );
PDIDGZ 		ipad_data06( .PAD(data[6 ]), .C(data_i[6 ]) );
PDIDGZ 		ipad_data07( .PAD(data[7 ]), .C(data_i[7 ]) );
PDIDGZ 		ipad_data08( .PAD(data[8 ]), .C(data_i[8 ]) );
PDIDGZ 		ipad_data09( .PAD(data[9 ]), .C(data_i[9 ]) );
PDIDGZ 		ipad_data10( .PAD(data[10]), .C(data_i[10]) );
PDIDGZ 		ipad_data11( .PAD(data[11]), .C(data_i[11]) );
PDIDGZ 		ipad_data12( .PAD(data[12]), .C(data_i[12]) );
PDIDGZ 		ipad_data13( .PAD(data[13]), .C(data_i[13]) );
PDIDGZ 		ipad_data14( .PAD(data[14]), .C(data_i[14]) );
PDIDGZ 		ipad_data15( .PAD(data[15]), .C(data_i[15]) );

PDO12CDG	opad_done(  .I(done_i), 	 .PAD(done) );
PDO12CDG	opad_freq0( .I(freq_i[0 ]), .PAD(freq[0 ]) );
PDO12CDG	opad_freq1( .I(freq_i[1 ]), .PAD(freq[1 ]) );
PDO12CDG	opad_freq2( .I(freq_i[2 ]), .PAD(freq[2 ]) );
PDO12CDG	opad_freq3( .I(freq_i[3 ]), .PAD(freq[3 ]) );

endmodule


