require_relative '../lib/remote_movie_repository.rb'
require_relative '../lib/genres.rb'
require_relative '../lib/movies.rb'

describe Movies do
  describe 'sample' do
    it 'Returns a movie' do
      genre = Genre.new(name: 'Comedy', movie_repository: RemoteMovieRepository.new)

      movie = genre.movies.sample

      expect(movie.id).to be
      expect(movie.title).to be
    end
  end
end
