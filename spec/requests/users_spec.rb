require 'rails_helper'

RSpec.describe "Users", type: :request do
  fixtures :users

  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    subject (:user) { users(:user1) }
    it "returns http success" do
      get "/users/:id"
      expect(response).to have_http_status(:success)
    end
    it "@user get the right value" do
      get "/users/:id"
      expect(assigns(:user)).to eq(User.find(params[:id]))
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      post "/users/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/users/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      patch "/users/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      delete "/users/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
