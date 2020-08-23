require 'themoviedb'
require 'dotenv/load'

class TheMovieDb
  def initialize
    Tmdb::Api.key(ENV['TMBD_KEY'])
  end

  def genres
    Tmdb::Genre.list['genres']
  end

  def movies_by_genre(name)
    Tmdb::Genre.find(name)
  end
end
