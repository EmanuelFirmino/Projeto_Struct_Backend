require 'rails_helper'

RSpec.describe "Api::V1::Relations", type: :request do
  describe "GET /index" do

    before do
      create(:product, name:"produto teste_1", price: 2.50, description: "descrição de produto")
      create(:category, name:"categoria teste_1")
      create(:relation, product_id: 1, category_id: 1)
      get "/api/v1/relations/index"
    end

    it{expect(response).to have_http_status(:ok)}

    it "return with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")

    end


  end
end
