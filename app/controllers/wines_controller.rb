class WinesController < ApplicationController
  def index
    @wines = Wine.all
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def new
    if params[:winecellar_id]
      @winecellar = Winecellar.find(params[:winecellar_id])
    end
  end

  def create
    #binding.pry
    #winecellar = Winecellar.find(params[:id])
    wine = Wine.create(wine_params)
    redirect_to "/winescellars/wine"
  end

  def wine_params
    params.permit(:name, :varietal, :quantity, :year, :wine_score )
  end
end
