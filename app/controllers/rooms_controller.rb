class RoomsController < ApplicationController

  def show
    @room_id = params[:room_id]
    @messages = Message.where(conversation_id: @room_id)
    @messages = Message.all.order('created_at DESC')
    @participants = Participant.find_by(:conversation_id => @room_id)
    raise ''
  end


  def create
    conversation = Conversation.new
    conversation.save

    participant1 = Participant.new
    participant1.user = User.find(params[:user1_id])
    participant1.conversation = conversation
    participant1.save
    
    participant2 = Participant.new
    participant2.user = User.find(params[:user2_id])
    participant2.conversation = conversation
    participant2.save

    redirect_to "/room?room_id=#{conversation.id}"
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
