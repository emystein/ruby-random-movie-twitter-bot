require_relative '../lib/remote_movie_repository.rb'
require_relative '../lib/genres.rb'

describe Genre do
  before(:each) do
    @comedy = Genre.new(name: 'Comedy', movie_repository: RemoteMovieRepository.new)
  end

  it 'random page of movies' do
    expect(@comedy.random_movies_page).to be
  end
end
