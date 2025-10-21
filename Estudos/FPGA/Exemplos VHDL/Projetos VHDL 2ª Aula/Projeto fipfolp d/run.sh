echo "Analisando arquivos VHDL..."
ghdl -a flipflop_d.vhd
ghdl -a tb_flipflop_d.vhd

echo "Elaborando testbench..."
ghdl -e tb_flipflop_d

echo "Executando simulação e gerando VCD..."
ghdl -r tb_flipflop_d --vcd=flipflop_d.vcd

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