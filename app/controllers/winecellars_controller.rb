class WinecellarsController < ApplicationController
  def index
    @winecellars = Winecellar.sorted_by_created_at
  end

  def show
    @winecellar = Winecellar.find(params[:id])
    @winecount = Wine.number_of_wines(params[:id])
  end
end
