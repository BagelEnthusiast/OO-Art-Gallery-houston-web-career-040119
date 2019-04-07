class Gallery
  attr_reader :name, :city
  attr_accessor :painting

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city

    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    #Returns an array of all paintings in a gallery
    Painting.all.select do |painting|
      painting.gallery == self
    end
  end

  def artists
    #Returns an array of all artists that have a painting in a gallery
    self.paintings.map do |painting|
      painting.artist
    end
  end

  def artist_names
    # Returns an array of the names of all artists that have a painting in a gallery
    self.artists.map do |artist|
      artist.name
    end
  end

  def most_expensive_painting
    #  Returns an instance of the most expensive painting in a gallery
    # painting_prices = []
    paintings = self.paintings

    return nil if paintings.length == 0

    most_expensive_so_far = paintings[0]

    paintings.each do |painting|
      most_expensive_so_far = painting if painting.price > most_expensive_so_far.price
    end

    return most_expensive_so_far 

    # self.paintings.map do |paintings|
    #   painting_prices << paintings.price
    # end

    # self.paintings.each do |painting|
    #   if painting.price == painting_prices.max
    #     return painting
    #   end
    # end

  end
end
