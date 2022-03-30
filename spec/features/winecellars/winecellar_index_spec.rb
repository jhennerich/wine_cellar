# User Story 1, Parent Index
#For each parent table
#As a visitor
#When I visit '/parents'
#Then I see the name of each parent record in the system
### Done

# User Story 6, Parent Index sorted by Most Recently Created
#As a visitor
#When I visit the parent index,
#I see that records are ordered by most recently created first
#And next to each of the records I see when it was created
### Done
#
# User Story 17, Parent Update From Parent Index Page
#
# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parents edit page where I can update its information just like in User Story 4
#
# Search by name (exact match)
#
# As a visitor
# When I visit an index page ('/parents') or ('/child_table_name')
# Then I see a text box to filter results by keyword
# When I type in a keyword that is an exact match of one or more of my records and press the Search button
# Then I only see records that are an exact match returned on the page

require "rails_helper"

describe "user sees all winecellars" do
  describe "they visit /winecellars" do
    describe "winecellars are displayed more recently created first" do
      it "displays all winecellars" do

        john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
        john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

        visit '/winecellars'

        expect(page).to have_content(john_2.name)
        expect(page).to have_content(john_1.name)
      end
    end
  end
  it "has links to winecellar index and wine index" do
    john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

    visit ("/winecellars/#{john_1.id}")
    click_on('Wine Cellar Index')
    expect(current_path).to eq("/winecellars/")

    visit ("/winecellars/#{john_1.id}")
    click_on('Wines Index')
    expect(current_path).to eq("/wines/")
  end

  it "has a link to edit winecellar info linking to winecellars edit page" do
    john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)

    visit ("/winecellars")
#    save_and_open_page
    click_link('Edit Wine Cellar')
    expect(current_path).to eq("/winecellars/#{john_1.id}/edit")
  end
  it "has a search text box to filter winecellars by keyword" do
    john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
    john_2 = Winecellar.create!(name: 'Deb', full:0, location:'Livingroom', capacity:36)

    visit ("/winecellars")
    expect(page).to have_content(john_1.name)
    expect(page).to have_content(john_2.name)

    fill_in('Search Wine Cellars', with: "John")
    click_on('Search Wine Cellars')

    expect(current_path).to eq("/winecellars")
    expect(page).to have_content(john_1.name)
    expect(page).not_to have_content(john_2.name)

  end
end
