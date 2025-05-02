defmodule MPNTBBot.Command.FatoCiencia do
  def handle_fatosciencia do
    url = "https://uselessfacts.jsph.pl/api/v2/facts/random?language=pt"

    case HTTPoison.get(url) do
      {:ok, %{body: body}} ->
        {:ok, %{"text" => fact}} = Jason.decode(body)
        "🧬 Fato científico: #{fact}"

      _ ->
        "Erro ao buscar fato científico."
    end
  end
end
