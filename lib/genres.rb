class GenreNameParser
  def self.parse(words, movie_repository)
    genre_names = movie_repository.genres.map(&:name)

    genre_selected = words & genre_names

    genre_selected[0]
  end
end

class Genre
  attr_reader :name
  attr_reader :movies

  def initialize(name:, movie_repository:)
    @name = name
    @movies = Movies.new(genre: self, movie_repository: movie_repository)
  end

  def ==(other)
    @name == other.name
  end
end
