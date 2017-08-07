class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :require_login

  private

  def require_login
    current_user || render_unauthorized('Access denied')
  end

  def current_user
    @current_user ||= authenticate_token
  end

  User::TYPES.each do |user_type|
    user_type_downcase = user_type.downcase
    define_method("require_#{user_type_downcase}") do
      unless current_user&.public_send("#{user_type_downcase}?".to_sym)
        render_unauthorized("Access denied. Required '#{user_type}' type user.")
      end
    end
  end

  def render_unauthorized(message)
    render json: { errors: [ { message: message } ] },
      status: :unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end
end
