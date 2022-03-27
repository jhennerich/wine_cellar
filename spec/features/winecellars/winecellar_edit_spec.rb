# User Story 12, Parent Update
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
#and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'Edit a Winecellar' do
  before :each do
  end

  it 'links to the edit page from the winecellar show page' do
    winecellar = Winecellar.create!(name: 'John test', location: 'somewhere', capacity:100)

    visit "/winecellars/#{winecellar.id}"
    click_button("Edit #{winecellar.name}")

    expect(current_path).to eq("/winecellars/#{winecellar.id}/edit")
  end

  it 'can edit a winecellar' do
    winecellar = Winecellar.create!(name: 'John test', location: 'somewhere', capacity:100)

    visit "/winecellars/#{winecellar.id}"
    expect(page).to have_content('John test')

    visit "/winecellars/#{winecellar.id}/edit"

    fill_in('Name', with: 'John updated winecellar' )
    click_button('Update Wine Cellar')

    expect(current_path).to eq("/winecellars/#{winecellar.id}")
    expect(page).to have_content('John updated winecellar')
  end
end
