echo "Analisando arquivos VHDL..."
ghdl -a bcd_7segmentos.vhd
ghdl -a tb_bcd_7segmentos.vhd

echo "Elaborando testbench..."
ghdl -e tb_bcd_7segmentos

echo "Executando simulação e gerando VCD..."
ghdl -r tb_bcd_7segmentos --vcd=bcd_display.vcd --stop-time=200ns

echo "Limpando arquivos temporários..."
rm -f *.cf

echo "Simulação concluída."

## Comandos no terminal:
## chmod +x run.sh
## ./run.sh

## echo "Abrindo GTKWave..."
## gtkwave bcd_display.vcd &

## Abrindo o GTKWave no terminal do Windows
## Dentro do diretório do projeto, execute:
## gtkwave bcd_display.vcd