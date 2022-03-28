#User Story 7, Parent Child Count
#As a visitor
#When I visit a parent's show page
#I see a count of the number of children associated with this parent
require "rails_helper"
RSpec.describe 'Winecellar show page' do
  describe "user sees a winecellar of a given id" do
    describe "they visit /winecellars/id" do
      it "displays a winecellar" do
        john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

        visit ("/winecellars/#{john_1.id}")
        expect(page).to have_content(john_1.name)
      end
      it "has links to winecellar index and wine index" do
        john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

        visit ("/winecellars/#{john_1.id}")
        click_on('Wine Cellar Index')
        expect(current_path).to eq("/winecellars/")

        visit ("/winecellars/#{john_1.id}")
        click_on('Wines Index')
        expect(current_path).to eq("/wines/")
      end

      it "displays a count of the number of wines" do
      end

      it "has a link to wines in wine cellar" do
        john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
        visit ("/winecellars/#{john_1.id}")
        click_on("Wines in #{john_1.name}")
        expect(current_path).to eq("/winecellars/#{john_1.id}/wines")
      end
    end
  end
end
