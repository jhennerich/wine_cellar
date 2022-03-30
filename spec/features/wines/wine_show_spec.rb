# User Story 4, Child Show
#
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

require "rails_helper"
RSpec.describe 'wines show page' do

  describe "user sees a wine of a given id" do
    describe "they visit /wines/id" do
      it "displays a wine" do

        john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
        john_2 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
        white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                           quantity:1, in_stock:true, year:2020, wine_score:92)
        red = john_2.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                            quantity:1, in_stock:true, year:2018, wine_score:95)

        visit ("/wines/#{white.id}")

        expect(page).to have_content(white.name)
        expect(page).to_not have_content(red.name)
      end
    end

    it "has links to winecellar index and wine index" do
      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                           quantity:1, in_stock:true, year:2020, wine_score:92)

      visit ("/wines/#{white.id}")
      click_on('Wine Cellar Index')
      expect(current_path).to eq("/winecellars/")

      visit ("/wines/#{white.id}")
      click_on('Wines Index')
      expect(current_path).to eq("/wines/")
    end
  end
end
