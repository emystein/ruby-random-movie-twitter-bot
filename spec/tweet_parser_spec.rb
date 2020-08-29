require_relative '../lib/tweet_parser.rb'
require 'tweet'

describe TweetParser do
  describe 'parse words with valid genre' do
    it 'returns a Genre' do
      tweet = Tweet.new('I want to watch a comedy')

      genre_name = TweetParser.parse_genre(tweet, RemoteMovieRepository.new)

      expect(genre_name).to eq 'Comedy'
    end
  end
end
