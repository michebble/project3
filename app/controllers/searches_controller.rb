class SearchesController < ApplicationController


  def new

    #HTTPARTY
    @song_response = HTTParty.get("https://api.spotify.com/v1/me/player/currently-playing",
      :query => {
        :access_token => session[:access_token]
        })
    if @song_response.code == 200
      @song_id = @song_response['item']['id']
      @song_name = @song_response['item']['name']
      @song_artist = @song_response['item']['artists'].count > 1 ? "#{@song_response['item']['artists'][0]['name']} and others" :  "#{@song_response['item']['artists'][0]['name']}"
      @album_image_url = @song_response['item']['album']['images'][0]['url']
      @album_name = @song_response['item']['album']['name']

      @search_url = "/api/search?song_id=#{@song_id}&song_name=#{@song_name}&artist=#{@song_artist}&img_url=#{@album_image_url}&album=#{@album_name}"
    end

  end


  def show
    @user = User.find(session[:user_id])
    @match_info = Search.where(user_id: session[:user_id], conversations_id: params[:room_id] ).first
    @paired_user = User.find(@match_info.paired_user_id)
  end



  # def find_match


  #   @user = User.find_by(spotify_id: session[:spotify_id])
  #   search = Search.new
  #   search.song_id = params['song_id']
  #   search.song_name = params['song_name']
  #   search.artist = params['artist']
  #   search.img_url = params['img_url']
  #   search.album = params['album']
  #   search.user_id = @user.id
  #   search.save

  #   #DB QUERY
  #   search_matches = Search.where(:song_id => search.song_id).where.not(:user_id => @user.id).where("created_at > ?", 5.minutes.ago)
  #   if search_matches.count > 0
  #     matched_search = search_matches.sample
  #     @match_user = matched_search.user
  #     @conversation_url = create_room(@user,@match_user,matched_search)
  #     render :match
  #   else
  #     @match_user = nil
  #     redirect_to '/searches/new'
  #   end


  # end


  # def create_room(user1, user2, search)
  #   conversation = Conversation.new
  #   conversation.song_id = search.song_id
  #   conversation.song_name = search.song_name
  #   conversation.album_img_url = search.img_url
  #   conversation.artist = search.artist
  #   conversation.save

  #   participant1 = Participant.new
  #   participant1.user = user1
  #   participant1.conversation = conversation
  #   participant1.save

  #   participant2 = Participant.new
  #   participant2.user = user2
  #   participant2.conversation = conversation
  #   participant2.save

  #   return "/room?room_id=#{conversation.id}"
  # end
end
