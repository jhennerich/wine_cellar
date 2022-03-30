class WinesController < ApplicationController
  def index
    @wines = Wine.is_in_stock
    @wines_all = Wine.all

    if params[:search_for_exact] && params[:search_for_exact] != ""
      @wines = Wine.search_for_exact_wine(params[:search_for_exact])
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    wine = Wine.find(params[:id])
    wine.update!(wine_params)
    redirect_to "/wines/#{wine.id}"
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    flash.notice = "Wine Deleted!"
    redirect_to "/wines"
  end

  def wine_params
    params.permit(:name,
                  :varietal,
                  :quantity,
                  :year,
                  :wine_score,
                  :in_stock,
                 )
  end
end
