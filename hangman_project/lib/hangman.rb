class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = []
    @secret_word.size.times{@guess_word << '_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(c)
    @attempted_chars.include?(c)
  end

  def get_matching_indices(c)
    indices = []
    @secret_word.each_char.with_index{|e,i|indices<<i if e == c}
    indices
  end

  def fill_indices(c,indices)
    indices.each{|i|@guess_word[i]=c}
  end

  def try_guess(c)
    if already_attempted?(c)
      puts 'that has already been attempted'
      return false
    end
    @attempted_chars << c
    indices = get_matching_indices(c)
    indices.empty? ? @remaining_incorrect_guesses -= 1 : fill_indices(c,indices)
    true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    try_guess(gets.chomp)
  end

  def win?
    if @guess_word == @secret_word.chars
      puts 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false
  end

end
