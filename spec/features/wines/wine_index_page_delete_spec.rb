# User Story 23, Child Delete From Childs Index Page
#
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to delete that child
# When I click the link
# I should be taken to the `child_table_name` index page where I no longer see that child

require 'rails_helper'

RSpec.describe "user deletes a wine from the index page" do
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

  it "displays all wines without the deleted entry" do


    visit "/wines"

    expect(page).to have_content(@white.name)
    expect(page).to have_content(@red.name)
    expect(page).to have_content(@rose.name)

    click_link "Delete Wine #{@white.name}"

    expect(current_path).to eq('/wines')
    expect(page).to have_content(@red.name)
    expect(page).to_not have_content(@white.name)
    expect(page).to have_content("Wine Deleted!")
  end
end
