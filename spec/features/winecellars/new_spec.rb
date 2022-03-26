# User Story 11, Parent Creation
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
#and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'

RSpec.describe 'the Winecellar creation' do
  it 'links to the new page from the winecellar index' do
    visit '/winecellars'
    click_link('New Winecellar')
    expect(current_path).to eq('/winecellars/new')
  end

  it 'can create a new winecellar' do
    visit '/winecellars/new'

    fill_in('Name', with: 'John' )
    click_button('Create Wine Cellar')

    new_winecellar_id = Winecellar.last.id
    expect(current_path).to eq("/winecellars/#{new_winecellar_id}")
    expect(page).to have_content('John')
  end
end
