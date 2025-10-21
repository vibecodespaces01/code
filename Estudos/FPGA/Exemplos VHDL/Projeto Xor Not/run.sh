#!/bin/bash
# Simulação do projeto or_gate

echo "Analisando arquivos VHDL..."
ghdl -a xor_not_gate.vhd
ghdl -a tb_xor_not_gate.vhd

echo "Elaborando testbench..."
ghdl -e tb_xor_not_gate

echo "Executando simulação e gerando VCD..."
ghdl -r tb_xor_not_gate --vcd=xor_not.vcd

echo "Limpando arquivos temporários..."
rm -f *.cf

echo "Simulação concluída."

## Comandos no terminal:
## chmod +x run.sh
## ./run.sh

## echo "Abrindo GTKWave..."
## gtkwave xor_not.vcd &

## Abrindo o GTKWave no terminal do Windows
## Dentro do diretório do projeto, execute:
## gtkwave xor_not.vcd