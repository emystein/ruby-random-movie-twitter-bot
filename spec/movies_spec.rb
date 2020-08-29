require_relative '../lib/remote_movie_repository.rb'
require_relative '../lib/genres.rb'
require_relative '../lib/movies.rb'

describe Movies do
  before(:each) do
    @comedy = Genre.new(name: 'Comedy', movie_repository: RemoteMovieRepository.new)
    @movies = Movies.new(genre: @comedy)
  end

  describe 'sample' do
    it 'returns a movie' do
      movie = @movies.sample

      expect(movie.id).to be
      expect(movie.title).to be
    end
  end

  describe 'random_page' do
    it 'returns a page of movies' do
      page = @movies.random_page

      expect(page).to_not be_empty
      page.each { |movie| expect(movie.title).to be }
    end
  end
end
