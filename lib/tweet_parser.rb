class TweetParser
  def self.parse_genre(tweet, movie_repository)
    words = split_tweet(tweet.text)

    genre_names = movie_repository.genres.map(&:name)

    genre_selected = words & genre_names

    genre_selected[0]
  end

  private

  def self.split_tweet(input)
    input_arr = input.gsub(/[^a-zA-Z0-9\-]/, ' ').split
    capitalize_words(input_arr)
  end

  def self.capitalize_words(array)
    word_arr_cap = []
    array.each { |word| word_arr_cap << word.downcase.capitalize }
    word_arr_cap
  end
end
