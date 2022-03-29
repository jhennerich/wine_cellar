require 'rails_helper'
#User Story 5, Parent Children Index
#As a visitor
#When I visit '/parents/:parent_id/child_table_name'
#Then I see each Child that is associated with that Parent with each Child's attributes:

# User Story 16, Sort Parent's Children in Alphabetical Order by name
#
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

RSpec.describe 'Winecellar wines index' do
  before :each do

    @john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
    @deb_1 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

    @white = @john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                         quantity:1, in_stock:true, year:2020, wine_score:92)

    @red = @john_1.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                         quantity:1, in_stock:true, year:2018, wine_score:95)

    @rose = @john_1.wines.create!(name:'A nice wine', varietal:'Rose',
                         quantity:1, in_stock:true, year:2018, wine_score:95)
  end

  it 'shows all of the names of the wines for the winecellar' do
    visit "/winecellars/#{@john_1.id}/wines"

    red_2 = @deb_1.wines.create!(name:'Sirius Bordeaux', varietal:'Merlot-Cabernet',
                         quantity:1, in_stock:true, year:2012, wine_score:95)

    expect(page).to have_content(@white.name)
    expect(page).to have_content(@red.name)
    expect(page).not_to have_content(red_2.name)
  end

  it "has links to winecellar index and wine index" do
    john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

    visit ("/winecellars/#{john_1.id}/wines")
    click_on('Wine Cellar Index')
    expect(current_path).to eq("/winecellars/")

    visit ("/winecellars/#{john_1.id}/wines")
    click_on('Wines Index')
    expect(current_path).to eq("/wines/")
  end

  it 'has a link to sort wines alphabetical by name' do

    visit ("/winecellars/#{@john_1.id}/wines")
    expect(page).to have_content("Sort wines by name")
    click_on('Sort wines by name')

    expect(current_path).to eq("/winecellars/#{@john_1.id}/wines")
    expect(@rose.name).to appear_before(@red.name)
    expect(@rose.name).to appear_before(@white.name)
    expect(@white.name).to appear_before(@red.name)

  end
end
