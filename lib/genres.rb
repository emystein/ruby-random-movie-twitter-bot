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
