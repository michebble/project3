class RoomsController < ApplicationController

  def show
    @participants = Participant.where(:conversation_id => @room_id)
  end


end
