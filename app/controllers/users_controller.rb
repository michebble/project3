class UsersController < ApplicationController

  def comments
    @user = current_user
  end

  def index
    # this can be changed in the future
    # @user = User.find(params[:id])
    @search = Search.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @searches = @user.searches.order('created_at DESC')
  end

end
