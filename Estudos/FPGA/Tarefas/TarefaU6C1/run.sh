echo "Analisando arquivos VHDL..."
ghdl -a porta_local_pkg.vhd
ghdl -a fsm_porta.vhd
ghdl -a tb_fsm_porta.vhd

echo "Elaborando testbench..."
ghdl -e tb_fsm_porta

echo "Executando simulação e gerando VCD..."
ghdl -r tb_fsm_porta --vcd=ondas.vcd --stop-time=170ns

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