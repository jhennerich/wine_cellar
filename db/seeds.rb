Wine.destroy_all
Winecellar.destroy_all

john_1 = Winecellar.create!(name: "John's Wine Cellar", full:0, location:'Basement', capacity:500)
john_2 = Winecellar.create!(name: "Deb's Wine Cellar", full:0, location:'Livingroom', capacity:36)

john_1.wines.create!(name:'Blanc Slate', varietal:'Sauvignon Blanc',
                     quantity:2, in_stock:true, year:2020, wine_score:95)

john_1.wines.create!(name:'Achille IGT Toscana', varietal:'Rosso',
                     quantity:1, in_stock:true, year:2020, wine_score:91)

john_1.wines.create!(name:'Oak Grove Reserve', varietal:'Petite Sirah',
                     quantity:1, in_stock:true, year:2010, wine_score:80)

john_2.wines.create!(name:'Elouan', varietal:'Pinot Noir',
                     quantity:1, in_stock:true, year:2018, wine_score:95)

john_2.wines.create!(name:'Sirius Bordeaux', varietal:'Merlot-Cabernet',
                     quantity:1, in_stock:true, year:2012, wine_score:95)

john_2.wines.create!(name:'The Winery: Holy Cross Abbey', varietal:'Cabernet Sauvignon',
                     quantity:1, in_stock:true, year:2013, wine_score:85)
