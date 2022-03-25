require "rails_helper"

describe "user sees all winecellars" do
  describe "they visit /winecellars" do
    it "displays all winecellars" do

      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

      visit '/winecellars'

      expect(page).to have_content(john_1.name)
      expect(page).to have_content(john_2.name)

    end
  end
end
