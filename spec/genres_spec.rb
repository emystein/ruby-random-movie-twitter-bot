require_relative '../lib/ahmetabdi_remote_movie_repository.rb'
require_relative '../lib/genres.rb'

describe Genre do
  before(:each) do
    @comedy = Genre.new(name: 'Comedy', movie_repository: TheMovieDb.new)
  end

  describe 'parse words with valid genre' do
    it 'returns a Genre' do
      genre = Genre.parse(%w[I Want To Watch A Comedy], TheMovieDb.new)

      expect(genre).to eq(@comedy)
    end
  end

  describe 'movies' do
    it 'belongs to Comedy' do
      expect(@comedy.movies.sample).to be
    end
  end
end
