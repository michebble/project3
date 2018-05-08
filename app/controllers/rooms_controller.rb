class RoomsController < ApplicationController

  def show
    params[:id] = 1
    @room_id = params[:id]
    @messages = Message.where(conversation_id: params[:id])
    @messages = Message.all.order('created_at DESC')

  end
  def new
    conversation = Conversation.new
    conversation.save
  end


  def update
    message = Message.new
    message.user_id = user.spotify_id?
    message.conversation_id = params[conversation_id]
    message.content = params["message"]

    message.save

    # need to add room id
    # room id would be the conversation_id given the moment they matched and allocated it to the participant table where both users share that conversation_id
  end

end
