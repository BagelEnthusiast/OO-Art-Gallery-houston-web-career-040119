require "pry"

class Painting
  attr_reader :title, :price
  attr_accessor :gallery, :artist

  @@all = []
  @@all_prices = []

  def initialize(title, price, artist, gallery = Gallery.new("Random", "Houston"))
    @title = title
    @price = price
    @artist = artist
    @gallery = gallery

    @@all_prices << price
    @@all << self
  end

  def self.all
    @@all
  end

  def self.total_price
    @@all_prices.inject do |sum, painting_price|
      sum + painting_price
    end
  end
end

#binding.pry
puts "hi"
