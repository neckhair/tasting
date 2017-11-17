require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      Category.create bjcp_number: 1, name: 'Standard American Beer'
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
