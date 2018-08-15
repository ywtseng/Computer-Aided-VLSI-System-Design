module CONV ( clk, reset, Din, in_en, busy, out_valid, Dout);
input 			clk;
input 			reset;
input [3:0] 	Din;
input 			in_en;
output 			busy;
output			out_valid;
output[7:0]	    Dout;

reg 			busy;
reg 			busy_temp;
reg			    out_valid;
reg			    out_valid_temp;
reg [7:0]       Dout;
reg [7:0]       Dout_temp;
reg [3:0]		f[7:0];
reg [3:0]		g[7:0];
reg [7:0]		fg[14:0];
reg [3:0]		f_temp[7:0];
reg [3:0]		g_temp[7:0];
reg [7:0]		fg_temp[14:0];
reg [4:0]		count_input;
reg [4:0]		count_input_temp;
reg [4:0]		count_output;
reg [4:0]		count_output_temp;
reg [1:0]		state;
reg [1:0]		next_state;
integer i;
parameter  start_state= 2'b00, input_state = 2'b01, output_state = 2'b10;

always@(posedge reset)
begin
	state<=2'b00;
	for(i=0;i<8;i=i+1)
	begin
		f[i]<=0;
		g[i]<=0;
	end
	for(i=0;i<15;i=i+1)
		fg[i]<=0;	
	busy<=1;
	out_valid<=0;
	Dout<=0;
	count_input<=0;
	count_output<=0;
end

always@(posedge clk)
begin
	state<=next_state;
	for(i=0;i<8;i=i+1)
	begin
		f[i]<=f_temp[i];
		g[i]<=g_temp[i];
	end
	for(i=0;i<15;i=i+1)
		fg[i]<=fg_temp[i];
	busy<=busy_temp;
	out_valid<=out_valid_temp;
	Dout<=Dout_temp;		
	count_input<=count_input_temp;
	count_output<=count_output_temp;
end

always@(*)
begin
	case(state)
	    //State one------------------------
		start_state:
		begin
		    if(busy==1)
				next_state=2'b01;
			else
				next_state=2'b00;	
			busy_temp=1;
			out_valid_temp=0;
			Dout_temp=0;
			count_input_temp=0;
			count_output_temp=0;
		end
		//State two------------------------
		input_state:
		begin
		    if(count_input==16)
				next_state=2'b10;
			else
				next_state=2'b01;
			if (count_input<15)
				busy_temp=0;		
			else
				busy_temp=1;
				
			if(in_en==1)
			begin
				if(count_input<8)
					f_temp[count_input]=Din;
				if(count_input>7&&count_input<16)
					g_temp[count_input-8]=Din;
				count_input_temp=count_input+1;
			end
			else if(count_input==16)
				count_input_temp=count_input+1;
			else
				count_input_temp=0;	
				
			if(count_input==16)
			begin
				fg_temp[0]=f[0]*g[0];
				fg_temp[1]=f[0]*g[1]+f[1]*g[0];
				fg_temp[2]=f[0]*g[2]+f[1]*g[1]+f[2]*g[0];
				fg_temp[3]=f[0]*g[3]+f[1]*g[2]+f[2]*g[1]+f[3]*g[0];
				fg_temp[4]=f[0]*g[4]+f[1]*g[3]+f[2]*g[2]+f[3]*g[1]+f[4]*g[0];
				fg_temp[5]=f[0]*g[5]+f[1]*g[4]+f[2]*g[3]+f[3]*g[2]+f[4]*g[1]+f[5]*g[0];
				fg_temp[6]=f[0]*g[6]+f[1]*g[5]+f[2]*g[4]+f[3]*g[3]+f[4]*g[2]+f[5]*g[1]+f[6]*g[0];
				fg_temp[7]=f[0]*g[7]+f[1]*g[6]+f[2]*g[5]+f[3]*g[4]+f[4]*g[3]+f[5]*g[2]+f[6]*g[1]+f[7]*g[0];
				fg_temp[8]=f[1]*g[7]+f[2]*g[6]+f[3]*g[5]+f[4]*g[4]+f[5]*g[3]+f[6]*g[2]+f[7]*g[1];
				fg_temp[9]=f[2]*g[7]+f[3]*g[6]+f[4]*g[5]+f[5]*g[4]+f[6]*g[3]+f[7]*g[2];
				fg_temp[10]=f[3]*g[7]+f[4]*g[6]+f[5]*g[5]+f[6]*g[4]+f[7]*g[3];
				fg_temp[11]=f[4]*g[7]+f[5]*g[6]+f[6]*g[5]+f[7]*g[4];
				fg_temp[12]=f[5]*g[7]+f[6]*g[6]+f[7]*g[5];
				fg_temp[13]=f[6]*g[7]+f[7]*g[6];
				fg_temp[14]=f[7]*g[7];
			end
		end
		//State three------------------------
		output_state:
		begin
		    if(count_output==15)
				next_state=2'b00;
			else
				next_state=2'b10;	
			if(count_output<15)
				out_valid_temp=1;
			else
				out_valid_temp=0;
			Dout_temp=fg[count_output];
			count_output_temp=count_output+1;
		end
	endcase
end
$display("ABC");


endmodule