defmodule MPNTBBot.Command.Cep do
  def handle_cep(content) do
    content |> valid_cep_command() |> get_cep_result()
  end

  defp valid_cep_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!cep", value] -> {:ok, value}
      _ -> :error
    end
  end

  defp get_cep_result({:ok, value}) do
    {:ok, response} = HTTPoison.get("https://viacep.com.br/ws/#{value}/json/")
    {:ok, json} = JSON.decode(response.body)

    "#{json["logradouro"]}, #{json["bairro"]}, #{json["localidade"]}, #{json["estado"]} - DDD: #{json["ddd"]}"
  end

  defp get_cep_result(:error) do
    "Comando errado. Use: **!cep <numero>**"
  end
end
