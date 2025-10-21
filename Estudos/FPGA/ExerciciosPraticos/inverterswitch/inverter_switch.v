// ========================================
// Módulo: inverter_switch
// Descrição: Cria uma porta-lógica inversora CMOS
// ========================================
module inverter_switch (x,f);
input x;
output f;
supply1 vdd;
supply0 gnd;
pmos p1 (f, vdd, x);
nmos n1 (f, gnd, x);
endmodule