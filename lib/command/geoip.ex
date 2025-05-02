defmodule MPNTBBot.Command.Ip do
  def handle_ip(content) do
    case String.split(content, " ") do
      ["!ip", ip] ->
        {:ok, response} = HTTPoison.get("https://ipapi.co/#{ip}/json/")
        {:ok, json} = JSON.decode(response.body)
        "#{ip} está localizado em #{json["city"]}, #{json["region"]}, #{json["country_name"]}"

      _ -> "Uso: **!ip <endereço_ip>**"
    end
  end
end
