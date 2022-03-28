class WinecellarWinesController < ApplicationController
  def index
    @winecellar = Winecellar.find(params[:id])
    @wines = @winecellar.wines
  end

  def new
    @winecellar = Winecellar.find(params[:id])
  end

  def create
    @winecellar = Winecellar.find(params[:id])
    year = wine_params[:year]
    wine = Wine.create(wine_params)
    binding.pry
    redirect_to "/winecellars/#{@winecellar.id}/wines"
  end

  private
  def wine_params
    params.permit(:name, :varietal, :quantity, :year, :wine_score, :winecellar_id)
  end

#  def show
#    @winecellar = Winecellar.find(params[:id])
#  end
end
