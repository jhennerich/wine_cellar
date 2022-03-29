# User Story 21, Display Records Over a Given Threshold
#
# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.

require "rails_helper"
RSpec.describe "Return wines with more than one quantity" do
  before :each do

    @john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
    @deb_1 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

    @white = @john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                         quantity:3, in_stock:true, year:2020, wine_score:92)

    @red = @john_1.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                         quantity:2, in_stock:true, year:2018, wine_score:95)

    @rose = @john_1.wines.create!(name:'A nice wine', varietal:'Rose',
                         quantity:1, in_stock:true, year:2018, wine_score:95)
  end

  it "has a form and submit button named Only return wines with more than 'number' of 'quantity'" do

    visit("/winecellars/#{@john_1.id}/wines")

      expect(page).to have_content(@white.name)
      expect(page).to have_content(@red.name)
      expect(page).to have_content(@rose.name)

      expect(page).to have_content("Quantity to select:")
      fill_in('quantity_number', with: 0)
      click_button('Only return wines with more than 0 quantity')

      expect(page).to have_content(@white.name)
      expect(page).to have_content(@red.name)
      expect(page).to have_content(@rose.name)

      fill_in('quantity_number', with: 1)
      click_button('Only return wines with more than 0 quantity')

      expect(page).to have_content(@white.name)
      expect(page).to have_content(@red.name)

      fill_in('quantity_number', with: 1)
      click_button('Only return wines with more than 1 quantity')

      expect(page).to have_content(@white.name)

  end
end
