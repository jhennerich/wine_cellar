class Wine < ApplicationRecord
  belongs_to :winecellar

  validates_presence_of :name, :varietal, :in_stock, :year, :wine_score
end
