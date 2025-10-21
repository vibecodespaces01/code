@echo off
echo ========================================
echo Compilando os arquivos VHDL com GHDL...
echo ========================================
ghdl -a protocolo_moore.vhd
ghdl -a tb_protocolo_moore.vhd

echo ========================================
echo Elaborando o testbench...
echo ========================================
ghdl -e tb_protocolo_moore

echo ========================================
echo Executando simulação...
echo ========================================
ghdl -r tb_protocolo_moore --vcd=protocolo_moore.vcd --stop-time=500ns

echo ========================================
echo Abrindo GTKWave...
echo ========================================
gtkwave protocolo_moore.vcd

del *.cf
pause