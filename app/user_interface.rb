class UserInterface
  def initialize(input, output)
    @input_handle = input
    @output_handle = output
  end

  def intro(word_length)
    @output_handle.puts 'Welcome to Hangman'
    @output_handle.puts "I have a word in mind that has #{word_length} letters"
  end

  def get_guess(game)
    @output_handle.puts "You have #{game.remaining_lives} lives, please guess a letter"
    @output_handle.puts "The letters you have already guessed:  #{display_wrong_guesses(game)}"
    @output_handle.puts display_current_guesses(game)

    guess = @input_handle.gets.chomp

    game.handle_guess(guess)
  end

  def losing_message(word)
    @output_handle.puts "The word was #{word} , better luck next time bruv."
  end

  def winning_message(word)
    @output_handle.puts "Congrats! You guessed it, it was #{word}"
  end

  def display_current_guesses(game)
    game.correct_guesses.join(' ')
  end

  def display_wrong_guesses(game)
    game.all_guesses.empty? ? [' '] : game.all_guesses.join(', ')
  end
end
