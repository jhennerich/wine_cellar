class Winecellar < ApplicationRecord
  has_many :wines

  validates_presence_of :name, :location, :capacity
end
