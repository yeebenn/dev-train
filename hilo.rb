GUESS_LIMIT = 6
MIN_RANGE = 1
MAX_RANGE = 100

guess_count = 0
random_number = rand(MIN_RANGE..MAX_RANGE)
history = []
game_won = false
valid = false

puts "----------------------------------------------------------------\n"
puts "================### LETS PLAY A LIL GAME ###====================="
puts "I have a number in mind between 1 - 100, what do you think it is?"
puts "----------------------------------------------------------------\n"

while guess_count < GUESS_LIMIT && !game_won
  user_guess = gets.chomp

   if user_guess =~ Regexp.new(/^[0-9]+$/)
    user_guess = user_guess.to_i
    valid = true
   else
    valid = false
   end

  if valid
    if history.include?(user_guess)
      puts "BRUV, are u taking the micky!? You have already guessed #{user_guess}, guess another number!!"
    elsif user_guess == random_number
      puts "Correct! U so smort"
      game_won = true 
    elsif user_guess < random_number
      puts "Not even close g, my number is higher than that, guess again."
      guess_count += 1
      history << user_guess
    else user_guess > random_number
      puts "Not even close g, my number is lower than that, guess again."
      guess_count += 1
      history << user_guess
    end
  else
    puts "U WOT M8?! Enter a value between 1-100!!"
  end

  puts "HA! You didn't guess my number within #{GUESS_LIMIT} guesses. Shmell you later." if guess_count == GUESS_LIMIT && !game_won
end