module project_3(
    input clk,  	
    output reg rs,en,
	 output bk_light,lcd_light,rw,
    output reg [7:0] LCD_out,led_out 
     );

assign rw=1'b0;                                 
assign bk_light=1'b1;
assign lcd_light=1'b1;                                                                                                                      
wire [8:0]memory[0:49]; 
reg [5:0]pointer;
reg [31:0]count,loop;
initial pointer=6'b000000;
initial en=1'b0;
initial loop=0;

    

assign	 memory[0]={1'b0,8'h38}; 
assign	 memory[1]={1'b0,8'h38}; 
assign	 memory[2]={1'b0,8'h38}; 
assign	 memory[3]={1'b0,8'h38};
assign	 memory[4]={1'b0,8'h38}; 
assign	 memory[5]={1'b0,8'h38};
assign	 memory[6]={1'b0,8'h38}; 
assign	 memory[7]={1'b0,8'h38}; 
assign	 memory[8]={1'b0,8'h38}; 
assign	 memory[9]={1'b0,8'h38}; 
assign	 memory[10]={1'b0,8'h38}; 
assign	 memory[11]={1'b0,8'h38};                         
assign	 memory[12]={1'b0,8'h38};                     
assign	 memory[13]={1'b0,8'h38};
assign	 memory[14]={1'b0,8'h0C};                     
assign	 memory[15]={1'b0,8'h01};
assign	 memory[16]={1'b0,8'h80};

assign	 memory[17]={1'b1,"-"};
assign	 memory[18]={1'b1,"D"};
assign	 memory[19]={1'b1,"I"};
assign	 memory[20]={1'b1,"G"};
assign	 memory[21]={1'b1,"I"};
assign	 memory[22]={1'b1,"T"};
assign	 memory[23]={1'b1,"A"};
assign	 memory[24]={1'b1,"L"};
assign	 memory[25]={1'b1," "};
assign	 memory[26]={1'b1,"S"};
assign	 memory[27]={1'b1,"Y"};
assign	 memory[28]={1'b1,"S"};
assign	 memory[29]={1'b1,"T"};
assign	 memory[30]={1'b1,"E"};
assign	 memory[31]={1'b1,"M"};
assign	 memory[32]={1'b1,"-"};

assign	 memory[33]={1'b0,8'hC0};

assign	 memory[34]={1'b1,"-"};
assign	 memory[35]={1'b1,"-"};
assign	 memory[36]={1'b1,"D"};
assign	 memory[37]={1'b1,"E"};
assign	 memory[38]={1'b1,"S"};
assign	 memory[39]={1'b1,"I"};
assign	 memory[40]={1'b1,"G"};
assign	 memory[41]={1'b1,"N"};
assign	 memory[42]={1'b1," "};
assign	 memory[43]={1'b1,"("};
assign	 memory[44]={1'b1,"D"};
assign	 memory[45]={1'b1,"S"};
assign	 memory[46]={1'b1,"D"};
assign	 memory[47]={1'b1,")"};
assign	 memory[48]={1'b1,"-"};
assign	 memory[49]={1'b1,"-"};


always @(posedge clk)
begin
if(count == 2500000) begin 
    count <= 0;	 
	 if(loop<100)
	 begin
    en <= ~en;
	 loop<=loop+1;
	 end
end 
else begin
    count <= count + 1;     
    end
end


always @(posedge en) 
begin
	//if(pointer < 6'b110010)
     //begin
	  LCD_out<=memory[pointer][7:0];
	  led_out<=memory[pointer][7:0];
	  rs<=memory[pointer][8];  
	 pointer = pointer + 1'b1;
	  //end	  
	  //else
	  //pointer=6'b000000;
end   

endmodule 
