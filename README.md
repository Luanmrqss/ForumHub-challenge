# ForumHub API - Challenge Alura ONE

Este projeto é uma API REST para um fórum, desenvolvida como parte do desafio ForumHub da Alura/Oracle Next Education.

## 🚀 Funcionalidades

- **CRUD de Tópicos**: Criação, listagem (com paginação e ordenação), detalhamento, atualização e exclusão.
- **Autenticação JWT**: Segurança implementada com Spring Security e JSON Web Token.
- **Validações**: Regras de negócio para evitar tópicos duplicados e garantir campos obrigatórios.
- **Banco de Dados**: Persistência utilizando PostgreSQL e versionamento com Flyway.

## 🛠️ Tecnologias Utilizadas

- **Java 17+** (usando Java 25 neste ambiente)
- **Spring Boot 3**
- **Spring Data JPA**
- **Spring Security**
- **auth0 java-jwt**
- **PostgreSQL**
- **Flyway Migration**
- **Lombok**
- **Maven**

## 🏁 Como Rodar o Projeto

1. Clone o repositório.
2. Certifique-se de ter o PostgreSQL rodando.
3. Configure as variáveis no `application.properties` ou defina as variáveis de ambiente:
    - `spring.datasource.url`
    - `spring.datasource.username`
    - `spring.datasource.password`
    - `FORUMHUB_JWT_SECRET` (senha para o token)
4. Execute o comando:
   ```bash
   ./mvnw spring-boot:run
   ```

## 🔌 Endpoints Principais

### Autenticação
- `POST /login`: Recebe `login` e `senha` e retorna o Token JWT.

### Tópicos (Requer Token Bearer)
- `POST /topicos`: Cadastra um novo tópico.
- `GET /topicos`: Lista todos os tópicos (paginado).
- `GET /topicos/{id}`: Detalha um tópico específico.
- `PUT /topicos/{id}`: Atualiza os dados de um tópico.
- `DELETE /topicos/{id}`: Remove um tópico.

---
Desenvolvido por um estudante apaixonado por Java! ☕
