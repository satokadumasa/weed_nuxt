class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_#{params[:room]}"
    nowis = DateTime.now.strftime("%Y年%m月%d日 %H時%M分%S秒")
    user = User.find(params[:user_id])
    ActionCable.server.broadcast("chat_#{params[:room]}", { sender: user[:nickname],user_id: "1", username: user[:nickname] , message: "[" << user[:nickname] << "] JOIN THIS ROOM", now: nowis })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    PP "ChatChannel::unsubscribed()"
  end

  def speak(data)
    pp "ChatChannel::speak() START"
    nowis = DateTime.now.strftime("%Y年%m月%d日 %H時%M分%S秒")
    ActionCable.server.broadcast("chat_#{params[:room]}", { sender: data["username"], user_id: data["user_id"], username: data["username"] , message: data["message"], now: nowis})
    pp "ChatChannel::speak() END"
  end
end
