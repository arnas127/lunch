require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(User.new(name: 'user', email: 'user@test.com', password: 'testpass', account_type: 'Admin')).to be_valid
    end

    it 'is not valid without email' do
      expect(User.new(name: 'user', password: 'testpass', account_type: 'Admin')).not_to be_valid
    end

    it 'is not valid with incorrect email' do
      expect(User.new(name: 'user', email: 'usertest.com', password: 'testpass', account_type: 'Unknown')).not_to be_valid
    end

    it 'is not valid without password' do
      expect(User.new(name: 'user', email: 'user@test.com', account_type: 'Admin')).not_to be_valid
    end

    it 'is not valid with too short password' do
      expect(User.new(name: 'user', email: 'user@test.com', password: 'pass', account_type: 'Unknown')).not_to be_valid
    end

    it 'is not valid without type' do
      expect(User.new(name: 'user', email: 'user@test.com', password: 'testpass')).not_to be_valid
    end

    it 'is not valid with incorrect type' do
      expect(User.new(name: 'user', email: 'user@test.com', password: 'testpass', account_type: 'Unknown')).not_to be_valid
    end
  end

  context 'methods' do
    let(:user) { create :user }
    let(:user_with_token) { create :user, token: 'test' }

    it 'returns true for correct type' do
      expect(user.employee?).to be_truthy
    end

    it 'returns false for other type' do
      expect(user.admin?).to be_falsey
    end

    it 'logins correctly' do
      expect(User.login(email: user.email, password: 'testpass').id).to eq(user.id)
    end

    it 'clears token' do
      user_with_token.destroy_token
      user_with_token.reload
      expect(user_with_token.token).to be_nil
    end
  end
end
