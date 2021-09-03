class Api::UsersController < Api::BaseController

  before_action :find_user, only: %w[show]

  def show
    render_jsonapi_response(@user)
  end

  def update
    @user = find_user()
    @user.update(user_params)
    render_jsonapi_response(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname)
  end

  def find_user
    @user = User.find(params[:id])
  end

end