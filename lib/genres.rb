class Genre
  def self.parse(words, movie_repository)
    genre_names = movie_repository.genres.map { |item| item['name'] }

    genre_selected = words & genre_names

    Genre.new(name: genre_selected[0], movie_repository: movie_repository)
  end

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
