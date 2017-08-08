class UsersController < ApplicationController
  include ApiResponseConcern

  before_action :require_admin, only: [:create]

  def create
    new_user = User.new(user_params)
    render_resource_response(new_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :account_type)
  end
end
