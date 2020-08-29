#!/usr/bin/env ruby
require_relative '../lib/helper_methods'
require_relative '../lib/remote_movie_repository.rb'
require_relative '../lib/genres'
require 'rubygems'
require 'chatterbot/dsl'

verbose

exclude bad_words

replies do |tweet|
  include HelperMethods

  user = '#USER#'

  tweet_split = split_tweet(tweet.text)

  movie_repository = RemoteMovieRepository.new
  genre_name = GenreNameParser.parse(tweet_split, movie_repository)
  genre = Genre.new(name: genre_name, movie_repository: movie_repository)

  if !genre.nil?
    movie = genre.random_movies_page.sample
    reply "#{user} #{movie.title} https://www.themoviedb.org/movie/#{movie.id}", tweet
  else
    reply "#{user} Sorry, but that is not a valid genre", tweet
  end
end
