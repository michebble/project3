class RoomsController < ApplicationController
  def show
    @room_id = params[:id]
    @messages = Message.where(conversation_id: params[:id])

  end
  def new
    conversation = Conversation.new
    conversation.save
  end


  def update
    message = Message.new
    message.user_id = user.spotify_id
    message.conversation_id = params[conversation_id]
    message.content = params["message"]

    message.save

    # need to add room id
  end

end
