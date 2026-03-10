# ForumHub API - Challenge Alura ONE

![Java](https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=openjdk)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.3-brightgreen?style=for-the-badge&logo=springboot)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-blue?style=for-the-badge&logo=postgresql)
![JWT](https://img.shields.io/badge/JWT-Tokens-black?style=for-the-badge&logo=jsonwebtokens)

Este projeto é uma API REST robusta para um fórum de discussões, desenvolvida como o desafio final do programa **Alura ONE (Oracle Next Education)**. A API permite gerenciar tópicos, usuários e autenticação de forma segura e eficiente.

---

## 🚀 Funcionalidades Principais

- **Gestão de Tópicos**:
  - 📝 Cadastro de novos tópicos com validação de duplicidade.
  - 📋 Listagem paginada e ordenada por data de criação.
  - 🔍 Detalhamento de tópicos por ID.
  - 🔄 Atualização de título e mensagem.
  - 🗑️ Exclusão de tópicos.
- **Segurança**:
  - 🔐 Autenticação via Token JWT (Stateless).
  - 🛡️ Proteção de endpoints sensíveis com Spring Security.
  - 🔑 Criptografia de senhas com BCrypt.
- **Arquitetura**:
  - 🗄️ Persistência com Spring Data JPA e PostgreSQL.
  - 🚀 Versionamento de banco de dados com Flyway.
  - 🏗️ Organização seguindo boas práticas de código limpo e SOLID.

---

## 🛠️ Pré-requisitos e Ambiente

Para rodar este projeto, você precisará de:

- **JDK 21 (LTS)**: Versão recomendada para compatibilidade total.
- **Maven 3.x**: Para gerenciamento de dependências.
- **PostgreSQL 14+**: Como banco de dados principal.

### Configuração do Java (Linux)
Se você estiver enfrentando problemas de versão do Java, certifique-se de definir o `JAVA_HOME`:
```bash
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
```

---

## ⚙️ Configuração do Banco de Dados

1. **Crie o banco de dados**:
   ```sql
   CREATE DATABASE forumhub;
   ```
2. **Ajuste de Autenticação (Linux)**:
   Caso receba erro de `Ident authentication`, altere o seu `pg_hba.conf` para `md5` e defina a senha:
   ```bash
   sudo -u postgres psql -c "ALTER USER postgres PASSWORD '123456';"
   ```

---

## 🔌 Variáveis de Ambiente

Configure as seguintes variáveis no seu ambiente ou edite o `application.properties`:

| Variável | Descrição | Valor Padrão |
| :--- | :--- | :--- |
| `spring.datasource.url` | URL de conexão JDBC | `jdbc:postgresql://localhost:5432/forumhub` |
| `spring.datasource.username` | Usuário do banco | `postgres` |
| `spring.datasource.password` | Senha do banco | `123456` |
| `FORUMHUB_JWT_SECRET` | Chave secreta para JWT | `12345678` |

---

## 🏁 Como Rodar

```bash
# Clone o projeto
git clone [URL_DO_REPOSITORIO]

# Entre na pasta
cd forumhub

# Compile e rode a aplicação
./mvnw clean spring-boot:run
```
A API estará disponível em `http://localhost:8080`.

---

## 🧪 Testando a API

### Clientes HTTP
Você pode importar as coleções para **Postman** ou **Insomnia**. Veja o guia detalhado em:
👉 [Guia de Testes (Postman / Insomnia)](docs/guia_postman_insomnia.md)

### Inso CLI (Terminal)
Se você preferir testar via linha de comando, configuramos o Inso CLI:
```bash
./bin/inso_cli/inso --version
```
Consulte o guia na seção 5 para mais detalhes sobre os comandos do Inso.

---

## ✒️ Autor
Desenvolvido por **Luan** - Estudante Alura ONE.

---
> "Todo código é um poema em construção." ☕
