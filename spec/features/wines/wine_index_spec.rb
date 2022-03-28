#User Story 8, Child Index Link

#As a visitor
#When I visit any page on the site
#Then I see a link at the top of the page that takes me to the Child Index

# User Story 15, Child Index only shows `true` Records
#
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`

require "rails_helper"

describe "user sees all wines" do
    it "displays all wines" do

      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

      white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                           quantity:1, in_stock:true, year:2.years.ago, wine_score:92)

      red = john_2.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                           quantity:1, in_stock:true, year:5.years.ago, wine_score:95)

      visit '/wines'

      expect(page).to have_content(white.name)
      expect(page).to have_content(red.name)
    end
    it "has links to winecellar index and wine index" do
      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

      visit ("/wines/")
      click_on('Wine Cellar Index')
      expect(current_path).to eq("/winecellars/")

      visit ("/wines")
      click_on('Wines Index')
      expect(current_path).to eq("/wines/")
    end

  describe "user sees only wines in stock" do
    it "displays wines in stock" do

      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                         quantity:1, in_stock:true, year:2.years.ago, wine_score:92)

      red = john_1.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                           quantity:0, in_stock:false, year:5.years.ago, wine_score:95)

      visit '/wines'
      expect(page).to have_content(white.name)
      expect(page).to have_no_content(red.name)

    end
  end
end
