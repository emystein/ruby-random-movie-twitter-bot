# require_relative '../lib/ahmetabdi_tmdb.rb'
require_relative '../lib/18months_tmdb.rb'

class RemoteMovieRepository
  def initialize
    @remote = TheMovieDb.new
  end

  def genres
    @remote.genres
  end

  def paginated_movies_by_genre(name)
    @remote.paginated_movies_by_genre(name)
  end

  def random_movies_page_by_genre(name)
    @remote.random_movies_page_by_genre(name)
  end
end
