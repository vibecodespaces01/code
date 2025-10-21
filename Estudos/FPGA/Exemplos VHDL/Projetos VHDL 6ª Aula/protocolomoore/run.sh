echo "Analisando arquivos VHDL..."
ghdl -a protocolo_moore.vhd
ghdl -a tb_protocolo_moore.vhd

echo "Elaborando testbench..."
ghdl -e tb_protocolo_moore

echo "Executando simulação e gerando VCD..."
ghdl -r tb_protocolo_moore --vcd=protocolo_moore.vcd --stop-time=500ns

echo "Limpando arquivos temporários..."
rm -f *.cf

echo "Simulação concluída."

## Comandos no terminal:
## chmod +x run.sh
## ./run.sh

## echo "Abrindo GTKWave..."
## gtkwave protocolo_moore.vcd &

## Abrindo o GTKWave no terminal do Windows
## Dentro do diretório do projeto, execute:
## gtkwave protocolo_moore.vcd