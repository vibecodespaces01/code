// ========================================
// ========================================
// Módulo: flip_flop
// Descrição: Cria um FLIP-FLOP RS
// ========================================

module flip_flop (a,b,q,qnot);
    input a, b;
    output q,qnot;
    assign q = ~(a & qnot);
    assign qnot = ~(b & q);
endmodule