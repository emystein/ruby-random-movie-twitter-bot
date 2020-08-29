require 'themoviedb'
require 'dotenv/load'

class TheMovieDb
  def initialize
    Tmdb::Api.key(ENV['TMBD_KEY'])
  end

  def genres
    Tmdb::Genre.list['genres'].map { |info| Genre.new(info['name'], self) }
  end

  def paginated_movies_by_genre(name)
    Tmdb::Genre.find(name)
  end

  def random_movies_page_by_genre(name)
    movies = paginated_movies_by_genre(name)

    page_number = rand(1..movies.total_pages)

    movies = page_number == 1 ? movies : movies.get_page(page_number)

    movies.results.map { |info| Movie.new(info['id'], info['title']) }
  end
end
