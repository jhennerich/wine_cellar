class WinecellarWinesController < ApplicationController
  def index
#    binding.pry
    @wines = Wine.all
  end

#  def show
#    @winecellar = Winecellar.find(params[:id])
#  end
end
