class Genre
  def self.parse(words, movie_repository)
    genre_names = movie_repository.genres.map { |item| item['name'] }

    genre_selected = words & genre_names

    Genre.new(name: genre_selected[0], movie_repository: movie_repository)
  end

  attr_reader :name

  def initialize(name:, movie_repository:)
    @name = name
    @genre_selection = movie_repository.movies_by_genre(name)
  end

  def movies
    page_number = rand(1..@genre_selection.total_pages)

    movies = if page_number == 1
               @genre_selection
             else
               @genre_selection.get_page(page_number)
             end

    movies.results
  end

  def ==(other)
    @name == other.name
  end
end
