

#!/usr/bin/env bash
set -e

# Diretório onde o docker-compose.yml será criado
DEST_DIR="./moodle-docker"
mkdir -p "$DEST_DIR"

# Criação das pastas de dados para os volumes
mkdir -p "$DEST_DIR/db"
mkdir -p "$DEST_DIR/moodledata"

# Caminho completo do arquivo
COMPOSE_FILE="${DEST_DIR}/docker-compose.yml"

# Criação do arquivo docker-compose.yml
cat > "$COMPOSE_FILE" <<EOF
version: '3.8'

services:
  db:
    image: mariadb:10.6
    restart: always
    environment:
      MYSQL_DATABASE: moodle
      MYSQL_USER: usuariomoodle
      MYSQL_PASSWORD: acessodbmoodle
      MYSQL_ROOT_PASSWORD: acessorootdbmoodle
    volumes:
      - ./db:/var/lib/mysql

  moodle:
    image: bitnami/moodle:4.3.3
    restart: always
    ports:
      - "8080:80"
    environment:
      MOODLE_DATABASE_HOST: db
      MOODLE_DATABASE_PORT_NUMBER: 3306
      MOODLE_DATABASE_NAME: moodle
      MOODLE_DATABASE_USER: usuariomoodle
      MOODLE_DATABASE_PASSWORD: acessodbmoodle
    volumes:
      - ./moodledata:/var/www/moodledata
EOF

echo "✅ docker-compose.yml criado em: ${COMPOSE_FILE}"
echo "📁 Estrutura de diretórios criada:"
echo "  - ${DEST_DIR}/db/"
echo "  - ${DEST_DIR}/moodledata/"

echo "🚀 Para subir os containers, execute:" 
echo "cd ${DEST_DIR} && docker compose up -d"
