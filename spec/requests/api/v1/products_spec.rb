require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do

  describe "GET /index" do

    before do
      create(:product, name:"produto teste_1", price: 2.50, description: "descrição de produto")
      create(:product, name:"produto teste_2", price: 3.50, description: "descrição de produto")
      get "/api/v1/products/index"
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
    let(:produto) {create(:product)}

    context "when product exists" do
      before { get "/api/v1/products/show/#{produto.id}" }

      it { expect(response).to have_http_status(:ok) }

      it "returns with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

    end
  end

  describe "POST /create" do

    let(:params) do {
      name: "teste",
      price: 2.50,
      description: "descrição",
    }
    end
  
    before do 
      post "/api/v1/products/create", params: {product: params}
    end

    it "returns a sucess response" do
      expect(response).to have_http_status(:created)
    end

    it "creates the product" do
      new_product = Product.find_by(name: "teste")
      expect(new_product).not_to be_nil
    end

  end

  describe "DELETE /delete" do
    let(:produto) {create(:product)}

    context "when the product exists" do

      before do
        delete "/api/v1/products/delete/#{produto.id}"
      end

      it { expect(response).to have_http_status(:ok) }

      it "deletes the product" do
        deleted_product = Product.find_by(name: "teste")
        expect(deleted_product).to be_nil
      end
    end

    context "when the product does not exists" do

      before do
        produto.destroy
        delete "/api/v1/products/delete/#{produto.id}"
      end
  
      it { expect(response).to have_http_status(:bad_request) }
      
    end
  end

  describe "PUT /update" do

    let(:produto) {create(:product)}

    context "when product exists" do
      before do
        patch "/api/v1/products/update/#{produto.id}", params: { product: {name:"teste atualizado"}}
      end

      it "responses with an ok status" do
        expect(response).to have_http_status(:ok)
      end

      it "expect name to be updated" do
        updated_product = Product.find_by(id: produto.id)
        expect(updated_product.name).to eq("teste atualizado")
      end
    end
  end


end

