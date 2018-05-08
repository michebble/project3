class SearchesController < ApplicationController


  def new
  
    #HTTPARTY
    @song_response = HTTParty.get("https://api.spotify.com/v1/me/player/currently-playing",
      :query => { 
          :access_token => session[:access_token]
          })
    
    
  
  end


  def find_match

    
    user = User.find_by(spotify_id: session[:spotify_id])
    search = Search.new
    search.song_name
    
    raise ""
    #DB CREATE
    

    #DB QUERY


    #REDIRECT MATCH SHOW


  end
end
