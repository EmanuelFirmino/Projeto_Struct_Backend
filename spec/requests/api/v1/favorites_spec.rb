require 'rails_helper'

RSpec.describe "Api::V1::Favorites", type: :request do
  describe "GET /index" do

    before do
      create(:user, email:"teste@teste", password:"123456", name:"teste", is_admin:false)
      create(:product, name:"produto teste_1", price: 2.50, description: "descrição de produto")
      create(:favorite, product_id: 1, user_id: 1)
      
      get "/api/v1/favorites/index"
    end

    it{expect(response).to have_http_status(:ok)}

    it "return with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")

    end

  end
end
