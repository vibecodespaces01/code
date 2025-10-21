# RESIDÊNCIA PROFISSIONAL EM FPGA
# EmbarcaTech IFMA MTC
# Discente: Renato da Fonseca Oliveira

# ATIVIDADE
# Faça um exemplo que detecte a ordem de vetores 001, 100, 101, 011 em Mealey

echo "Analisando arquivos VHDL..."
ghdl -a DetectorVetorialdeMealy.vhd
ghdl -a tbDetectorVetorialdeMealy.vhd

echo "Elaborando testbench..."
ghdl -e tbDetectorVetorialdeMealy

echo "Executando simulação e gerando VCD..."
ghdl -r tbDetectorVetorialdeMealy --vcd=DetectorVetorialdeMealy.vcd --stop-time=1000ns

echo "Limpando arquivos temporários..."
rm -f *.cf

echo "Simulação concluída."

## Comandos no terminal:
## chmod +x run.sh
## ./run.sh

## echo "Abrindo GTKWave..."
## gtkwave DetectorVetorialdeMealy.vcd &

## Abrindo o GTKWave no terminal do Windows
## Dentro do diretório do projeto, execute:
## gtkwave DetectorVetorialdeMealy.vcd