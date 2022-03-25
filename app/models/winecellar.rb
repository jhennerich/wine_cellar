class Winecellar < ApplicationRecord
  has_many :wines

  validates_presence_of :name, :location, :capacity

  def self.sorted_by_created_at
    order(created_at: :desc)
#    Winecellar.order(create_at: :desc)
  end
end
