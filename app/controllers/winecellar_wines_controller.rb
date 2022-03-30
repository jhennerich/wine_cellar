class WinecellarWinesController < ApplicationController
  def index

    @quantity_number = 0
    @winecellar = Winecellar.find(params[:id])
    if params[:order] == 'alpha'
      @wines = @winecellar.sort_by_name
    else
      @wines = @winecellar.wines
    end

    if params[:quantity_number] && params[:quantity_number] != ''
      @quantity_number = params[:quantity_number]
      @wines = Wine.quantity_more_than(params[:quantity_number])
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

  def show
  end

  private
    def wine_params
      {
        name: params[:name],
        varietal: params[:varietal],
        quantity: params[:quantity],
        year: params[:year].to_i,
        wine_score: params[:wine_score],
        in_stock: params[:in_stock],
        winecellar_id: @winecellar.id
      }
  end
end
