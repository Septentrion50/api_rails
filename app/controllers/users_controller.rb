class UsersController < ApplicationController
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
end
