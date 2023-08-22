class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    pp "ChatChannel::subscribed()"
    stream_from 'chat'
    stream_from "chat_#{params[:room]}"
    ActionCable.server.broadcast("chat_#{params[:room]}", { sender: "system", message: "CONNECTED" })
  end

  def unsubscribed
    PP "ChatChannel::unsubscribed()"
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    pp "ChatChannel::speak() START"
    pp "ChatChannel::speak() sender:" << data["sender"]
    pp "ChatChannel::speak() data.message:" << data["message"]

    # pp "ChatChannel::speak() params:" << params.inspect
    ActionCable.server.broadcast("chat_#{params[:room]}", { sender: data["sender"], message: data["message"] })
    pp "ChatChannel::speak() END"
  end
end
