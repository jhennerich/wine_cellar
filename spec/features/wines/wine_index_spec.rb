# User Story 3, Child Index
#
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

#User Story 8, Child Index Link

#As a visitor
#When I visit any page on the site
#Then I see a link at the top of the page that takes me to the Child Index

# User Story 15, Child Index only shows `true` Records
#
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`
#
# User Story 18, Child Update From Childs Index Page
#
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11

require "rails_helper"

describe "user sees all wines" do
  before :each do
    @john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
    @john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

    @white = @john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                         quantity:1, in_stock:true, year:2020, wine_score:92)

    @red = @john_2.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                         quantity:1, in_stock:true, year:2018, wine_score:95)

  end
    it "displays all wines" do

      visit '/wines'

      expect(page).to have_content(@white.name)
      expect(page).to have_content(@red.name)
    end
    
    it "has links to winecellar index and wine index" do

      visit ("/wines/")
      click_on('Wine Cellar Index')
      expect(current_path).to eq("/winecellars/")

      visit ("/wines")
      click_on('Wines Index')
      expect(current_path).to eq("/wines/")
    end

    it "has link to edit wine " do
      visit ("/wines")
      click_link("Edit #{@white.name} Attributes")
      expect(current_path).to eq("/wines/#{@white.id}/edit")

    end

  describe "user sees only wines in stock" do
    it "displays wines in stock" do

      white = @john_1.wines.create!(name:'A test wine 1', varietal:'Sauvignon Blanc',
                         quantity:1, in_stock:true, year:2020, wine_score:92)

      red = @john_1.wines.create!(name:'A test wine 2', varietal:'Pinot Noir',
                           quantity:0, in_stock:false, year:2018, wine_score:95)

      visit '/wines'
      expect(page).to have_content(white.name)
      expect(page).to have_no_content(red.name)

    end
  end
end
