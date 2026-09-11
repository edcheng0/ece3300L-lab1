module mux_2x1_8bit(
    input  [7:0] in0,
    input  [7:0] in1,
    input        select,
    output [7:0] out
);
    assign out = select ? in1 : in0;
endmodule
