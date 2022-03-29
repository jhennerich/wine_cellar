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

#  def last_updated
#    update_at.strftime("%Y-%m-%d")
#  end
  


#  def self.easy_read_date_created_at
#    created_at.strftime("%B, %d, %Y")
#  end

#  def self.easy_read_date_updated_at
#    updated_at.strftime("%B, %d, %Y")
#  end
end
