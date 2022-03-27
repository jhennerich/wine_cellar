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
    visit '/wines'
    click_link('Create Wine')
    expect(current_path).to eq('/wines/new')
  end

  it 'can create a new winecellar' do
    visit '/wines/new'

    fill_in('Name', with: 'John wine')
    fill_in('Varietal', with: 'Rose')
    fill_in('Quantity', with: 1)
    fill_in('Year', with: Date.today.year)
    fill_in('Wine Score', with: 90)
    click_button('Create Wine Cellar')

    expect(current_path).to eq("/wines")
    expect(page).to have_content('John wine')
  end
end
