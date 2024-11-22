`timescale  1 ps / 1 ps

module datapath_tb();
    logic [7:0] wd3, constante, ULAResult;
    logic [2:0] wa3, ra1, ra2, ULAControl;
    logic clk, rst, we3, select_src, Z;

    assign constante = 8'b00001100;

    datapath datapath1(
        .wd3(wd3),
        .constante(constante),
        .wa3(wa3),
        .we3(we3),
        .ra1(ra1),
        .ra2(ra2),
        .ULAControl(ULAControl),
        .select_src(select_src),
        .clk(clk),
        .rst(rst),
        .ULAResult(ULAResult),
        .Z(Z)
    );

    initial	begin
	clk = 0;
	forever #1 clk = ~clk;
    end

    initial begin
        #3;

        we3 = 1'b1; //enable
        rst = 1'b1;
        select_src = 1'b0; //select output from register file
        
        wd3 = 8'b00000010;
        #5;

        wa3 = 3'b001; //write register X1
        #5;

        wa3 = 3'b010; //write register X2
        #5;

        ra1 = 3'b001;
        ra2 = 3'b010;
        #5;

        ULAControl = 3'b000; //Add
        #5;

        $display("==============================");
        $display("Verifying Add %d + %d", wd3, wd3);

        assert(ULAResult==8'b100) $display("Result: %d, matches with expected", ULAResult);
        assert(Z==0) $display("Flag Z %d is correct", Z);

        ULAControl = 3'b001; //Subtract
        #5;

        $display("==============================");
        $display("Verifying Subtract %d - %d", wd3, wd3);

        assert(ULAResult==8'b0) $display("Result: %d, matches with expected", ULAResult);
        assert(Z==1) $display("Flag Z %d is correct", Z);
        #5;

        ULAControl = 3'b101; //less than
        #5;

        $display("==============================");
        $display("Verfiying %d less than %d", wd3, wd3);

        assert(ULAResult==8'b0) $display("Result: %d, isn't less than", ULAResult);
        #5;

        select_src = 1'b1; //select constant
        wd3 = 8'b00000011;
        #5;

        wa3 = 3'b111; //write register X7
        #5;

        ra1 = 3'b111;
        #5;

        $display("==============================");
        $display("Verfiying %d less than %d", wd3, constante);

        assert(ULAResult==8'b1) $display("Result: %d, is less than", ULAResult);
        #5;

        ULAControl = 3'b010; //AND
        #5;

        $display("==============================");
        $display("Verifying AND: %b & %b", wd3, constante);

        assert(ULAResult==8'b0) $display("Result: %b, matches with expected", ULAResult);
        assert(Z==1) $display("Flag Z %d is correct", Z);
        #5;

        ULAControl = 3'b011; //OR
        #5;

        $display("==============================");
        $display("Verifying OR: %b | %b", wd3, constante);

        assert(ULAResult==8'b1111) $display("Result: %b, matches with expected", ULAResult);
        assert(Z==0) $display("Flag Z %d is correct", Z);
        #5;

        rst = 1'b0; //reset data
        select_src = 1'b0; //select output from register file
        wd3 = 8'b000001100;
        #5;

        wa3 = 3'b100; //try write register X4
        #5;

        wa3 = 3'b101; //try write register X5
        #5;

        ra1 = 3'b100;
        ra2 = 3'b101;
        #5;

        ULAControl = 3'b000; //Add
        #5;

        $display("==============================");
        $display("Trying add after reset data");
        assert(ULAResult==8'b0) $display("Result: %d, matches with expected", ULAResult);
        assert(Z==1) $display("Flag Z %d is correct", Z);
        #5;

        $finish;

    end

endmodule