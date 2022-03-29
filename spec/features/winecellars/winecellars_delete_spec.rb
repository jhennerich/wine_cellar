# User Story 19, Parent Delete
#
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpesc.describe "user deletes a winecellar" do
  describe "they link from the show page" do
    it "displays all winecellars without the deleted entry" do
      john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
      john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)
      john_3 = Winecellar.create!(name: 'Homemade', full:0, location:'Basement', capacity:100)

    #  visit '/winecellars'
      visit article_path(john_1)

      expect(page).to have_content(john_1.name)
      expect(page).to have_content(john_2.name)
      expect(page).to have_content(john_3.name)

      click_link "Delete Wine Cellar #{john_1.name}"

      expect(current_path).to eq(winecellars_path)
      expect(page).to have_content(john_2.name)
      expect(page).to_not have_content(john_1.name)
      expect(page).to have_content("Wine Cellar Deleted!")
      
    end
  end
end
