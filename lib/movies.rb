Movie = Struct.new(:id, :title)

class Movies
  def initialize(genre:, movie_repository:)
    @genre = genre
    @movies = movie_repository.movies_by_genre(@genre.name)
  end

  def random_page
    page_number = rand(1..@movies.total_pages)

    movies = page_number == 1 ? @movies : @movies.get_page(page_number)

    movies.results.map { |info| Movie.new(info['id'], info['title']) }
  end

  def sample
    random_page.sample
  end
end