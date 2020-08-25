Movie = Struct.new(:id, :title)

class Movies
  def initialize(genre:, movie_repository:)
    @genre = genre
    @movie_repository = movie_repository
  end

  def random_page
    @movie_repository.movies_by_genre_random_page(@genre.name)
  end

  def sample
    random_page.sample
  end
end