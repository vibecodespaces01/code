echo "Analisando arquivos VHDL..."
ghdl -a elevator_mealy.vhd
ghdl -a tb_elevator_mealy.vhd

echo "Elaborando testbench..."
ghdl -e tb_elevator_mealy

echo "Executando simulação e gerando VCD..."
ghdl -r tb_elevator_mealy --vcd=elevator_mealy.vcd --stop-time=500ns

echo "Limpando arquivos temporários..."
rm -f *.cf

echo "Simulação concluída."

## Comandos no terminal:
## chmod +x run.sh
## ./run.sh

## echo "Abrindo GTKWave..."
## gtkwave elevator_mealy.vcd &

## Abrindo o GTKWave no terminal do Windows
## Dentro do diretório do projeto, execute:
## gtkwave elevator_mealy.vcd