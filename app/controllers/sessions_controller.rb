class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    if user = User.login(user_params)
      user.regenerate_token
      render json: { token: user.token }, status: :ok
    else
      render_unauthorized("Incorrect login credentials")
    end
  end

  def destroy
    logout
    head :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def logout
    current_user.destroy_token
  end
end
