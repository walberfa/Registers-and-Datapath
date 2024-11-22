`timescale  1 ps / 1 ps

module register_file(
    input logic [7:0] wd3,
    input logic [2:0] wa3, ra1, ra2,
    input logic clk, rst, we3,
    output logic [7:0] rd1, rd2
);

    reg [7:0][7:0] X;
    reg [7:0] en;

//Banco de registradores
register reg0(.wd3(wd3), .we3(en[0]), .clk(clk), .rst(0),   .X(X[0]));
register reg1(.wd3(wd3), .we3(en[1]), .clk(clk), .rst(rst), .X(X[1]));
register reg2(.wd3(wd3), .we3(en[2]), .clk(clk), .rst(rst), .X(X[2]));
register reg3(.wd3(wd3), .we3(en[3]), .clk(clk), .rst(rst), .X(X[3]));
register reg4(.wd3(wd3), .we3(en[4]), .clk(clk), .rst(rst), .X(X[4]));
register reg5(.wd3(wd3), .we3(en[5]), .clk(clk), .rst(rst), .X(X[5]));
register reg6(.wd3(wd3), .we3(en[6]), .clk(clk), .rst(rst), .X(X[6]));
register reg7(.wd3(wd3), .we3(en[7]), .clk(clk), .rst(rst), .X(X[7]));

//Saídas
reading out1(.ra(ra1), .X(X), .rd(rd1));
reading out2(.ra(ra2), .X(X), .rd(rd2));

//Lógica para habilitar escrita nos registradores
always_ff @ (posedge clk) begin
	en = 8'd0;
        
	if(we3==1) begin
		case(wa3)
		3'b000 : en[0] = 1'b1;
		3'b001 : en[1] = 1'b1;
		3'b010 : en[2] = 1'b1;
		3'b011 : en[3] = 1'b1;
		3'b100 : en[4] = 1'b1;
		3'b101 : en[5] = 1'b1;
		3'b110 : en[6] = 1'b1;
		3'b111 : en[7] = 1'b1;
		endcase
	end
	else en = 8'd0;
    end


endmodule
