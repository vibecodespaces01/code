//RESIDÊNCIA PROFISSIONAL EM FPGA
//EmvbarcaTech IFMA MTC
//Digital JS 
//Discente: Renato da Fonseca Oliveira
//Sistema de Alarme Digital com Simulação Visual


module sistema_alarme (
// Declaração das portas de entrada e saída
  // Entradas
    input A, // Porta
    input B, // Janela
    input C, // Presença
  // Saída
    output Y // Alarme
);

// O alarme deve ser ativado (Y = 1) se dois sensores forem acionados ao mesmo tempo.
assign Y = (A & B) | (A & C) | (B & C);

endmodule
// Fim do módulo