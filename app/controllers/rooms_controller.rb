class RoomsController < ApplicationController

  def show
    @participants = Participant.where(:conversation_id => @room_id)
  end


  def api_post_message
    message = Message.new
    message.user_id = params[:user_id]
    message.conversation_id = params[:room_id]
    message.content = params[:message]
    message.save
  end


  def api_get_messages
    @room_id = params[:room_id]
    @messages = Message.where(conversation_id: @room_id).all.order('created_at DESC')
    p @messages
    render json: @messages
  end

end
