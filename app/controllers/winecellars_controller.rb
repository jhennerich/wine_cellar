class WinecellarsController < ApplicationController
  def index
    @winecellars = Winecellar.sorted_by_created_at
  end

  def show
    @winecellar = Winecellar.find(params[:id])
  end
end
