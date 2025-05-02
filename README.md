# MPNTBBot 🤖

Um bot para Discord desenvolvido em **Elixir** usando a biblioteca [Nostrum](https://github.com/Kraigie/nostrum), com diversos comandos úteis e curiosos.

## 🚀 Como rodar

### Pré-requisitos

- [Docker](https://www.docker.com/)
- Token do bot configurado no `.env`

### Passos

1. Crie um arquivo `.env` com a variável de ambiente:

```
DISCORD_BOT_TOKEN=seu_token_aqui
```

2. Execute o bot com:

```bash
docker compose up --build
```

---

## 📦 Comandos Disponíveis

Todos os comandos devem ser utilizados com prefixo `!`.

| Comando           | Descrição                                                                 |
|-------------------|---------------------------------------------------------------------------|
| `!iss`            | Mostra a posição atual da Estação Espacial Internacional                  |
| `!crypto <moeda>` | Exibe o valor atual de uma criptomoeda (ex: `!crypto bitcoin`)            |
| `!clima <cidade>` | Mostra a previsão do tempo para a cidade informada                        |
| `!ip <ip>`     | Retorna a localização de um endereço IP                                   |
| `!nacionalidade`  | Retorna informações sobre nacionalidades em diversos países               |
| `!define <palavra>` | Retorna o significado de uma palavra (ex: `!define cup`)          |
| `!trivia`         | Envia uma curiosidade aleatória                                           |
| `!comida`         | Sugere uma comida aleatória                                               |
| `!jogo`           | Sugere um jogo aleatório                                                  |
| `!fatosciencia`   | Envia um fato científico curioso                                          |

---

## 🛠️ Tecnologias

- Elixir 1.18.3
- Nostrum (biblioteca Discord)
- HTTPoison
- Jason

---

## 📁 Estrutura

- `lib/command/` - Contém os módulos dos comandos do bot
- `lib/mpntb_bot.ex` - Módulo principal com o handler de eventos
- `config/config.exs` - Configuração do bot