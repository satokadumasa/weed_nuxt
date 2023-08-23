class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    pp "ChatChannel::subscribed()"
    stream_from 'chat'
    stream_from "chat_#{params[:room]}"
    ActionCable.server.broadcast("chat_#{params[:room]}", { sender: "system",user_id: "", username:"system" , message: "CONNECTED", now: nowis })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    PP "ChatChannel::unsubscribed()"
  end

  def speak(data)
    pp "ChatChannel::speak() START"
    pp "ChatChannel::speak() sender:" << data["sender"]
    pp "ChatChannel::speak() data.message:" << data["message"]
    nowis = DateTime.now.strftime("%Y年%m月%d日 %H時%M分%S秒")
    ActionCable.server.broadcast("chat_#{params[:room]}", { sender: data["sender"], user_id: data["user_id"], username: data["username"] , message: data["message"], now: nowis})
    pp "ChatChannel::speak() END"
  end
end
