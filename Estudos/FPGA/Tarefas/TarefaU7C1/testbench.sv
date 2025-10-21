// ====================================================
// RESIDÊNCIA PROFISSIONAL EM FPGA
// EmbarcaTech IFMA MTC
// Discente: Renato da Fonseca Oliveira
// Testbench para o Somador/Subtrator Completo (1 bit)
// ====================================================

`timescale 1ns/1ps

module tb_somador_subtrator;

  reg A, B, Te, M;
  wire S, Ts;

  // Instancia o módulo de 1 bit
  somador_subtrator uut (
    .A(A),
    .B(B),
    .Te(Te),
    .M(M),
    .S(S),
    .Ts(Ts)
  );

  initial begin
    // Arquivo de saída para o EPWave
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_somador_subtrator);

    $display("M A B Te | S Ts");
    $display("----------------");

    // Varre todas as combinações possíveis (16 casos)
    M = 0; A = 0; B = 0; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 0; A = 0; B = 0; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 0; A = 0; B = 1; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 0; A = 0; B = 1; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 0; A = 1; B = 0; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 0; A = 1; B = 0; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 0; A = 1; B = 1; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 0; A = 1; B = 1; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);

    M = 1; A = 0; B = 0; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 1; A = 0; B = 0; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 1; A = 0; B = 1; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 1; A = 0; B = 1; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 1; A = 1; B = 0; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 1; A = 1; B = 0; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 1; A = 1; B = 1; Te = 0; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);
    M = 1; A = 1; B = 1; Te = 1; #10 $display("%b %b %b %b | %b %b", M,A,B,Te,S,Ts);

    $finish;
  end

endmodule