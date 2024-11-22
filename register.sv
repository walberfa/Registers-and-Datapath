module register(
	input logic [7:0] wd3,
	input logic we3, clk, rst,
	output reg [7:0] X
	);

	always_ff @ (posedge clk) begin
		if (rst&we3) X = wd3;
		else if (rst&~we3) X = X;
		else X = 'd0;
	end

endmodule
