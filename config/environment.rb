require 'pry'
require_relative '../app/models/artist.rb'
require_relative '../app/models/gallery.rb'
require_relative '../app/models/painting.rb'


#artists
al = Artist.new("Alfonso", 9)
susan = Artist.new("Susan", 2)
Jean = Artist.new("Jean", 3)

#galleries
met = Gallery.new("MET", "NYC")
hmfa = Gallery.new("HMFA", "Houston")

#create paintings
al.create_paintings("awesome painting", 90, met)
susan.create_paintings("cool painting", 100, met)
al.create_paintings("bad painting", 200, hmfa)
susan.create_paintings("blurb", 230, hmfa)


binding.pry


