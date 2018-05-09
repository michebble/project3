module SessionHelper

    def logged_in?
        !!current_user
    end
    
    def current_user
        User.find_by(spotify_id: session[:spotify_id])
    end

end
