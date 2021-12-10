require 'rails_helper'

RSpec.describe "Api::V1::User", type: :request do
  describe "GET /index" do

    before do
      create(:user, name:"weng", email:"weng@wenggrab", password:"123456")
      get "/api/v1/user/index"
    end

    it{expect(response).to have_http_status(200)}

    it "return with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")

    end
  end

  describe "POST /create" do

    let(:params) do {
      name: "lindinho",
      email: "tecladinho@lindinho",
      password: "123456",
    }
    end
  
    before do 
      post "/api/v1/user/create", params: {user: params}
    end

    it "returns a sucess response" do
      expect(response).to have_http_status(:created)
    end

    it "creates the user" do
      new_user = User.find_by(email: "tecladinho@lindinho")
      expect(new_user).not_to be_nil
    end

  end

  describe "DELETE /delete" do
    let(:usuario) {create(:user)}

    context "when the user exists" do

      before do
        delete "/api/v1/user/delete/#{usuario.id}"
      end

      it { expect(response).to have_http_status(:ok) }

      it "deletes the user" do
        deleted_user = User.find_by(email: "tecladinho@lindinho")
        expect(deleted_user).to be_nil
      end
    end

    context "when the user does not exists" do

      before do
        usuario.destroy
        delete "/api/v1/user/delete/#{usuario.id}"
      end
  
      it { expect(response).to have_http_status(:bad_request) }
      
    end
  end

  
end
