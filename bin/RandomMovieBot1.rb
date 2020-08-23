#!/usr/bin/env ruby
require_relative '../lib/helper_methods'
require_relative '../lib/genres'
require_relative '../lib/movies'
require 'rubygems'
require 'chatterbot/dsl'

verbose

exclude bad_words

replies do |tweet|
  include HelperMethods

  user = '#USER#'

  tweet_split = split_tweet(tweet.text)

  genre = Genre.parse(tweet_split, TheMovieDb.new)

  if !genre.nil?
    movie = Movies.new(genre.movies).sample
    reply "#{user} #{movie.title} https://www.themoviedb.org/movie/#{movie.id}", tweet
  else
    reply "#{user} Sorry, but that is not a valid genre", tweet
  end
end
