lives = 9
secret_word = 'jazz'
current_guesses = ['_'] * secret_word.size

puts '===== WELCOME TO HANGMAN ====='
puts current_guesses.join(' ')

while lives > 0 && current_guesses.include?('_')
  print "You have #{lives} lives left. Please guess a letter: "
  guess = gets.chomp
  puts "Your guess was: #{guess}"

  if secret_word.include?(guess)
    secret_word.chars.each_with_index do |character, index|
      current_guesses[index] = character if character.downcase == guess.downcase
    end
  else
    lives -= 1
    puts "The word did not include: #{guess}."
  end

  puts current_guesses.join(' ')
end

puts "Congrats you win!! The word was: #{secret_word}" unless current_guesses.include?('_')
puts "You lose!!!! The word was: #{secret_word}" if lives == 0 && current_guesses.include?('_')
