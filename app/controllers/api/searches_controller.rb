def find_match


  @user = User.find_by(spotify_id: session[:spotify_id])
  @search = Search.new
  @search.song_id = params['song_id']
  @search.song_name = params['song_name']
  @search.artist = params['artist']
  @search.img_url = params['img_url']
  @search.album = params['album']
  @search.user_id = @user.id
  @search.save

  #DB QUERY
  @search_matches = Search.where(:song_id => @search.song_id).where.not(:user_id => @user.id).where("created_at > ?", 5.minutes.ago)
  if @search_matches.count > 0
    matched_search = search_matches.sample
    @match_user = matched_search.user
    @conversation_url = create_room(@user,@match_user,matched_search)
    render :match
  else
    @match_user = nil
    redirect_to '/searches/new'
  end
  

end