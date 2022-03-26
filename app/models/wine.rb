class Wine < ApplicationRecord
  belongs_to :winecellar

  validates_presence_of :name, :varietal, :quantity, :in_stock, :year, :wine_score
  validates :in_stock, inclusion:[true, false]

  def self.number_of_wines(winecellar_id)
    Wine.where(winecellar_id: winecellar_id).count
  end
end
