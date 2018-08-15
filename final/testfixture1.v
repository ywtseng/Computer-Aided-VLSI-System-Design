`timescale 1ns/10ps
`define CYCLE      10           	  // Modify your clock period here
`define SDFFILE    "./LZSS_syn.sdf"	          // Modify your sdf file name
`define End_CYCLE  30000               // Modify cycle times once your design need more cycle times!
`define PAT        "./pattern1.dat"    
`define EXP        "./golden1.dat"     

module test;
//parameter N_EXP   = 16384;
parameter 	N_PAT  = 170;
parameter	N_GOLD = 318;
real		num_pat = 170;
real		compress_bit;


reg   			clk ;
reg   			reset ;
reg		[31:0]	data;
reg				data_valid;
reg				drop_done;
wire 			busy;
//wire			mem_read;
//wire	[9:0]	addr;
wire	[10:0]	codeword;
wire	[11:0]	enc_num;
wire			out_valid;
wire			finish;

integer			err, gold_num, out_f;//, compress_bit;

reg		[10:0]	codeword_temp;
//reg   	[31:0]  pat_mem   	[0:N_PAT-1];
reg   	[7:0]	pat_mem   	[0:4*N_PAT-1];
reg   	[10:0]  gold_mem   	[0:N_GOLD-1];
reg				read_start;
reg		[10:0]	pat_num;

real			CR;

   LZSS LZSS( 	.clk(clk), .reset(reset), .data(data), .data_valid(data_valid), .drop_done(drop_done),   
				.busy(busy), .codeword(codeword), .enc_num(enc_num), 
				.out_valid(out_valid), .finish(finish) 					);         
   

`ifdef SDF
initial $sdf_annotate(`SDFFILE, LZSS);
`endif

initial	$readmemh (`PAT, pat_mem);
initial	$readmemh (`EXP, gold_mem);


initial begin
#0;
   clk         	= 1'b0;
   reset       	= 1'b0;   
   err         	= 0;
   gold_num		= 0;
   pat_num		= 0;
   compress_bit = 0;
   read_start   = 0;
   drop_done	= 0;
   data_valid	= 0;
  
end

always begin #(`CYCLE/2) clk = ~clk; end

initial begin
//$dumpfile("LZSS.vcd");
//$dumpvars;
$fsdbDumpfile("LZSS.fsdb");
$fsdbDumpvars(0,test,"+mda");
//$fsdbDumpvars;

   out_f = $fopen("out.dat");
   if (out_f == 0) begin
        $display("Output file open error !");
        $finish;
   end
end


initial begin
   @(negedge clk)  reset = 1'b1;
   #`CYCLE         reset = 1'b0;      
   read_start = 1;
end

always@(negedge clk)begin
	if(!busy && pat_num==(N_PAT-1))
		drop_done = 1;
end

//HOST
always@(negedge clk)begin
	if(!busy && read_start==1)begin
		//data <= pat_mem[pat_num];
		data <= {pat_mem[4*pat_num],pat_mem[4*pat_num+1],pat_mem[4*pat_num+2],pat_mem[4*pat_num+3]};
		pat_num <= pat_num+1;	
		data_valid <= 1;		
	end	
	else begin
		data <= 'hz;
		data_valid <= 0;
	end		
end

//Check answer
always@(negedge clk)begin
	codeword_temp = gold_mem[gold_num];

	if(out_valid)begin
		if(codeword[10]==0)begin
			if(codeword[10:2]!==codeword_temp[10:2])begin
				err = err+1;			
				$display("ERROR at %5d:output %4h !=expect %4h " ,gold_num+1, codeword, codeword_temp);	
			end
			compress_bit = compress_bit + 9;			
		end
		else begin
			if(codeword!==codeword_temp)begin
				err = err+1;
				$display("ERROR at %5d:output %4h !=expect %4h " ,gold_num+1, codeword, codeword_temp);	
			end	
			compress_bit = compress_bit + 11;
		end
		#1 gold_num = gold_num + 1;
	end 
end


initial  begin
 #(`CYCLE * `End_CYCLE);
   
 $display("-----------------------------------------------------\n");
 $display("Error!!! Something is wrong with your code ...!\n");
 $display("-------------------------FAIL------------------------\n");
 $display("-----------------------------------------------------\n");
 
 $finish;
end


initial begin
	@(posedge finish)	CR = compress_bit/(pat_num*32);
end



always@(posedge clk)begin
	if(finish)begin	
	
		$display("---------------------------------------------------------------\n");
         if (err == 0 && gold_num==N_GOLD)  begin
            $display("Congratulations! All data have been encoded successfully!\n");
            $display("-------------------------PASS----------------------------------\n");
			$display("The compression ratio is %f \n", CR);
			$display("---------------------------------------------------------------\n");
         end
         else begin
            $display("There are %d encoding errors!\n", err+N_GOLD-gold_num);
            $display("---------------------------------------------------------------\n");
			//$display("The compression ratio is %f \n", CR);
			//$display("---------------------------------------------------------------\n");
         end

		#(`CYCLE/2) $finish;		
	end
end


endmodule









