defmodule MPNTBBot.Command.Define do
  def handle_define(content) do
    case String.split(content, " ") do
      ["!define", word] ->
        {:ok, response} = HTTPoison.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{word}")
        {:ok, [json | _]} = JSON.decode(response.body)
        meaning = json["meanings"] |> hd() |> Map.get("definitions") |> hd() |> Map.get("definition")
        "**#{word}**: #{meaning}"

      _ -> "Uso: **!define palavra**"
    end
  end
end
