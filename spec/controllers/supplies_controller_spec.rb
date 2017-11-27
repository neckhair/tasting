require 'rails_helper'

RSpec.describe SuppliesController, type: :controller do
  let(:beer) { create :beer }
  let(:supplier) { create :supplier }

  let(:valid_attributes) { { supplier_id: supplier.to_param, price: 340 } }
  let(:invalid_attributes) { { supplier_id: nil } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      supply = create :supply
      get :index, params: { beer_id: supply.beer.id, format: :json }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      supply = create :supply
      get :show, params: { beer_id: supply.beer.id, id: supply.to_param, format: :json }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { beer_id: beer.id }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      supply = create :supply
      get :edit, params: { beer_id: supply.beer.id, id: supply.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Supply" do
        expect {
          post :create, params: { beer_id: beer.id, supply: valid_attributes }, session: valid_session
        }.to change(Supply, :count).by(1)
      end

      it "redirects to the created supply" do
        post :create, params: { beer_id: beer.id, supply: valid_attributes }, session: valid_session
        expect(response).to redirect_to([beer.brewery, beer])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { beer_id: beer.id, supply: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { price: 8.50 } }

      it "updates the requested supply" do
        supply = create :supply
        put :update, params: {
          beer_id: supply.beer_id, id: supply.to_param, supply: new_attributes
        }, session: valid_session
        supply.reload
        expect(supply.price).to eq Money.new(850)
      end

      it "redirects to the supply" do
        supply = create :supply, beer: beer
        put :update, params: {
          beer_id: supply.beer_id, id: supply.to_param, supply: valid_attributes
        }, session: valid_session
        expect(response).to redirect_to([beer.brewery, beer])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        supply = create :supply, beer: beer
        put :update, params: {
          beer_id: beer.id, id: supply.to_param, supply: invalid_attributes
        }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested supply" do
      supply = create :supply, beer: beer
      expect {
        delete :destroy, params: { beer_id: beer.id, id: supply.to_param }, session: valid_session
      }.to change(Supply, :count).by(-1)
    end

    it "redirects to the supplies list" do
      supply = create :supply, beer: beer
      delete :destroy, params: { beer_id: beer.id, id: supply.to_param }, session: valid_session
      expect(response).to redirect_to([beer.brewery, beer])
    end
  end
end
