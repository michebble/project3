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
            return "NO"
        else
            user_response = HTTParty.get("https://api.spotify.com/v1/me",
                :query => { 
                    :access_token => access_response["access_token"]
                    })
            render json: user_response
            # raise 'ERROR'
        end

        # login_response = HTTParty.get("https://api.spotify.com/v1/me/player/currently-playing",
        #     :query => { 
        #         :access_token => access_response["access_token"]
        #         })
        

    end

    def create
        user = User.find_by(spotify_auth: params[:spotify_auth])
        if !!user
            session[:access_token] = params[:access_token]
            session[:refresh_token] = params[:refresh_token]
            redirect_to '/login'
        else
            render :new
        end
    end


    def destroy
        session[:access_token] = nil
        session[:refresh_token] = nil
    end

end