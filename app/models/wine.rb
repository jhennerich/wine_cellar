class Wine < ApplicationRecord
  belongs_to :winecellar

  validates_presence_of :name, :varietal, :quantity, :year, :wine_score
#  validates :in_stock, inclusion:[true, false]

  def in_stock
    if quantity > 0
      true
    else
      false
    end
  end

  def self.is_in_stock
    Wine.where("in_stock = true")
  end

  def self.number_of_wines(winecellar_id)
    Wine.where(winecellar_id: winecellar_id).count
  end
end
