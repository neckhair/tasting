class BeersController < ApplicationController
  def index
    @beers = Beer.includes(:brewery).order(:name)
  end
end
