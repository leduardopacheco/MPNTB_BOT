defmodule MPNTBBot.Command.ISS do
  def handle_iss do
    {:ok, response} = HTTPoison.get("http://api.open-notify.org/iss-now.json")
    {:ok, json} = JSON.decode(response.body)
    "A Estação Espacial Internacional está em: Latitude #{json["iss_position"]["latitude"]}, Longitude #{json["iss_position"]["longitude"]}"
  end
end
