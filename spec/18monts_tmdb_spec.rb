require_relative '../lib/18months_tmdb.rb'

describe TheMovieDb do
  it 'genres contains Comedy' do
    repository = TheMovieDb.new

    genres = repository.genres

    expect(genres.select { |g| g.name == 'Comedy' }).to be
  end
end
