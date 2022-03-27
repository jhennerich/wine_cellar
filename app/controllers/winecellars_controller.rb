class WinecellarsController < ApplicationController
  def index
    @winecellars = Winecellar.sorted_by_created_at
  end

  def show
    ### temperary fix for when id = new
#    if params[:id] == "new"
#      @winecellar = Winecellar.find(Winecellar.last.id)
#    else
      @winecellar = Winecellar.find(params[:id])
#    end
    @winecount = Wine.number_of_wines(params[:id])
  end

  def create
    winecellar = Winecellar.create(winecellar_params)
    redirect_to "/winecellars/#{winecellar.id}"
  end

  def winecellar_params
    params.permit(:name, :location, :capacity)
  end

  def new
  end

end
