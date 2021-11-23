require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do

  describe "GET /index" do
    before do
      create(:category, name:"categoria teste_1")
      create(:category, name:"categoria teste_2")
      get "/api/v1/categories/index"
    end

    it{expect(response).to have_http_status(:ok)}

    it "return with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")

    end

    it "returns two elements" do
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET /show" do
    let(:categoria) {create(:category)}

    context "when category exists" do
      before { get "/api/v1/categories/show/#{categoria.id}" }

      it { expect(response).to have_http_status(:ok) }

      it "returns with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

    end
  end

  describe "POST /create" do

    let(:params) do {
      name: "categoria teste"
    }
    end
  
    before do 
      post "/api/v1/categories/create", params: {category: params}
    end

    it "returns a sucess response" do
      expect(response).to have_http_status(:created)
    end

    it "creates the category" do
      new_category = Category.find_by(name: "categoria teste")
      expect(new_category).not_to be_nil
    end
  end

  describe "DELETE /delete" do
    let(:categoria) {create(:category)}

    context "when the category exists" do

      before do
        delete "/api/v1/categories/delete/#{categoria.id}"
      end

      it { expect(response).to have_http_status(:ok) }

      it "deletes the category" do
        deleted_category = Category.find_by(name: "categoria teste")
        expect(deleted_category).to be_nil
      end
    end

    context "when the category does not exists" do

      before do
        categoria.destroy
        delete "/api/v1/categories/delete/#{categoria.id}"
      end
  
      it { expect(response).to have_http_status(:bad_request) }
      
    end
  end

end
