class ChatChannel < ApplicationCable::Channel
  def subscribed
     stream_from 'TeamChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    ActionCable.server.broadcast 'TeamChannel', data['message']
    Chat.create content: data['message']
  end
end
