class Artist
  attr_reader :name, :years_experience
  attr_accessor :prolific_rate

  #class variables
  @@all = []
  @@total_experience = 0
  #@@prolific_rates = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    #@prolific_rate = self.paintings.length / self.years_experience

    # @@prolific_rates << prolific_rate
    @@total_experience += years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    #Returns an array all the paintings by an artist
    Painting.all.select do |painting|
      painting.artist == self
    end
  end

  def galleries
    #Returns an array of all the galleries that an artist has paintings in
    self.paintings.map do |painting|
      painting.gallery
    end
  end

  def cities
    #Return an array of all cities that an artist has paintings in
    self.galleries.map do |gallery|
      gallery.city
    end
  end

  def self.total_experience
    #Returns an integer that is the total years of experience of all artists
    @@total_experience
  end

  def prolific_rate
    self.paintings.length.to_f / self.years_experience
  end

  def self.most_prolific
    #Returns an instance of the artist with the highest amount of paintings per year of experience.

    # max_rate = @@prolific_rates.max
    
    artists = self.all 
    
    return nil if artists.length == 0
    
    most_prolific_so_far = artists[0]
    
    artists.each do |artist|
      most_prolific_so_far = artist if artist.prolific_rate > most_prolific_so_far.prolific_rate
    end

    return most_prolific_so_far
    
    
    # prolific_ratios = []
    # self.all.map do |artist|
    #   prolific_ratios << artist.prolific_rate
    # end

    # self.all.map do |artist|
    #   if artist.prolific_rate == prolific_ratios.max
    #     return artist
    #   end
    # end
  end

  def create_paintings(title, price, gallery)

    #Given the arguments of title, price and gallery, creates a new painting belonging to that artist

    Painting.new(title, price, self, gallery)
  end
end
