`timescale  1 ps / 1 ps

module reading(
	input logic [2:0] ra,
	logic [7:0][7:0] X,
	output logic [7:0] rd);

always_comb begin
	case(ra)
	3'b000 : rd = X[0];
	3'b001 : rd = X[1];
	3'b010 : rd = X[2];
	3'b011 : rd = X[3];
	3'b100 : rd = X[4];
	3'b101 : rd = X[5];
	3'b110 : rd = X[6];
	3'b111 : rd = X[7];
	endcase
end
        
endmodule
