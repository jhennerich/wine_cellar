require 'rails_helper'

RSpec.describe Wine, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:varietal)}
    it {should validate_presence_of(:quantity)}
#    it {should validate_presence_of(:in_stock)}
    it {should validate_presence_of(:year)}
    it {should validate_presence_of(:wine_score)}
  end
  describe 'class methods' do
    it '.number_of_wines' do
      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

      white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                           quantity:1, in_stock:true, year:2.years.ago, wine_score:92)

      red = john_1.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                           quantity:1, in_stock:true, year:5.years.ago, wine_score:95)

      expect(Wine.number_of_wines(john_1.id)).to eq(2)
    end
  end
end
