class RoomsController < ApplicationController

  def show
    @room_id = params[:room_id]
    @messages = Message.where(conversation_id: @room_id)
    @messages = Message.all.order('created_at DESC')
    @participants = Participant.where(:conversation_id => @room_id)
  end



  def add_message
    message = Message.new
    message.user_id = params[:id]
    message.conversation_id = params[:conversation_id]
    message.content = params[:message]

    message.save
  end

end
