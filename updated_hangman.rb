require_relative 'app/hangman'
require_relative 'app/game'
require_relative 'app/user_interface'

user_interface = UserInterface.new($stdin, $stdout)

filename = 'words.txt'
file_reader = File.open(filename)
dictionary = file_reader.readlines
index = rand(dictionary.length - 1)
word = dictionary[index].chomp

game = Game.new(word)
hangman = Hangman.new(game, user_interface)
hangman.run_game
