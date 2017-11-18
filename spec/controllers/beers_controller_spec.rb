require 'rails_helper'

RSpec.describe BeersController, type: :controller do
  let(:brewery) { create :brewery }
  let(:subcategory) { create :subcategory }

  let(:valid_attributes) { { name: 'Nebuchadnezzar', brewery_id: brewery.id, subcategory_id: subcategory.id } }

  let(:invalid_attributes) { { name: '' } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Beer.create! valid_attributes
      get :index, params: { brewery_id: brewery.id }, session: valid_session, format: :json
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      beer = Beer.create! valid_attributes
      get :show, params: { brewery_id: brewery.id, id: beer.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { brewery_id: brewery.id }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      beer = Beer.create! valid_attributes
      get :edit, params: { brewery_id: brewery.id, id: beer.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Beer" do
        expect {
          post :create, params: { brewery_id: brewery.id, beer: valid_attributes }, session: valid_session
        }.to change(Beer, :count).by(1)
      end

      it "redirects to the brewery" do
        post :create, params: { brewery_id: brewery.id, beer: valid_attributes }, session: valid_session
        expect(response).to redirect_to(brewery)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { brewery_id: brewery.id, beer: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: 'Fatamorgana' } }

      it "updates the requested beer" do
        beer = Beer.create! valid_attributes
        put :update, params: { brewery_id: brewery.to_param, id: beer.to_param, beer: new_attributes },
                     session: valid_session
        beer.reload
        expect(beer.name).to eq 'Fatamorgana'
      end

      it "redirects to the brewery" do
        beer = Beer.create! valid_attributes
        put :update, params: { brewery_id: brewery.to_param, id: beer.to_param, beer: valid_attributes },
                     session: valid_session
        expect(response).to redirect_to(brewery)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        beer = Beer.create! valid_attributes
        put :update, params: { brewery_id: brewery.to_param, id: beer.to_param, beer: invalid_attributes},
                     session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested beer" do
      beer = Beer.create! valid_attributes
      expect {
        delete :destroy, params: { brewery_id: brewery.to_param, id: beer.to_param }, session: valid_session
      }.to change(Beer, :count).by(-1)
    end

    it "redirects to the brewery" do
      beer = Beer.create! valid_attributes
      delete :destroy, params: { brewery_id: brewery.to_param, id: beer.to_param }, session: valid_session
      expect(response).to redirect_to(brewery)
    end
  end
end
