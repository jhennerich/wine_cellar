class Winecellar < ApplicationRecord
  validates_presence_of :name, :full, :location, :capacity
end
