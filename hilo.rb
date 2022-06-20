RANDOM_NUMBER = 99
GUESS_LIMIT = 6

guess_count = 0
game_won = false

puts "### LETS PLAY A LIL GAME ###"
puts "I have a number in mind between 1 - 100, what do you think it is?"

while guess_count < GUESS_LIMIT && !game_won
    user_guess = gets.chomp.to_i
    if user_guess == RANDOM_NUMBER
     puts "Correct! U so smort"
     game_won = true
    elsif user_guess < RANDOM_NUMBER
     puts "My number is higher than that, guess again"
     guess_count += 1
    else
     puts "My number is lower than that, guess again"
     guess_count += 1
    end

    puts "You didn't guess my number within #{GUESS_LIMIT} guesses. Bye bye." if guess_count ==  GUESS_LIMIT && !game_won 
end

