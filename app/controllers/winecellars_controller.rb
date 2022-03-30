class WinecellarsController < ApplicationController
  def index
    @winecellars = Winecellar.sorted_by_created_at
    if params[:search_for_exact] && params[:search_for_exact] != ""
      @winecellars = Winecellar.search_for_exact(params[:search_for_exact])
    end
  end

  def show
    @winecellar = Winecellar.find(params[:id])
    @winecount = Wine.number_of_wines(params[:id])
  end

  def create
    winecellar = Winecellar.create(winecellar_params)
    redirect_to "/winecellars"
  end

  def new
  end

  def edit
    @winecellar = Winecellar.find(params[:id])
  end

  def update
    winecellar = Winecellar.find(params[:id])
    winecellar.update!(winecellar_params)
    redirect_to "/winecellars/#{winecellar.id}"
  end

  def destroy
    @winecellar = Winecellar.find(params[:id])
    @winecellar.destroy
    flash.notice = "Wine Cellar Deleted!"
    redirect_to "/winecellars"
  end

  private
  def winecellar_params
    params.permit(:name, :location, :capacity, :full)
  end

end
