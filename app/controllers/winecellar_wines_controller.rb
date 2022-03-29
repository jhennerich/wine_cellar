class WinecellarWinesController < ApplicationController
  def index
    @winecellar = Winecellar.find(params[:id])
    if params[:order] == 'alpha'
      @wines = @winecellar.sort_by_name
    else
      @wines = @winecellar.wines
    end
  end

  def new
    @winecellar = Winecellar.find(params[:id])
  end

  def create
    @winecellar = Winecellar.find(params[:id])
    wine = Wine.create!(wine_params)

    redirect_to "/winecellars/#{@winecellar.id}/wines"
  end

  private
    def wine_params
      {
        name: params[:name],
        varietal: params[:varietal],
        quantity: params[:quantity],
        year: params[:year].to_i,
        wine_score: params[:wine_score],
        winecellar_id: @winecellar.id
      }
#    params.permit(:name, :varietal, :quantity, :year, :wine_score, :winecellar_id)
  end

#  def show
#    @winecellar = Winecellar.find(params[:id])
#  end
end
