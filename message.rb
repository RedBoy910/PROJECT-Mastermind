module Message
  def invalid_message
    puts "Invalid input, try again!\n"
  end

  def welcome_message
    puts "MASTERMIND!\nPress 'm' to be the codemaker, press 'b' to be the codebreaker, or press 'X' to exit!"
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
