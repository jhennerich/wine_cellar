require 'rails_helper'

RSpec.describe Winecellar, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    xit {should validate_presence_of(:full)}
    xit {validates :full , :inclusion => {:in => [true, false]}}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:capacity)}
  end

  describe "relationships" do
    it {should have_many :wines }
  end
  describe 'class methods' do
    xit '.sorted_by_created_at' do
    end
  end
end
