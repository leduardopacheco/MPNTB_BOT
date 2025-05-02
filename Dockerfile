FROM elixir:1.18.3-alpine

WORKDIR /usr/src/mpntb_bot

COPY . .

RUN mix local.hex --force \
 && mix local.rebar --force \
 && mix deps.get || mix deps.get

CMD ["mix", "run", "--no-halt"]
