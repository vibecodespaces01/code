echo "Analisando arquivos VHDL..."
ghdl -a flipflop_jk.vhd
ghdl -a tb_flipflop_jk.vhd

echo "Elaborando testbench..."
ghdl -e tb_flipflop_jk

echo "Executando simulação e gerando VCD..."
ghdl -r tb_flipflop_jk --vcd=flipflop_jk.vcd

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