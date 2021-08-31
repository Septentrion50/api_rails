class UsersController < ApplicationController

  # before_action :authenticate_user!

  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.all.where(user: @user)

    render json: { 
      'user' => @user,
      'articles' => @articles
     } 
  end

  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     render json: @user, status: created, location: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  private

  def user_params 
    params.require(:user).permit(:email, :password)
  end

end
