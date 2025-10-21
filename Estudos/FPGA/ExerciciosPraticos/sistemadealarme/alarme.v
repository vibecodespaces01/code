// ========================================
// Módulo: alarme
// Descrição: Ativa o alarme de segurança com base nos sensores
// ========================================
module alarme (
    input wire A,   // Janela
    input wire B,   // Porta
    input wire C,   // Sistema de segurança
    output wire Y   // Alarme
);

    // Expressão lógica: Y = A + (B & C)
    assign Y = A | (B & C);

endmodule