`timescale  1 ps / 1 ps

module datapath(
    input logic [7:0] wd3, constante,
    input logic [2:0] wa3, ra1, ra2, ULAControl,
    input logic clk, rst, we3, select_src,
    output logic Z,
    output logic [7:0] ULAResult
);

    reg [7:0] w_rd1srcA, w_rd2, w_srcB;

    register_file reg_file(
        .wd3(wd3),
        .wa3(wa3),
        .ra1(ra1),
        .ra2(ra2),
        .clk(clk),
        .rst(rst),
        .we3(we3),
        .rd1(w_rd1srcA),
        .rd2(w_rd2)
    );
    
    muxULASrc mux_ula(
        .select_src(select_src),
        .w_rd2(w_rd2),
        .constante(constante),
        .w_srcB(w_srcB)
    );

    ula ula_inst(
        .ULAControl(ULAControl),
        .scrA(w_rd1srcA),
        .scrB(w_srcB),
        .ULAResult(ULAResult),
        .Z(Z)
    );

endmodule
