class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    pp "ChatChannel::subscribed()"
    stream_from 'chat'
  end

  def unsubscribed
    PP "ChatChannel::unsubscribed()"
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    pp "ChatChannel::speak() START"
    pp "ChatChannel::speak() data" << data.inspect
    ActionCable.server.broadcast('chat', { sender: current_user.name, body: data['message'] })
    # ActionCable.server.broadcast('chat', { sender: current_user.name, body: "message" })
    pp "ChatChannel::speak() END"
  end
end
