module ula_tb();
    logic [2:0] ULAControl;
    logic [7:0] scrA, scrB, ULAResult;
    logic Z;
    
ula ula_1(.ULAControl(ULAControl), .scrA(scrA), .scrB(scrB), .ULAResult(ULAResult), .Z(Z));

initial begin
    scrA = 8'b00000011;
    scrB = 8'b00000010;
    
    ULAControl = 3'b000;
    #10;

    ULAControl = 3'b001;
    #10;

    ULAControl = 3'b010;
    #10;

    ULAControl = 3'b011;
    #10;

    ULAControl = 3'b101;
    #10;

    scrA = 8'b00000100;
    scrB = 8'b00000101;
    
    ULAControl = 3'b000;
    #10;

    ULAControl = 3'b001;
    #10;

    ULAControl = 3'b010;
    #10;

    ULAControl = 3'b011;
    #10;

    ULAControl = 3'b101;
    #10;
end

endmodule