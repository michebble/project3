class UsersController < ApplicationController

  #
  # def index
  #   @users = User.all.order('created_at DESC')
  # end
  #
  # def new
  #   # @user = User.new
  # end
  #
  # def create
  #   @user = User.new(post_params)
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end
  #
  # def show
  #   @user = User.find(params[:id])
  # end

  def index
    # this can be changed in the future
    @search = Search.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @search = Search.all.order('created_at DESC')
  end

end
