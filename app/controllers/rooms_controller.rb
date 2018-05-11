class RoomsController < ApplicationController

  def show
    @users = Searches.where(:conversation_id => @room_id)
    @room_id = params[:room_id]
    @messages = Message.where(conversation_id: @room_id).all.order('created_at DESC')
  end


end
