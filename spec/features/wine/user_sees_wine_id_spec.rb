require "rails_helper"

describe "user sees a wine of a given id" do
  describe "they visit /wines/id" do
    it "displays a wine" do

      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                           in_stock:true, year:2.years.ago, wine_score:92)

      visit ("/wines/#{white.id}")

      expect(page).to have_content(white.name)
    end
  end
end
