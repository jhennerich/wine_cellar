require 'rails_helper'
#User Story 5, Parent Children Index
#As a visitor
#When I visit '/parents/:parent_id/child_table_name'
#Then I see each Child that is associated with that Parent with each Child's attributes:

RSpec.describe 'Winecellar wines index' do
  before :each do

    @john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
    @deb_1 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

    @white = @john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                         in_stock:true, year:2.years.ago, wine_score:92)

    @red = @john_1.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                         in_stock:true, year:5.years.ago, wine_score:95)
  end

  it 'shows all of the names of the wines for the winecellar' do
    visit "/winecellars/#{@john_1.id}/wines"

    red_2 = @deb_1.wines.create!(name:'Sirius Bordeaux', varietal:'Merlot-Cabernet',
                         quantity:1, in_stock:true, year:10.years.ago, wine_score:95)

    expect(page).to have_content(@white.name)
    expect(page).to have_content(@red.name)
    expect(page).not_to have_content(red_2.name)
  end

  xit 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  xit 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 755")
  end
end
