# require_relative '../lib/ahmetabdi_tmdb.rb'
require_relative '../lib/18months_tmdb.rb'

class RemoteMovieRepository
  def initialize
    @remote = TheMovieDb.new
  end

  def genres
    @remote.genres
  end

  def movies_by_genre(name)
    @remote.movies_by_genre(name)
  end

  def movies_by_genre_random_page(name)
    @remote.movies_by_genre_random_page(name)
  end
end
