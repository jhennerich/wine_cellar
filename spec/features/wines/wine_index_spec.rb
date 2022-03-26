#User Story 8, Child Index Link

#As a visitor
#When I visit any page on the site
#Then I see a link at the top of the page that takes me to the Child Index
require "rails_helper"

describe "user sees all wines" do
  describe "they visit /wines" do
    it "displays all wines" do

      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

      white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                           in_stock:true, year:2.years.ago, wine_score:92)

      red = john_2.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                           in_stock:true, year:5.years.ago, wine_score:95)

      visit '/wines'

      expect(page).to have_content(white.name)
      expect(page).to have_content(red.name)
    end
    it 'has a link to Wines index shown at top of page' do
#      page.has_link?(locator = nil, **options, &optional_filter_block) is true
    end
  end
end
