class WinecellarWinesController < ApplicationController
  def index
    @winecellar = Winecellar.find(params[:id])
    @wines = @winecellar.wines
  end

#  def show
#    @winecellar = Winecellar.find(params[:id])
#  end
end
