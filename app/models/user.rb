class User < ApplicationRecord
  has_secure_password
  has_secure_token

  def destroy_token
    self.update_columns(token: nil)
  end

  def self.login(params)
    user = find_by_email(params[:email])
    if user&.authenticate(params[:password])
      user
    else
      false
    end
  end

end
