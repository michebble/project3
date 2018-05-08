# require 'httparty'

class SessionController < ApplicationController

    def new
        p "ENV::::::#{ENV['CLIENT_ID']}"
        @spotify_service = "https://accounts.spotify.com/authorize/?client_id=#{ENV['CLIENT_ID']}&response_type=code&scope=user-read-private&redirect_uri=http://localhost:3000/callback/"
    end

    def spotify_callback
        # access_token = params[:access_token]
        p params
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