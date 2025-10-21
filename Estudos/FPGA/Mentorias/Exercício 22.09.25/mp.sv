// a XOR b

module adder4 (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] sum
);
    assign sum = a ^ b; // XOR bit-a-bit
endmodule