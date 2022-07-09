require 'rails_helper'

RSpec.describe "DetailOrders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/detail_orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /show" do
  #   it "returns http success" do
  #     get "/detail_orders/show"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/detail_orders/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/detail_orders/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/detail_orders/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /get_ord" do
  #   it "returns http success" do
  #     get "/detail_orders/get_ord"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /set_detail" do
  #   it "returns http success" do
  #     get "/detail_orders/set_detail"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
