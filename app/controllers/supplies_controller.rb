class SuppliesController < ApplicationController
  before_action :set_beer
  before_action :set_supply, only: %i(show edit update destroy)

  # GET /supplies
  # GET /supplies.json
  def index
    @supplies = @beer.supplies.all
  end

  # GET /supplies/1
  # GET /supplies/1.json
  def show
  end

  # GET /supplies/new
  def new
    @supply = @beer.supplies.new
  end

  # GET /supplies/1/edit
  def edit
  end

  # POST /supplies
  # POST /supplies.json
  def create
    @supply = @beer.supplies.new(supply_params)

    respond_to do |format|
      if @supply.save
        format.html { redirect_to [@beer.brewery, @beer], notice: 'Supply was successfully created.' }
        format.json { render :show, status: :created, location: @supply }
      else
        format.html { render :new }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplies/1
  # PATCH/PUT /supplies/1.json
  def update
    respond_to do |format|
      if @supply.update(supply_params)
        format.html { redirect_to [@beer.brewery, @beer], notice: 'Supply was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply }
      else
        format.html { render :edit }
        format.json { render json: @supply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.json
  def destroy
    @supply.destroy
    respond_to do |format|
      format.html { redirect_to [@beer.brewery, @beer], notice: 'Supply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_beer
    @beer = Beer.find(params[:beer_id])
  end

  def set_supply
    @supply = @beer.supplies.find(params[:id])
  end

  def supply_params
    params.require(:supply).permit(:supplier_id, :price)
  end
end
