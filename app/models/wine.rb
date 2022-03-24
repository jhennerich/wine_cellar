class Wine < ApplicationRecord
  belongs_to :winecellar

  validates_presence_of :name, :varietal, :year, :wine_score
end
