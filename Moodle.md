#Instalando Moodle no Docker

Versão Bitnami

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

Versão oficial

    #!/usr/bin/env bash
    set -e
    
    # Diretório base
    DEST_DIR="./moodle-docker"
    mkdir -p "$DEST_DIR/db"
    mkdir -p "$DEST_DIR/moodledata"
    mkdir -p "$DEST_DIR/moodle-app"
    
    # Caminho do docker-compose.yml
    COMPOSE_FILE="${DEST_DIR}/docker-compose.yml"
    
    # Criar Dockerfile para instalar Moodle 4.5 via wget (.tgz)
    cat > "${DEST_DIR}/moodle-app/Dockerfile" <<'DOCKERFILE'
    FROM php:8.3-apache
    
    # Instalar dependências
    RUN apt-get update && apt-get install -y \
        unzip curl default-mysql-client git \
        libpng-dev libjpeg-dev libfreetype6-dev \
        libzip-dev libxml2-dev libicu-dev libcurl4-openssl-dev \
        libonig-dev \
     && docker-php-ext-configure gd --with-freetype --with-jpeg \
     && docker-php-ext-install -j$(nproc) \
          gd zip mysqli pdo pdo_mysql soap intl mbstring curl opcache \
     && rm -rf /var/lib/apt/lists/*
    
    # Baixar Moodle 4.5
    WORKDIR /var/www/html
    RUN curl -L -o moodle.tgz https://download.moodle.org/download.php/direct/stable405/moodle-latest-405.tgz \
     && tar -xzf moodle.tgz \
     && rm moodle.tgz \
     && cp -a moodle/. . \
     && rm -rf moodle \
     && mkdir -p /var/www/moodledata \
     && chown -R www-data:www-data /var/www/html /var/www/moodledata
    
    # Configurar Apache
    RUN a2enmod rewrite \
     && echo "<Directory /var/www/html>\n    AllowOverride All\n</Directory>" > /etc/apache2/conf-available/moodle.conf \
     && a2enconf moodle
    
    # Ajustes no PHP
    RUN echo "max_input_vars = 5000" > /usr/local/etc/php/conf.d/moodle.ini
    DOCKERFILE
    
    # Criar docker-compose.yml
    cat > "$COMPOSE_FILE" <<EOF
    version: '3.8'
    
    services:
      db:
        image: mysql:8.0
        restart: always
        environment:
          MYSQL_DATABASE: moodle
          MYSQL_USER: usuariomoodle
          MYSQL_PASSWORD: acessodbmoodle
          MYSQL_ROOT_PASSWORD: acessorootdbmoodle
        command: --default-authentication-plugin=mysql_native_password
        volumes:
          - ./db:/var/lib/mysql
    
      moodle:
        build: ./moodle-app
        restart: always
        depends_on:
          - db
        ports:
          - "8080:80"
        environment:
          MOODLE_DB_HOST: db
          MOODLE_DATABASE_PORT_NUMBER: 3306
          MOODLE_DB_NAME: moodle
          MOODLE_DB_USER: usuariomoodle
          MOODLE_DB_PASSWORD: acessodbmoodle
        volumes:
          - ./moodledata:/var/www/moodledata
    EOF
    
    # Mensagem final
    echo "✅ docker-compose.yml criado em: ${COMPOSE_FILE}"
    echo "📁 Estrutura de diretórios criada:"
    echo "  - ${DEST_DIR}/db/"
    echo "  - ${DEST_DIR}/moodledata/"
    echo "  - ${DEST_DIR}/moodle-app/ (contém Dockerfile com Moodle 4.5)"
    
    echo "🚀 Para subir os containers, execute:"
    echo "cd ${DEST_DIR} && docker compose up -d"
    
