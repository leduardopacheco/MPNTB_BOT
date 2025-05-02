defmodule MPNTBBot.Command.Clima do
  def handle_clima(content) do
    case String.split(content, " ") do
      ["!clima", cidade] ->
        cidade_query = URI.encode(cidade)
        url = "https://wttr.in/#{cidade_query}?format=3"

        case HTTPoison.get(url) do
          {:ok, %{body: body}} -> body
          _ -> "Erro ao buscar o clima para #{cidade}."
        end

      _ -> "Uso correto: **!clima <cidade>**"
    end
  end
end
