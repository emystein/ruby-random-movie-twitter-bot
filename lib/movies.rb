Movie = Struct.new(:id, :title)

class Movies
  def initialize(genre:)
    @genre = genre
    @movies = genre.movies
  end

  def sample
    info = @movies.sample

    Movie.new(info['id'], info['title'])
  end
end