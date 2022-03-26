class Wine < ApplicationRecord
  belongs_to :winecellar

  validates_presence_of :name, :varietal, :year, :wine_score

  def self.number_of_wines(winecellar_id)
    Wine.where(winecellar_id: winecellar_id).count
  end
end
