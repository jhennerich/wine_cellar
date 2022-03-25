class WinecellarsController < ApplicationController
  def index
    @winecellars = Winecellar.all
  end

  def show
    @winecellar = Winecellar.find(params[:id])
  end
end
