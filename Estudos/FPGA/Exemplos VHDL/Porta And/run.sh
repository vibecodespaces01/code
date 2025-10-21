#!/bin/bash
# Simulação do projeto or_gate

echo "Analisando arquivos VHDL..."
ghdl -a and_gate.vhd
ghdl -a tb_and_gate.vhd

echo "Elaborando testbench..."
ghdl -e tb_and_gate

echo "Executando simulação e gerando VCD..."
ghdl -r tb_and_gate --vcd=and_gate.vcd

echo "Abrindo GTKWave..."
gtkwave and_gate.vcd &

echo "Limpando arquivos temporários..."
rm -f *.cf

echo "Simulação concluída."