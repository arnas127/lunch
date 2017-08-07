class HomeController < ApplicationController
  def index
    render json: { data: 'Documentation will be available later'}, status: :ok
  end
end
