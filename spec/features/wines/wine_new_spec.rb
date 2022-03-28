# User Story 13, Parent Child Creation
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'Wine creation' do
  it 'links to the new page from the wine index' do
    john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
    visit "/winecellars/#{john_1.id}/wines"
    click_button('Create Wine')
    expect(current_path).to eq("/winecellars/#{john_1.id}/wines/new")
  end

  it 'can create a new wine' do
    john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
    visit "/winecellars/#{john_1.id}/wines"

    click_button('Create Wine')

    fill_in('Name', with: 'John wine')
    fill_in('Varietal', with: 'Rose')
    fill_in('Quantity', with: 1)
    fill_in('Year', with: 2022)
    fill_in('wine_score', with: 90)
    click_button('Create Wine')

    expect(current_path).to eq("/winecellars/#{john_1.id}/wines")
    expect(page).to have_content('John wine')
  end
end
