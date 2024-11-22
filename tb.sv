/*
Autor do testbench: Walber Florencio 
*/

`timescale  1 ps / 1 ps

module tb;
    logic[7:0] wd3, rd1, rd2;
    logic [2:0] wa3, ra1, ra2;
    logic we3, clk, rst;

register_file regx(.wd3(wd3), .wa3(wa3), .we3(we3), .ra1(ra1), .ra2(ra2), .clk(clk), .rst(rst), .rd1(rd1), .rd2(rd2));

	
initial	begin
	clk = 0;
	forever #1 clk = ~clk;
end

initial begin
    #3;

    we3 = 1'b1;
    wd3 = 8'b01100011;
    rst = 1'b1;

    ra1 = 3'b010;
    ra2 = 3'b011;

    wa3 = 3'b011;
    #10;

    wa3 = 3'b010;
    #10;

    wa3 = 3'b001;
    #10

    if(rd1!== 8'b01100011) $display("Error:		rd1 incorrect!");
	
    rst = 1'b0;
    #5;
    if((rd1|rd2)!== 8'b0) $display("Error: 		reset failed!");

    wd3 = 8'b01110111;
    rst = 1'b1;
    #5;

    ra2 = 3'b001;
    #10;

    if(rd2!== 8'b01110111) $display("Error:		rd2 incorrect!");

    we3 = 1'b0;
    #5;

    wa3 = 3'b010;
    #10;

    $finish;

end

initial begin
    $display("              Tempo   rst  wa3  ra1 ra2    Saída(rd1)  Saída(rd2)");
    $monitor($time, "   %b   %b  %b %b     %b    %b", rst, wa3, ra1, ra2, rd1, rd2);
end

endmodule
