defmodule MPNTBBot.Command.Crypto do
  def handle_crypto(content) do
    case String.split(content, " ") do
      ["!crypto", symbol] ->
        symbol = String.downcase(symbol)
        {:ok, response} = HTTPoison.get("https://api.coingecko.com/api/v3/simple/price?ids=#{symbol}&vs_currencies=brl")
        {:ok, json} = JSON.decode(response.body)
        "O valor atual do #{symbol} é R$ #{json[symbol]["brl"]}"

      _ -> "Uso: **!crypto bitcoin**"
    end
  end
end
