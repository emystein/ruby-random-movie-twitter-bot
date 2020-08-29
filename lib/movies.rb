Movie = Struct.new(:id, :title)

class Movies
  def initialize(genre:, movie_repository:)
    @genre = genre
    @movie_repository = movie_repository
  end

  def random_page
    @movie_repository.random_movies_page_by_genre(@genre.name)
  end

  def sample
    random_page.sample
  end
end