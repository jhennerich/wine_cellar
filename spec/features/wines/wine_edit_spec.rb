# User Story 14, Child Update
#
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
# # User Story 12, Parent Update
# #
# # As a visitor
# # When I visit a parent show page
# # Then I see a link to update the parent "Update Parent"
# # When I click the link "Update Parent"
# # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
require 'rails_helper'

RSpec.describe 'Edit a Wine' do
  before :each do
  end

  it 'links to the edit page from the wine show page' do
    winecellar = Winecellar.create!(name: 'John test', location: 'somewhere', capacity:100)
    wine = winecellar.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                         quantity:2, in_stock:true, year:2020, wine_score:95)

    visit "/wines/#{wine.id}"
    click_button("Edit #{wine.name}")

    expect(current_path).to eq("/wines/#{wine.id}/edit")
  end

  it 'can edit a wine' do
    winecellar = Winecellar.create!(name: 'John test', location: 'somewhere', capacity:100)
    wine = winecellar.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                         quantity:2, in_stock:true, year:2020, wine_score:95)

    #visit "/winecellars/#{winecellar.id}"
    #expect(page).to have_content('John test')
    #click_button('Update Wine Cellar')

    visit "/wines/#{wine.id}/edit"

    fill_in('Name', with: 'TEST' )
    fill_in('Varietal', with: 'TEST' )
    fill_in('Quantity', with: '1' )
#    fill_in('Year', with: '2022' )
    fill_in('wine_score', with: '90' )
    click_button('Update Wine')

    #binding.pry
    expect(current_path).to eq("/wines/#{wine.id}")
    expect(page).to have_content("TEST" )
  end
end
