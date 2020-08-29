class GenreNameParser
  def self.parse(words, movie_repository)
    genre_names = movie_repository.genres.map(&:name)

    genre_selected = words & genre_names

    genre_selected[0]
  end
end

class Genre
  attr_reader :name

  def initialize(name:, movie_repository:)
    @name = name
    @movie_repository = movie_repository
  end

  def random_movies_page
    @movie_repository.random_movies_page_by_genre(@name)
  end

  def ==(other)
    @name == other.name
  end
end
