class UsersController < ApplicationController
  before_action :require_admin, only: [:create]

  def create
    new_user = User.new(user_params)
    if new_user.save
      head :ok
    else
      render json: { errors: new_user.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :account_type)
  end
end
