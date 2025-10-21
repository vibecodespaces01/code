echo "Analisando arquivos VHDL..."
ghdl -a d_flip_flop.vhd
ghdl -a reg8.vhd
ghdl -a tb_reg8.vhd

echo "Elaborando testbench..."
ghdl -e tb_reg8

echo "Executando simulação e gerando VCD..."
ghdl -r tb_reg8 --vcd=ondas.vcd --stop-time=100ns

echo "Limpando arquivos temporários..."
rm -f *.cf

echo "Simulação concluída."

## Comandos no terminal bash:
## chmod +x run.sh
## ./run.sh

## echo "Abrindo GTKWave..."
## gtkwave ondas.vcd &

## Abrindo o GTKWave no terminal do Windows
## Dentro do diretório do projeto, execute:
## gtkwave ondas.vcd