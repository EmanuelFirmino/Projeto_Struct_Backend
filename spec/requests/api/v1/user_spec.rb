require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
    before do
      create(:user, name:"weng", email:"weng@weng", password:"113567")
      get "api/v1/user/index"
    end

    it{expect(response).to have_http_status(200)}
  end
end
