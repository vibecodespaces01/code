@echo off
echo ========================================
echo Compilando os arquivos VHDL com GHDL...
echo ========================================
ghdl -a elevator_mealy.vhd
ghdl -a tb_elevator_mealy.vhd

echo ========================================
echo Elaborando o testbench...
echo ========================================
ghdl -e tb_elevator_mealy

echo ========================================
echo Executando simulação...
echo ========================================
ghdl -r tb_elevator_mealy --vcd=elevator_mealy.vcd --stop-time=500ns

echo ========================================
echo Abrindo GTKWave...
echo ========================================
gtkwave elevator_mealy.vcd

del *.cf
pause