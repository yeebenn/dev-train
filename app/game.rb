class Game
  attr_reader :word, :correct_guesses, :all_guesses

  def initialize(word)
    @word = word
    @lives = 9
    @all_guesses = []
    @correct_guesses = [nil] * word.length
  end

  def remaining_lives
    @lives - @all_guesses.length
  end

  def guess_is_valid?(letter)
    # validate length of guess
    letter =~ Regexp.new(/^[a-zA-Z]$/)
  end

  def handle_guess(letter)
    letter = letter.downcase
    return unless guess_is_valid?(letter)

    if in_word?(letter)
      update_correct_guesses(letter)
    else
      @all_guesses.append(letter) unless all_guesses.include?(letter)
    end
  end

  def in_word?(letter)
    return false unless guess_is_valid?(letter)

    @word.include?(letter)
  end

  def update_correct_guesses(letter)
    @word.chars.each_with_index do |character, index|
      @correct_guesses[index] = character if character.downcase == letter.downcase
    end
  end

  def finished?
    won? || lost?
  end

  def won?
    @correct_guesses.none?(nil)
  end

  def lost?
    remaining_lives.zero? && @correct_guesses.include?(nil)
  end
end
