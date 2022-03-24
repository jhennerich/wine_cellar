Wine.destroy_all
Winecellar.destroy_all

john_1 = Winecellar.create!(name: 'John', full:false, location:'Basement', capacity:500)
john_2 = Winecellar.create!(name: 'John', full:false, location:'Livingroom', capacity:36)

john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                     in_stock:true, year:2.years.ago, wine_score:92)

john_2.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                     in_stock:true, year:5.years.ago, wine_score:95)
