defmodule MPNTBBot.Command.Comida do
  def handle_comida do
    case HTTPoison.get("https://www.themealdb.com/api/json/v1/1/random.php") do
      {:ok, %{body: body}} ->
        {:ok, %{"meals" => [meal]}} = Jason.decode(body)
        nome = meal["strMeal"]
        categoria = meal["strCategory"]
        area = meal["strArea"]
        link = meal["strSource"] || meal["strYoutube"]
        "🍽️ Receita: #{nome}\nCategoria: #{categoria} | Origem: #{area}\n🔗 #{link}"

      _ ->
        "Erro ao buscar receita."
    end
  end
end
