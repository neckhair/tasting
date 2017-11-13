require 'rails_helper'

RSpec.describe BreweriesController, type: :controller do
  let(:valid_attributes) { { name: 'Doppelleu' } }

  let(:invalid_attributes) { { name: '' } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      brewery = Brewery.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      brewery = Brewery.create! valid_attributes
      get :show, params: { id: brewery.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      brewery = Brewery.create! valid_attributes
      get :edit, params: { id: brewery.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Brewery" do
        expect {
          post :create, params: { brewery: valid_attributes }, session: valid_session
        }.to change(Brewery, :count).by(1)
      end

      it "redirects to the created brewery" do
        post :create, params: { brewery: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Brewery.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { brewery: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: 'Haarige Kuh' } }

      it "updates the requested brewery" do
        brewery = Brewery.create! valid_attributes
        put :update, params: { id: brewery.to_param, brewery: new_attributes }, session: valid_session
        brewery.reload
        expect(brewery.name).to eq 'Haarige Kuh'
      end

      it "redirects to the brewery" do
        brewery = Brewery.create! valid_attributes
        put :update, params: { id: brewery.to_param, brewery: valid_attributes }, session: valid_session
        expect(response).to redirect_to(brewery)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        brewery = Brewery.create! valid_attributes
        put :update, params: { id: brewery.to_param, brewery: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested brewery" do
      brewery = Brewery.create! valid_attributes
      expect {
        delete :destroy, params: { id: brewery.to_param }, session: valid_session
      }.to change(Brewery, :count).by(-1)
    end

    it "redirects to the breweries list" do
      brewery = Brewery.create! valid_attributes
      delete :destroy, params: { id: brewery.to_param }, session: valid_session
      expect(response).to redirect_to(breweries_url)
    end
  end
end
