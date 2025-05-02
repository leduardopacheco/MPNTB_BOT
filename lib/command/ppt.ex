defmodule MPNTBBot.Command.Ppt do
  def handle_ppt(content) do
    content |> valid_ppt_command() |> get_ppt_result()
  end

  defp valid_ppt_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!ppt", player_choice] when player_choice in ["pedra", "papel", "tesoura"] ->
        {:ok, player_choice}

      _ ->
        :error
    end
  end

  defp get_ppt_result({:ok, player_choice}) do
    bot_choice = Enum.random(["pedra", "papel", "tesoura"])

    cond do
      bot_choice == player_choice ->
        "Houve um empate! Você escolheu #{player_choice} e o bot escolheu #{bot_choice}"

      bot_choice == "pedra" and player_choice == "tesoura" ->
        "O bot ganhou! Você escolheu #{player_choice} e o bot escolheu #{bot_choice}"

      bot_choice == "tesoura" and player_choice == "papel" ->
        "O bot ganhou! Você escolheu #{player_choice} e o bot escolheu #{bot_choice}"

      bot_choice == "papel" and player_choice == "pedra" ->
        "O bot ganhou! Você escolheu #{player_choice} e o bot escolheu #{bot_choice}"

      true ->
        "O jogador venceu! Você escolheu #{player_choice} e o bot escolheu #{bot_choice}"
    end
  end

  defp get_ppt_result(_value) do
    "Comando errado. Use: **!ppt pedra|papel|tesoura**"
  end
end
