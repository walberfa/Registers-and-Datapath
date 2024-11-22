`timescale  1 ps / 1 ps

module muxULASrc(
    input logic select_src,
    input logic [7:0] w_rd2, constante,
    output logic [7:0] w_srcB
);
    always_comb begin
        
        case (select_src)
        1'b0 : w_srcB = w_rd2;
        1'b1 : w_srcB = constante;
    endcase

    end
endmodule