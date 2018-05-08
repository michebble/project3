class SessionController < ApplicationController

    def new
    end

    def spotify_session
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