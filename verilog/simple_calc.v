module simple_calc(
    input  [3:0] x,
    input  [3:0] y,
    input  [1:0] op_sel,
    output [7:0] result,
    output       carry_out,
    output       overflow
);

    wire [3:0] sum;
    wire [7:0] product;

    // op_sel[0] = 0 -> add, 1 -> subtract
    adder_subtractor AS (
        .x(x),
        .y(y),
        .add_n(op_sel[0]),
        .s(sum),
        .c_out(carry_out),
        .overflow(overflow)
    );

    csa_multiplier MULT (
        .m(x),
        .q(y),
        .p(product)
    );

    // op_sel[1] = 0 -> zero-extended sum, 1 -> product
    mux_2x1_8bit RESULT_MUX (
        .in0({4'b0000, sum}),
        .in1(product),
        .select(op_sel[1]),
        .out(result)
    );

endmodule
