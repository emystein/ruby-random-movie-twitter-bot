require 'themoviedb-api'
require 'dotenv/load'

module Tmdb
  class Struct < OpenStruct
    def initialize(data = nil)
      @table = {}

      # Patch for Ruby 2.7
      # Original: new_ostruct_member(k)
      data&.each do |k, v|
        @table[k.to_sym] = analyze_value(v)

        # Patch for Ruby 2.7
        # Original: new_ostruct_member(k)
        new_ostruct_member!(k)
      end
    end

    def analyze_value(v)
      if v.is_a?(Hash)
        self.class.new(v)
      elsif v.is_a?(Array)
        v.map do |element|
          analyze_value(element)
        end
      else
        v
      end
    end
  end
end

class TheMovieDb
  def initialize
    Tmdb::Api.key(ENV['TMBD_KEY'])
  end

  def genres
    Tmdb::Genre.movie_list
  end

  def paginated_movies_by_genre(name)
    genre = genres.detect { |g| g.name == name }
    Tmdb::Genre.movies(genre.id).results
  end

  def random_movies_page_by_genre(name)
    paginated_movies_by_genre(name).sample(20)
  end
end
