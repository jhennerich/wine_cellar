# User Story 1, Parent Index
#For each parent table
#As a visitor
#When I visit '/parents'
#Then I see the name of each parent record in the system

# User Story 6, Parent Index sorted by Most Recently Created
#As a visitor
#When I visit the parent index,
#I see that records are ordered by most recently created first
#And next to each of the records I see when it was created

require "rails_helper"

describe "user sees all winecellars" do
  describe "they visit /winecellars" do
    describe "winecellars are displayed more recently created first" do
      it "displays all winecellars" do

        john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
        john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

        visit '/winecellars'

        expect(page).to have_content(john_1.name)
        expect(page).to have_content(john_2.name)
      end
    end
  end
end
