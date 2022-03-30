class Winecellar < ApplicationRecord
  has_many :wines, dependent: :destroy
  validates_presence_of :name, :location, :capacity
  validates :full, inclusion:[true, false]

  def self.sorted_by_created_at
    order(created_at: :desc)
  end

  def sort_by_name
    wines.order(:name)
  end

  def self.search_for_exact(match)
    Winecellar.where(name: match)
  end
end
