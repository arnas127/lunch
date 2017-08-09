require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create' do
    let!(:user) { create :user }

    before { post :create, params: user_params, format: 'json' }

    context 'correct credentials' do
      let!(:user_params) { { user: { email: user.email, password: 'testpass' } } }

      it 'responds with success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns token' do
        user.reload
        expect(response.body).to eq("{\"token\":\"#{user.token}\"}")
      end
    end

    context 'incorect correct credentials' do
      let!(:user_params) { { user: { email: user.email, password: 'no_pass' } } }

      it 'responds with unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns error message' do
        expect(response.body).to eq("{\"errors\":[{\"message\":\"Incorrect login credentials\"}]}")
      end
    end
  end

  describe '#logout' do
    let!(:user) { create :user, token: 'my_token' }

    before do
      request.headers['Authorization'] = "Token token=my_token"
      delete :destroy, format: 'json'
    end

    it 'responds with success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns no content' do
      expect(response.body).to be_empty
    end
  end
end
