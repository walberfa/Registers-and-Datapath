/*
Autor do testbench: Walber Florencio 

Cenários avaliados:
- Escrita em todos os registradores (nota: o X0 não permite escrita)
- Leitura em todos os registradores
- Tentativa de escrita com a entrada we3 desabilitada
- Leitura de registradores após resetar
*/



`timescale  1 ps / 1 ps

module tb_exaust;
    logic[7:0] wd3, rd1, rd2;
    logic [2:0] wa3, ra1, ra2;
    logic we3, clk, rst;

register_file regx(.wd3(wd3), .wa3(wa3), .we3(we3), .ra1(ra1), .ra2(ra2), .clk(clk), .rst(rst), .rd1(rd1), .rd2(rd2));

	
initial	begin
	clk = 0;
	forever #1 clk = ~clk;
end

initial begin
	#3
	rst = 1'b1;
	we3 = 1'b1;

	wd3 = 8'b00111111; //letra O

	ra1 = 3'b000;
	ra2 = 3'b001;

	wa3 = 3'b000;
	#10

	wa3 = 3'b001;
	#10

	wa3 = 3'b010;
	#10

	wa3 = 3'b011;
	#10

	wa3 = 3'b100;
	#10

	wa3 = 3'b101;
	#10

	wa3 = 3'b110;
	#10

	wa3 = 3'b111;
	#10

	assert(rd1== 8'b0)	  $display("Ok:	X0 is only for reading!");
	assert(rd2== 8'b00111111) $display("Ok:	X1 data write/read correct!");

	ra1 = 3'b010;
	ra2 = 3'b011;
	#10

	assert(rd1== 8'b00111111) $display("Ok:	X2 data write/read correct!");
	assert(rd2== 8'b00111111) $display("Ok:	X3 data write/read correct!");
	
	wd3 = 8'b00111000; //letra L
	
	wa3 = 3'b000;
	#10

	wa3 = 3'b001;
	#10

	wa3 = 3'b010;
	#10

	wa3 = 3'b011;
	#10

	wa3 = 3'b100;
	#10

	wa3 = 3'b101;
	#10

	wa3 = 3'b110;
	#10

	wa3 = 3'b111;
	#10
	
	ra1 = 3'b100;
	ra2 = 3'b101;
	#10

	assert(rd1== 8'b00111000) $display("Ok:	X4 data write/read correct!");
	assert(rd2== 8'b00111000) $display("Ok:	X5 data write/read correct!");

	we3 = 1'b0;
	#10

	wd3 = 8'b01110111; //letra A

	wa3 = 3'b000;
	#10

	wa3 = 3'b001;
	#10

	wa3 = 3'b010;
	#10

	wa3 = 3'b011;
	#10

	wa3 = 3'b100;
	#10

	wa3 = 3'b101;
	#10

	wa3 = 3'b110;
	#10

	wa3 = 3'b111;
	#10
	
	ra1 = 3'b110;
	ra2 = 3'b111;
	#10

	assert(rd1!== 8'b01110111) $error("Expected:	X6 fail in write due enable in 0");
	assert(rd2!== 8'b01110111) $error("Expected:	X7 fail in write due enable in 0");

	assert(rd1== 8'b00111000) $display("Ok:	X6 keep the last data writed!");
	assert(rd2== 8'b00111000) $display("Ok:	X7 keep the last data writed!");

	we3 = 1'b1;
	#10

	wa3 = 3'b000;
	#10

	wa3 = 3'b001;
	#10

	wa3 = 3'b010;
	#10

	wa3 = 3'b011;
	#10

	wa3 = 3'b100;
	#10

	wa3 = 3'b101;
	#10

	wa3 = 3'b110;
	#10

	wa3 = 3'b111;
	#10

	ra1 = 3'b000;
	ra2 = 3'b011;
	#10

	assert(rd1== 8'b0)	  $display("Ok:	X0 is only for reading!");
	assert(rd2== 8'b01110111) $display("Ok:	X3 data write/read correct!");
	
	ra1 = 3'b110;
	ra2 = 3'b111;
	#10

	assert(rd1== 8'b01110111) $display("Ok:	X6 data write/read correct!");
	assert(rd2== 8'b01110111) $display("Ok:	X7 data write/read correct!");

	rst = 1'b0;
	#10

	wa3 = 3'b000;
	#10

	wa3 = 3'b001;
	#10

	wa3 = 3'b010;
	#10

	wa3 = 3'b011;
	#10

	wa3 = 3'b100;
	#10

	wa3 = 3'b101;
	#10

	wa3 = 3'b110;
	#10

	wa3 = 3'b111;
	#10

	ra1 = 3'b001;
	ra2 = 3'b010;
	#10
	
	assert(rd1== 8'b0) $display("Ok:	X1 data was reseted!");
	assert(rd2== 8'b0) $display("Ok:	X1 data was reseted!");

	$finish;
	

end

endmodule
