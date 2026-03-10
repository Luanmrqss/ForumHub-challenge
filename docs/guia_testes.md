# Guia de Testes do Projeto ForumHub

Este guia fornece instruções passo a passo para testar a aplicação ForumHub, tanto de forma automatizada quanto manual.

## 1. Pré-requisitos
Antes de começar, certifique-se de que:
- Você tem o **Java 25** (ou superior) instalado.
- O **PostgreSQL** está rodando localmente (porta 5432).
- O banco de dados chamado `forumhub` foi criado.
- A variável de ambiente `FORUMHUB_JWT_SECRET` está configurada (ou use o padrão `12345678`).

### Solução de Problemas: PostgreSQL no Fedora
Se o serviço do PostgreSQL falhar ao iniciar com o erro "Directory is missing or empty", execute:
```bash
sudo postgresql-setup --initdb
sudo systemctl enable postgresql
sudo systemctl start postgresql
```
Em seguida, crie o banco de dados:
```bash
sudo -u postgres psql -c "CREATE DATABASE forumhub;"
```

---

## 2. Testes Automatizados (Maven)

O Maven é usado para gerenciar os testes automatizados da aplicação.

### Como Executar:
Abra o terminal na raiz do projeto e execute:
```bash
./mvnw test
```

### O que acontece:
- O Spring Boot iniciará o contexto de teste.
- O Flyway executará as migrações no banco de dados.
- O JUnit executará todos os testes encontrados em `src/test/java`.

---

## 3. Testes Manuais (API REST)

Para testar os endpoints da API, você pode usar ferramentas como **Postman**, **Insomnia** ou **curl**.

### Passo 1: Iniciar a Aplicação
```bash
./mvnw spring-boot:run
```

### Passo 2: Autenticação (Login)
Como a maioria dos endpoints é protegida, você precisa de um Token JWT.

**Requisição:**
- **URL:** `http://localhost:8080/login`
- **Metodo:** `POST`
- **Corpo (JSON):**
```json
{
  "login": "seu_usuario",
  "senha": "sua_senha"
}
```

**Resposta:** Você receberá um `token`. Copie esse valor.

### Passo 3: Criar um Tópico
**Requisição:**
- **URL:** `http://localhost:8080/topicos`
- **Metodo:** `POST`
- **Headers:** `Authorization: Bearer SEU_TOKEN_AQUI`
- **Corpo (JSON):**
```json
{
  "titulo": "Dúvida sobre Spring Boot",
  "mensagem": "Como posso configurar o Spring Security?",
  "nomeCurso": "Spring Boot 3"
}
```

### Passo 4: Listar Tópicos
**Requisição:**
- **URL:** `http://localhost:8080/topicos`
- **Metodo:** `GET`
- **Headers:** `Authorization: Bearer SEU_TOKEN_AQUI`

---

## 4. Estrutura de Testes no Código
- **`src/test/java/com/alura/forumhub`**: Contém os testes unitários e de integração.
- **`ForumhubApplicationTests.java`**: Teste básico de carregamento de contexto.

---
*Dica: Se quiser rodar apenas um teste específico:*
```bash
./mvnw test -Dtest=NomeDaClasseDeTeste
```
