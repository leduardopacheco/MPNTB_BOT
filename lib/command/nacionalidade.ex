defmodule MPNTBBot.Command.Nacionalidade do
  def handle_nacionalidade(content) do
    case String.split(content, " ") do
      ["!nacionalidade", nome] ->
        url = "https://api.nationalize.io/?name=#{nome}"

        case HTTPoison.get(url) do
          {:ok, %{body: body}} ->
            {:ok, %{"country" => [c | _]}} = Jason.decode(body)
            "🌍 O nome **#{nome}** é mais comum em: **#{c["country_id"]}** (probabilidade: #{Float.round(c["probability"] * 100, 1)}%)"

          _ -> "Erro ao prever a nacionalidade."
        end

      _ -> "Uso correto: **!nacionalidade <nome>**"
    end
  end
end
