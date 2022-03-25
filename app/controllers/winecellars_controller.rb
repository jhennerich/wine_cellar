class WinecellarsController < ApplicationController
  def index
    @winecellars = Winecellar.all
  end
end
