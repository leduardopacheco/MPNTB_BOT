defmodule MPNTBBot.Command.Jogo do
  def handle_jogo do
    case HTTPoison.get("https://www.mmobomb.com/api1/games") do
      {:ok, %{body: body}} ->
        {:ok, jogos} = Jason.decode(body)
        jogo = Enum.random(jogos)
        nome = jogo["title"]
        genero = jogo["genre"]
        plataforma = jogo["platform"]
        link = jogo["game_url"]
        "🎮 Jogo: #{nome}\nGênero: #{genero} | Plataforma: #{plataforma}\n🔗 #{link}"

      _ ->
        "Erro ao buscar jogo gratuito."
    end
  end
end
