class SysMessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    pp "SysMessageChannel::subscribed() params:" << params.inspect
    stream_from "sys_message_#{params[:room]}"
    ActionCable.server.broadcast("sys_message_#{params[:room]}", { sender: "system", body: "CONNECTED" })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    PP "SysMessageChannel::unsubscribed()"
  end

  def speak(data)
    pp "SysMessageChannel::speak() START"
    ActionCable.server.broadcast("sys_message_#{params[:room]}", { sender: current_user.name, body: data['message'] })
    pp "SysMessageChannel::speak() END"
  end
end
