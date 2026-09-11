`timescale 1ns / 1ps

module csa_multiplier_tb();

    reg  [3:0] m, q;
    wire [7:0] p;

    csa_multiplier uut (
        .m(m),
        .q(q),
        .p(p)
    );

    initial begin
        {m, q} = {4'd0,  4'd10};  // 0  x 10 = 0
        #10 {m, q} = {4'd5,  4'd5};   // 5  x 5  = 25
        #10 {m, q} = {4'd9,  4'd5};   // 9  x 5  = 45
        #10 {m, q} = {4'd12, 4'd13};  // 12 x 13 = 156
        #10 {m, q} = {4'd15, 4'd10};  // 15 x 10 = 150
        #10 $finish;
    end

endmodule
