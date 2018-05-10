class Api::SearchesController < ApplicationController
  
  def add_search
    @user = User.find(session[:user_id])
    @search = Search.new
    @search.song_id = params['song_id']
    @search.song_name = params['song_name']
    @search.artist = params['artist']
    @search.img_url = params['img_url']
    @search.album = params['album']
    @search.user_id = @user.id
    @search.save
  end

  def find_match
    #DB QUERY
    @search_matches = Search.where(:song_id => @search.song_id).where.not(:user_id => @user.id).where("created_at > ?", 5.minutes.ago)
    if @search_matches.count > 0
      matched_search = search_matches.sample
      @match_user = matched_search.user
      conversation_url = create_room(@user, @match_user, matched_search)
      result = {"match_user" => match_user, "conversation_url" => conversation_url} 
    else
      result = {"match_user" => nil, "conversation_url" => nil} 
    end
    result.to_json
    render json: result

  end
  
  def create_room(user1, user2, search) 
    conversation = Conversation.new
    conversation.song_id = search.song_id
    conversation.song_name = search.song_name
    conversation.album_img_url = search.img_url
    conversation.artist = search.artist
    conversation.save

    participant1 = Participant.new
    participant1.user = user1
    participant1.conversation = conversation
    participant1.save
    
    participant2 = Participant.new
    participant2.user = user2
    participant2.conversation = conversation
    participant2.save

    return "/room?room_id=#{conversation.id}"
  end
end