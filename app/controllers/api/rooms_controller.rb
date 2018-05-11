class RoomsController < ApplicationController


  def create
    message = Message.new
    message.user_id = session[:user_id]
    message.conversation_id = params[:room_id]
    message.content = params[:message]
    message.save
  end


  def index
    @room_id = params[:room_id]
    @messages = Message.where(conversation_id: @room_id).all.order('created_at DESC')
    p @messages
    render json: @messages
  end

end
