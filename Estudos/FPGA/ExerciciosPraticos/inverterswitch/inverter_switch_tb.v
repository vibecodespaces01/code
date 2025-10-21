// ========================================
// Testbench: inverter_switch_tb
// Descrição: Testa todas as combinações da porta-lógica inversora
// Gera arquivo .vcd para visualização no GTKWave
// ========================================

`include "inverter_switch.v"
`timescale 1ns/100ps

module inverter_switch_tb ;
reg x;
wire f;
// Instanstiation
inverter_switch G0 (x,f);
initial begin
x=0;
#30 $finish;
end
initial begin
$dumpfile("inverter_switch.vcd");
$dumpvars(0,inverter_switch_tb);
$monitor($time,"x = %b, f = %b",x,f );
#5 x=1;
#10 x=0;
#5 x=1;
end
endmodule