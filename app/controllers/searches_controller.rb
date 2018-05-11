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
    @hello = "Hello World"
  end

end
