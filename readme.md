# MongoDB GridFS
Aplicação para armazenamento de imagens

Ao invés de armazenar um único arquivo o GridFS armazena pedaços dele e depois faz a referência deles como metadados.

## Instruções de setup
- Clonar o repositório
- Criar um database no mongo com o nome **gridfs_db** ou editar **MongoConfig.java**
- Garantir que possui Java e Maven na máquina
- Na raiz do projeto executar o seguinte comando:
```sh
mvn clean wildfly:deploy
```
- Access http://localhost:8080/application/

## Setup do MongoDB
Conectar ao mongo

```sh
mongo
```
Criar o database

```sh
use gridfs_db
```

Criar o usuário

```sh
db.createUser(
  {
    user: "root",
    pwd: "root",
    roles: [ { role: "readWrite", db: "gridfs_db" } ]
  }
)
```