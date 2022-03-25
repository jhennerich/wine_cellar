require "rails_helper"

describe "user sees a winecellar of a given id" do
  describe "they visit /winecellars/id" do
    it "displays a winecellar" do

      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      id_to_pass = john_1.id

      visit ("/winecellars/#{id_to_pass}")

      expect(page).to have_content(john_1.name)
    end
  end
end
