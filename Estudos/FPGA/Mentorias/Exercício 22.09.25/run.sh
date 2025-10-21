// ...existing code...
#!/usr/bin/env bash
set -euo pipefail

# Executa a partir do diretório do script
cd "$(dirname "$0")"

# Arquivos SV preferenciais
SV_FILES=(mp.sv tb.sv)

# Se algum preferencial não existir, usa todos os .sv do diretório
for f in "${SV_FILES[@]}"; do
    if [ ! -f "$f" ]; then
        SV_FILES=( *.sv )
        break
    fi
done

echo "Compilando: ${SV_FILES[*]}"
iverilog -g2012 -o sim "${SV_FILES[@]}"

echo "Executando simulação..."
vvp sim

echo "Simulação concluída. Abra o .vcd gerado externamente."

## Comandos no terminal:
## chmod +x run.sh
## ./run.sh

## echo "Abrindo GTKWave..."
## gtkwave ondas.vcd &