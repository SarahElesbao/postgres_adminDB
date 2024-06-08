#!/bin/bash

function configure(){
    BASE_DIR=$(pwd)/data

    # Criando diretórios com permissões apropriadas
    mkdir -m 700 -p "$BASE_DIR/postgresql/pgdata"
    mkdir -m 777 -p "$BASE_DIR/postgresql/sshkeys"
    chmod 777 "$BASE_DIR/postgresql/sshkeys"

    # Verifique se ~/.ssh/id_rsa existe e crie se necessário
    if [ ! -f ~/.ssh/id_rsa ]; then
        ssh-keygen -b 4096 -t rsa -N '' -f ~/.ssh/id_rsa
        chmod 600 ~/.ssh/id_rsa
    fi

    # Gerando chaves SSH para PostgreSQL
    ssh-keygen -b 4096 -t rsa -N '' -f "$BASE_DIR/postgresql/sshkeys/id_rsa"
    chmod 600 "$BASE_DIR/postgresql/sshkeys/id_rsa"
    ssh-keygen -f "$BASE_DIR/postgresql/sshkeys/id_rsa" -y >> "$BASE_DIR/postgresql/sshkeys/authorized_keys"

    # Adicionando chaves de Barman ao PostgreSQL e vice-versa
    #ssh-keygen -f "$BASE_DIR/pgbarman/sshkeys/id_rsa" -y >> "$BASE_DIR/postgresql/sshkeys/authorized_keys"
    #ssh-keygen -f "$BASE_DIR/postgresql/sshkeys/id_rsa" -y >> "$BASE_DIR/pgbarman/sshkeys/authorized_keys"
    
    chmod 777 "$BASE_DIR/postgresql/sshkeys/id_rsa"
    chmod 777 "$BASE_DIR/postgresql/sshkeys/id_rsa.pub"
    chmod 777 "$BASE_DIR/postgresql/sshkeys/authorized_keys"

}

function build(){
    docker-compose --compatibility --project-name "postgresql-barman" build --memory 1g --no-cache;
}

function up(){
    docker-compose --compatibility --project-name "postgresql-barman" up -d;
}

function stop(){
    docker-compose --compatibility --project-name "postgresql-barman" stop;
}

function drop(){
    docker-compose --compatibility --project-name "postgresql-barman" down;
}

function drop_hard(){
    docker-compose --compatibility --project-name "postgresql-barman" down --remove-orphans --volumes --rmi 'all' && \
    [ -d "./data" ] && sudo rm -rf ./data;
    docker builder prune -f;
}

function populate(){
    docker exec postgres-source-db psql -U dbadmin -d 'db' -p 5432 -c "$(cat ./Postgres/populate_primary_db.sql)";
}

function seed(){
    docker exec postgres-source-db psql -U dbadmin -d 'db' -p 5432 -c "$(cat ./Postgres/populate_primary_db2.sql)";
}

$1