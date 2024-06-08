<center>

# Postgresql com PgBarman

Projeto dedicado a exemplificar o gerenciamento de backups com o PgBarman

</center>

> IMPORTANTE
> Todos os comandos a seguir devem ser executados na pasta raiz do projeto

---

<center>

## Rodar

</center>

Projeto precisa de algumas pastas e arquivos de chaves para comunicar as duas instâncias (banco de dados -> gerenciador de backup).
```bash
bash run.sh configure;
```

Buildar.
```bash
bash run.sh build;
```


Levantar os containers.
```bash
bash run.sh up;
```


Parar os containers.
```bash
bash run.sh stop;
```


Parar e remover os containers.
```bash
bash run.sh drop;
```


Parar, remover os containers e pastas e chaves criados (Remover por completo o projeto da maquina). Lembrando que estamos usando volumes do tipo bind para ficara mais fácil de visualizar os arquivos sendo criados.
```bash
bash run.sh drop_hard;
```

> IMPORTANTE
> Depois do `bash run.sh drop_hard` todos os dados registrados ou utilizados para testes serão perdidos


---

<center>

## Importar

</center>

Para popular o banco de dados.
```bash
bash run.sh populate;
```

---

<center>

## Manutenção

</center>

Para garantir a inicialização do barman.
```bash
docker exec pg-barman barman cron;
```

Para verificar se esta tudo `OK` com os servers gerenciados pelo Barman.
```bash
docker exec pg-barman barman check all;
```

Para realizar um backup de todos os servers gerenciados pelo Barman.
```bash
docker exec pg-barman barman backup all;
```

---

<center>

## Possiveis problemas

</center>

Após iniciar os containers pela primeira vez pode haver a necessidade de importar todos os WALs para o container do barman.
```bash
docker exec pg-barman barman switch-wal --force --archive all;
```

Para utilizar no WSL. Abra o arquivo /etc/wsl.conf no seu editor de texto preferido:
```bash
sudo nano /etc/wsl.conf
```
Adicione ou edite as seguintes linhas:
```bash
[automount]
options = "metadata,umask=22,fmask=11"
```

Reinicie o WSL:
```bash
wsl --shutdown
wsl
```
