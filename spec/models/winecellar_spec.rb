require 'rails_helper'

RSpec.describe Winecellar, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should allow_values(true, false).for(:full)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:capacity)}
  end

  describe "relationships" do
    it {should have_many :wines }
  end

  describe 'class methods' do
    it 'sorted_by_created_at' do
      john_1 = Winecellar.create!(name: 'John 1', full:0, location:'Basement', capacity:500)
      john_2 = Winecellar.create!(name: 'John 2', full:0, location:'Basement', capacity:500)

      expect(Winecellar.all).to eq([john_1, john_2])
      expect(Winecellar.sorted_by_created_at).to eq([john_2, john_1])
    end
  end
end
