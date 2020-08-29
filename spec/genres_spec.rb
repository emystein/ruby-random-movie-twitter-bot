require_relative '../lib/remote_movie_repository.rb'
require_relative '../lib/genres.rb'

describe GenreNameParser do
  describe 'parse words with valid genre' do
    it 'returns a Genre' do
      genre_name = GenreNameParser.parse(%w[I Want To Watch A Comedy], RemoteMovieRepository.new)

      expect(genre_name).to eq 'Comedy'
    end
  end
end

describe Genre do
  before(:each) do
    @comedy = Genre.new(name: 'Comedy', movie_repository: RemoteMovieRepository.new)
  end

  it 'random page of movies' do
    expect(@comedy.random_movies_page).to be
  end
end
