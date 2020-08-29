Movie = Struct.new(:id, :title)

class Movies
  def initialize(genre:)
    @genre = genre
  end

  def random_page
    @genre.random_movies_page
  end

  def sample
    random_page.sample
  end
end