// ========================================
// Testbench: alarme_tb
// Descrição: Testa todas as combinações de entrada do módulo alarme
// Gera arquivo .vcd para visualização no GTKWave
// ========================================

`include "alarme.v"
`timescale 1ns / 1ps

module alarme_tb;

    // Entradas como registradores
    reg A, B, C;

    // Saída como fio
    wire Y;

    // Instancia o módulo sob teste (UUT)
    alarme uut (
        .A(A),
        .B(B),
        .C(C),
        .Y(Y)
    );

    initial begin
        // Geração do arquivo VCD para GTKWave
        $dumpfile("alarme.vcd");
        $dumpvars(0, alarme_tb);

        $display("A B C | Y");
        $display("-------------");

        // Testa as 8 combinações possíveis
        A=0; B=0; C=0; #10; $display("%b %b %b | %b", A, B, C, Y);
        A=0; B=0; C=1; #10; $display("%b %b %b | %b", A, B, C, Y);
        A=0; B=1; C=0; #10; $display("%b %b %b | %b", A, B, C, Y);
        A=0; B=1; C=1; #10; $display("%b %b %b | %b", A, B, C, Y);
        A=1; B=0; C=0; #10; $display("%b %b %b | %b", A, B, C, Y);
        A=1; B=0; C=1; #10; $display("%b %b %b | %b", A, B, C, Y);
        A=1; B=1; C=0; #10; $display("%b %b %b | %b", A, B, C, Y);
        A=1; B=1; C=1; #10; $display("%b %b %b | %b", A, B, C, Y);

        $finish;
    end

endmodule