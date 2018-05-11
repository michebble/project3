class Api::SearchesController < ApplicationController

  def add_search
    user = User.find(session[:user_id])
    search = Search.new
    search.song_id = params['song_id']
    search.song_name = params['song_name']
    search.artist = params['artist']
    search.img_url = params['img_url']
    search.album = params['album']
    search.user_id = user.id
    search.save
    
    render json: search
  end

  def find_match
    #DB QUERY
    search = Search.find(params[:search_id])
    search_matches = Search.where(:song_id => search.song_id).where.not(:user_id => search.user.id).where("created_at > ?", 5.minutes.ago).where(:paired_user_id => nil)

    if search_matches.count > 0
      matched_search = search_matches.sample
      match_user = matched_search.user

      conversation = Conversation.new
      conversation.song_id = search.song_id
      conversation.song_name = search.song_name
      conversation.album_img_url = search.img_url
      conversation.artist = search.artist
      conversation.save

      search.conversations_id = conversation.id
      search.paired_user_id = matched_search.user.id
      search.save
      matched_search.conversations_id = conversation.id
      matched_search.paired_user_id = search.user.id
      matched_search.save

      conversation_url = "/room?room_id=#{conversation.id}"
      result = {"conversation_url" => conversation_url}
    else
      result = {"conversation_url" => nil}
    end
    result.to_json
    render json: result

  end

end
