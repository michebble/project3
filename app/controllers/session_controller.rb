# require 'httparty'

class SessionController < ApplicationController

    def new
        @spotify_service = "https://accounts.spotify.com/authorize/?client_id=#{ENV['CLIENT_ID']}&response_type=code&scope=user-read-private%20user-read-currently-playing&redirect_uri=http://localhost:3000/callback/"
    end

    def spotify_callback
        access_response = HTTParty.post("https://accounts.spotify.com/api/token",
            :query => {
                :grant_type => "authorization_code",
                :code => params[:code],
                :redirect_uri => "http://localhost:3000/callback/",
                :client_id => ENV['CLIENT_ID'],
                :client_secret => ENV['CLIENT_SECRET']
                })
        if access_response.keys.include? "error"
            redirect_to '/login'
        end
        user_response = HTTParty.get("https://api.spotify.com/v1/me",
            :query => {
                :access_token => access_response["access_token"]
                })

        user = User.find_by(spotify_id: user_response['id'])
        if !!user
            redirect_to "/users/#{user.id}"
        else
            user = User.new
            user.spotify_id = user_response['id']
            user.name = user_response["display_name"].nil? ? user_response["id"] : user_response["display_name"]
            user.img_url = user_response['images'].empty? ? "http://via.placeholder.com/50x50" : user_response['images'][0]['url']
            user.save
            session[:spotify_id] = user.spotify_id
            session[:access_token] = params[:access_token]
            session[:refresh_token] = params[:refresh_token]
            redirect_to "/users/#{user.id}"
        end

        render json: user_response
    end


    def destroy
        session[:access_token] = nil
        session[:refresh_token] = nil
    end

end

 # login_response = HTTParty.get("https://api.spotify.com/v1/me/player/currently-playing",
        #     :query => {
        #         :access_token => access_response["access_token"]
        #         })
