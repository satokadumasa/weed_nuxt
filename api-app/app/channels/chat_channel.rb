class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'chat'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    # ActionCable.server.broadcast('chat', { sender: current_user.name, body: data['body'] })
    ActionCable.server.broadcast('chat', { sender: current_user.name, body: "message" })
  end
end
