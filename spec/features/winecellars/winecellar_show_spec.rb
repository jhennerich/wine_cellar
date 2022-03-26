#User Story 7, Parent Child Count
#As a visitor
#When I visit a parent's show page
#I see a count of the number of children associated with this parent
require "rails_helper"

describe "user sees a winecellar of a given id" do
  describe "they visit /winecellars/id" do
    it "displays a winecellar" do

      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

      visit ("/winecellars/#{john_1.id}")

      expect(page).to have_content(john_1.name)
    end
    it "displays a count of the number of wines" do
    end
  end
end
