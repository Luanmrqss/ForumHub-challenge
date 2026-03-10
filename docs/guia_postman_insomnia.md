# Guia de Testes da API ForumHub (Postman / Insomnia)

Este guia explica como testar os endpoints da API utilizando ferramentas de cliente HTTP.

## 1. Configuração Inicial

- **URL Base:** `http://localhost:8080`
- **Content-Type:** `application/json`

---

## 2. Autenticação (Login)

Como a API é protegida, o primeiro passo é obter um token JWT.

- **Método:** `POST`
- **Endpoint:** `/login`
- **Payload (JSON):**
```json
{
    "login": "seu_usuario@email.com",
    "senha": "sua_senha_aqui"
}
```
> [!IMPORTANT]
> A API utiliza BCrypt para senhas. Se você ainda não tem um usuário no banco de dados, insira um manualmente via SQL para teste:
> `INSERT INTO usuarios (login, senha) VALUES ('admin@forum.com', '$2a$10$Y50UaMFOxteibQEYfDj6X.9zK0L4p3u6Z.52u55W5O8YI3eP8O6mW');` (A senha é `123456`).

- **Resposta esperada:** Você receberá um campo `token`. Copie esse valor.

---

## 3. Configurando a Autorização

Para todos os outros endpoints abaixo, você deve configurar o Header de Autorização:

1. Vá na aba **Auth** (Postman) ou **Auth** (Insomnia).
2. Selecione o tipo **Bearer Token**.
3. No campo do Token, cole o valor recebido no login.

O Header final será: `Authorization: Bearer <seu_token>`

---

## 4. Endpoints de Tópicos

### Listar Tópicos
- **Método:** `GET`
- **Endpoint:** `/topicos`
- **Parâmetros opcionais:** `page`, `size`, `sort` (ex: `/topicos?size=5&sort=dataCriacao,desc`)

### Cadastrar Novo Tópico
- **Método:** `POST`
- **Endpoint:** `/topicos`
- **Payload (JSON):**
```json
{
    "titulo": "Dúvida sobre Spring Boot",
    "mensagem": "Como configurar o Security?",
    "curso": "Spring Boot 3"
}
```

### Detalhar Tópico
- **Método:** `GET`
- **Endpoint:** `/topicos/{id}`

### Atualizar Tópico
- **Método:** `PUT`
- **Endpoint:** `/topicos/{id}`
- **Payload (JSON):**
```json
{
    "titulo": "Título Atualizado",
    "mensagem": "Mensagem atualizada"
}
```

### Excluir Tópico
- **Método:** `DELETE`
- **Endpoint:** `/topicos/{id}`
- **Resposta esperada:** `204 No Content`

---

## 5. Testando com Inso CLI

O Inso é a ferramenta de linha de comando do Insomnia. Ele permite rodar testes e lintar especificações diretamente do terminal.

### Instalação (Local)
A ferramenta foi extraída em `./bin/inso_cli/`. Você pode usá-la chamando:
`./bin/inso_cli/inso --version`

### Comandos Úteis
Se você tiver um arquivo de especificação OpenAPI (ex: `swagger.yaml`) ou uma coleção exportada do Insomnia, poderá usar:

- **Lintar especificação:**
  `./bin/inso_cli/inso lint spec [arquivo]`

- **Rodar testes unitários (do Insomnia):**
  `./bin/inso_cli/inso run test [coleção]`

- **Exportar Dockerfile (se aplicável):**
  `./bin/inso_cli/inso export help`

> [!TIP]
> Para facilitar o uso, você pode adicionar o binário ao seu PATH:
> `export PATH="$PATH:$(pwd)/bin/inso_cli"`

