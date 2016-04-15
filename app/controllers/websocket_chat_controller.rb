class WebsocketChatController < WebsocketRails::BaseController
  def new_message
    broadcast_message :after_new_message, message
  end
end
