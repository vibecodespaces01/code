// ========================================
// Testbench: flip_flop_tb
// Descrição: Testa todas as combinações do FLIP-FLOP RS
// Gera arquivo .vcd para visualização no GTKWave
// ========================================
    `include "flip_flop.v"
    `timescale 1ns/1ps

    module flip_flop_tb;
         reg  a0, b0;
        wire q,qnot;
        flip_flop uut (
            .a(a0),
            .b(b0),
            .q(q),
            .qnot(qnot)
        );

        initial begin
        $dumpfile("flip_flop.vcd");
        $dumpvars(0, flip_flop_tb);

                 a0 = 0;
                 b0 = 0;
            #10  a0 = 0; b0 = 0;
            #10  a0 = 0; b0 = 1;
            #10  a0 = 1; b0 = 0;
            #10  a0 = 1; b0 = 1;
            #10  $finish; 
        end
    endmodule