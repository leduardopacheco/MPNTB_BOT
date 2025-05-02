defmodule MPNTBBot do
  use Nostrum.Consumer

  alias Nostrum.Api.Message
  alias MPNTBBot.Command.{
    Ppt,
    Cep,
    Ip,
    Define,
    ISS,
    Crypto,
    Clima,
    Trivia,
    Nacionalidade,
    Comida,
    Jogo,
    FatoCiencia,
  }

  def handle_event({:MESSAGE_CREATE, msg, _ws_status}) do
    cond do
      String.starts_with?(msg.content, "!ppt") ->
        Message.create(msg.channel_id, Ppt.handle_ppt(msg.content))

      String.starts_with?(msg.content, "!cep") ->
        Message.create(msg.channel_id, Cep.handle_cep(msg.content))

      String.starts_with?(msg.content, "!ip") ->
        Message.create(msg.channel_id, Ip.handle_ip(msg.content))

      String.starts_with?(msg.content, "!define") ->
        Message.create(msg.channel_id, Define.handle_define(msg.content))

      String.starts_with?(msg.content, "!iss") ->
        Message.create(msg.channel_id, ISS.handle_iss())

      String.starts_with?(msg.content, "!crypto") ->
        Message.create(msg.channel_id, Crypto.handle_crypto(msg.content))
      
      String.starts_with?(msg.content, "!clima") ->
        Message.create(msg.channel_id, Clima.handle_clima(msg.content))
      
      String.starts_with?(msg.content, "!trivia") ->
        Message.create(msg.channel_id, Trivia.handle_trivia())

      String.starts_with?(msg.content, "!nacionalidade") ->
        Message.create(msg.channel_id, Nacionalidade.handle_nacionalidade(msg.content))
        
      String.starts_with?(msg.content, "!comida") ->
        Message.create(msg.channel_id, Comida.handle_comida())

      String.starts_with?(msg.content, "!jogo") ->
        Message.create(msg.channel_id, Jogo.handle_jogo())

      String.starts_with?(msg.content, "!fatosciencia") ->
        Message.create(msg.channel_id, FatoCiencia.handle_fatosciencia())

      true ->
        :ignore
    end
  end
end
