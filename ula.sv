`timescale  1 ps / 1 ps

module ula(
  input logic [2:0] ULAControl,
  input logic [7:0] scrA, scrB,
  output logic [7:0] ULAResult,
  output logic Z
);
  
  always_comb
  
  begin

   case(ULAControl)
      3'b000 : ULAResult = scrA + scrB; //Adição
      3'b001 : ULAResult = scrA + ~scrB + 1; //Subtração (complemento 2)
      3'b010 : ULAResult = scrA & scrB; //AND
      3'b011 : ULAResult = scrA | scrB; //OR
      3'b101 : ULAResult = (scrA < scrB) ? 1 : 0; //Menor que
    endcase

    if (ULAResult == 8'b0) Z = 1;
    else Z = 0;
  end

endmodule
