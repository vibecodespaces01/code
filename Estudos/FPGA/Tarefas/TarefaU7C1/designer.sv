// =================================================================
// RESIDÊNCIA PROFISSIONAL EM FPGA
// EmbarcaTech IFMA MTC
// Discente: Renato da Fonseca Oliveira
// Somador/Subtrator Completo - Tarefa FPU7C1
// Entradas: A, B, Te (carry-in/borrow-in), M (0=soma, 1=subtração)
// Saídas:   S (resultado), Ts (carry-out/borrow-out)
// =================================================================

module somador_subtrator (
    input  A, B, Te, M,
    output S, Ts
);

    wire B_mod;

    // Se M=0 → soma normal
    // Se M=1 → subtração (inverte B)
    assign B_mod = B ^ M;

    // Operação de soma/subtração com transporte
    assign {Ts, S} = A + B_mod + (Te ^ M);

endmodule
