class Hangman
  def initialize(game, user_interface)
    @game = game
    @user_interface = user_interface
  end

  def run_game
    @user_interface.intro(@game.word.length)
    @user_interface.get_guess(@game) until @game.finished?

    @user_interface.winning_message(@game.word) if @game.won?
    @user_interface.losing_message(@game.word) if @game.lost?
  end
end
