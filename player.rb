require_relative 'message.rb'
require_relative 'game.rb'

# Handles the human player's code-making and code-breaking
class Player
  include Message
  attr_reader :code

  def initialize
    @display = Display.new
  end

  # reads code from the player, then returns it
  def code_reader
    input = gets.chomp

    if input == 'X'
      exit_message
      exit!
    end

    if input.split('').any? { |x| x < '1' || x > '6' } || input.size != 4
      invalid_message
      return code_reader
    end

    input
  end

  def make_code
    maker_message
    @code = code_reader
  end

  def make_guess(iterator)
    guess_message(iterator)
    code_reader
  end

  # calculates pins for a guess, sends them to display and returns true if the guess == answer
  def match(guess, answer)
    frGuess = [false, false, false, false]
    frAnswer = [false, false, false, false]

    red = 0
    white = 0

    (0..3).each do |i|
      next unless guess[i] == answer[i]

      red += 1
      frGuess[i] = true
      frAnswer[i] = true
    end

    guess.each_char.with_index do |i, iNr|
      answer.each_char.with_index do |j, jNr|
        next if i != j || frAnswer[jNr] || frGuess[iNr]

        white += 1
        frGuess[iNr] = true
        frAnswer[jNr] = true
      end
    end

    @display.print_pins(white, red)

    guess == answer
  end

  # handles the player's code-breaking
  def break_code(answer)
    breaker_message

    iterator = 0

    12.times do
      iterator += 1

      guess = make_guess(iterator)

      if match(guess, answer)
        victory_message
        return
      end
    end

    defeat_message(answer)
  end
end
