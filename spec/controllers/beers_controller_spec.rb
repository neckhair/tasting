require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  let(:brewery) { create :brewery }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      create :beer, brewery: brewery
      get :index, params: { brewery_id: brewery.id }, session: valid_session
      expect(response).to be_success
    end
  end
end
