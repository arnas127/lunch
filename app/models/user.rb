class User < ApplicationRecord
  has_secure_password
  has_secure_token

  # adding account_type to prevent The single-table inheritance mechanism failure before validation
  attr_accessor :account_type

  before_create :assign_type

  TYPES = %w(Admin Restaurant Employee)

  validates :account_type, inclusion: { in: TYPES, message: 'is not a valid type' }, on: :create, if: -> { type.blank? }
  validates :password, length: { minimum: 8 }, on: :create
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true

  TYPES.each do |user_type|
    define_method("#{user_type.downcase}?") do
      self.type == user_type
    end
  end

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

  private

  def assign_type
    self.type ||= account_type
  end
end
