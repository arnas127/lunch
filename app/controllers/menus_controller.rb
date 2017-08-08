class MenusController < ApplicationController
  include ApiResponseConcern

  before_action :require_restaurant, only: [:create]
  before_action :require_employee, only: [:index]

  def index
    menus = Menu.for_date(Time.zone.now.to_date).as_json
    render json: { menus: menus }, status: :ok
  end

  def create
    new_menu = current_user.menus.new(user_params)
    render_resource_response(new_menu)
  end

  private

  def user_params
    params.require(:menu).permit(:meals, :date)
  end
end
