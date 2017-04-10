class MessageMailer < ApplicationMailer
  default from: "kupelikeproject@gmail.com"
  default to: "kupelikeproject@gmail.com"

  def new_message(message)
    @message = message

    mail subject: "Message from #{message.name}"
  end

  def new_register(message)
    @message = message

    mail subject: "Message from #{message.name}"
  end

  def send_aviso(client, item, place)
    @client = client
    @item = item
    @place = place

    mail(to: @client.email, subject: "Message from KupeLike")
  end
end
