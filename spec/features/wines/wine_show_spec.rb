require "rails_helper"
RSpec.describe 'wines show page' do

  describe "user sees a wine of a given id" do
    describe "they visit /wines/id" do
      it "displays a wine" do

        john_1 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
        john_2 = Winecellar.create!(name: 'John', full:0, location:'Basement', capacity:500)
        white = john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                           in_stock:true, year:2.years.ago, wine_score:92)
        red = john_2.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                            quantity:1, in_stock:true, year:5.years.ago, wine_score:95)

        visit ("/wines/#{white.id}")

        expect(page).to have_content(white.name)
        expect(page).to_not have_content(red.name)
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
  end
end
#
# RSpec.describe 'the songs show page' do
#   it "displays song title" do
#     artist = Artist.create(name: "Zac Brown Band")
#     song = artist.songs.create!(title: "Chicken Fried", length: 455, play_count: 12)
#     song_2 = artist.songs.create!(title: "Slow Burn", length: 437, play_count: 67)
#
#     visit "/songs/#{song.id}"
#
#     expect(page).to have_content(song.title)
#     expect(page).to_not have_content(song_2.title)
#   end
#
#   it "displays the name of the artist for the song" do
#     artist = Artist.create(name: "Zac Brown Band")
#     song = artist.songs.create!(title: "Chicken Fried", length: 455, play_count: 12)
#     song_2 = artist.songs.create!(title: "Slow Burn", length: 437, play_count: 67)
#
#     visit "/songs/#{song.id}"
#
#     expect(page).to have_content(artist.name)
#   end
# end
