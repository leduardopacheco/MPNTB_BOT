defmodule MPNTBBot.Command.Trivia do
  def handle_trivia do
    url = "https://opentdb.com/api.php?amount=1&type=multiple"

    case HTTPoison.get(url) do
      {:ok, %{body: body}} ->
        {:ok, %{"results" => [q]}} = Jason.decode(body)
        pergunta = q["question"] |> HtmlEntities.decode()
        categoria = q["category"]
        "🧠 Categoria: #{categoria}\n❓ Pergunta: #{pergunta}"

      _ ->
        "Erro ao buscar pergunta de trivia."
    end
  end
end
