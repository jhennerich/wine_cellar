class WinesController < ApplicationController
  def index
    @wines = Wine.is_in_stock
    @wines_all = Wine.all
  end

  def show
    @wine = Wine.find(params[:id])
  end

  

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    wine = Wine.find(params[:id])
    wine.update(wine_params)
    redirect_to "/wines/#{wine.id}"

  end

  def wine_params
    params.permit(:name, :varietal, :quantity, :year, :wine_score, :winecllar_id )
  end
end
