class SysMessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    pp "SysMessageChannel::subscribed()"
    stream_from 'chat'
  end

  def unsubscribed
    PP "SysMessageChannel::unsubscribed()"
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    pp "SysMessageChannel::speak() START"
    ActionCable.server.broadcast('chat', { sender: current_user.name, body: data['message'] })
    pp "SysMessageChannel::speak() END"
  end
end
