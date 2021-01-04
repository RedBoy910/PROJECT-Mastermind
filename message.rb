module Message
  def invalid_message
    puts "Invalid input, try again!\n"
  end

  def welcome_message
    puts "Welcome to my Mastermind game. Mastermind is a code-breaking game for two players. The modern game with pegs was invented in 1970 by Mordecai Meirowitz, an Israeli postmaster and telecommunications expert. It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century.\n
      The general rules are as follows: One player becomes the codemaker, the other the codebreaker. The codemaker chooses a pattern of four digits from 1 to 6 inclusive. Duplicates and blanks are allowed, so the player could even choose four identical digits. The chosen pattern is visible to the codemaker but not to the codebreaker.\n
      The codebreaker tries to guess the pattern, in both order and color, within twelve turns. Each guess is made by entering a valid code in the console. Once placed, the codemaker provides feedback by returning from zero to four dots in the console. A red dot is returned for each code digit from the guess which is correct in both value and position. A white dot indicates the existence of a correct code digit placed in the wrong position. If there are duplicate colours in the guess, they cannot all be awarded a dot unless they correspond to the same number of duplicate colours in the hidden code. For example, if the hidden code is 1-1-2-2 and the player guesses 1-1-1-2, the codemaker will award two red dots for the two correct 1’s, nothing for the third 1 as there is not a third 1 in the secret code, and a red dot for the 2. No indication is given of the fact that the secret code also includes a second 2. Once feedback is provided, another guess is made; guesses and feedback continue to alternate until either the codebreaker guesses correctly, or the 12 turns are up.\n
      My version replaces one player with the computer. If you choose to be the codemaker, then the computer will try to guess your code and will receive feedback automatically. If you choose to play as the codebreaker, the computer will choose a random secret code and you will have to guess it, receiving feedback from the computer.\n\n
      Choose your role, or press X to exit (press 'm' for codemaker/ 'b' for codebreaker)\n"
  end

  def maker_message
    puts "You are the code-maker, make code!\n"
  end

  def breaker_message
    puts "You are the code-breaker, break code!\n"
  end

  def guess_message(iterator)
    puts "#{iterator}. Make your guess, or press X to exit!\n"
  end

  def victory_message
    puts "You won!\n\n"
  end

  def defeat_message(answer)
    puts "You lost, the code is #{answer}!\n\n"
  end

  def computer_victory_message
    puts "The computer cracked your code, you lost!\n\n"
  end

  def computer_defeat_message
    puts "The computer failed to crack your code, you won!\n\n"
  end

  def exit_message
    puts "Thanks for playing!\n\n"
  end
end
