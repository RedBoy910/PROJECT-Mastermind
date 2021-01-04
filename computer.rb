require_relative 'message.rb'

class Computer
  include Message
  attr_reader :code

  def initialize
    @display = Display.new
  end

  # generates all of the possible codes and stores them in the @set array
  def generate_set
    @set = []

    (1..6).each do |it1|
      (1..6).each do |it2|
        (1..6).each do |it3|
          (1..6).each do |it4|
            @set.push("#{it1}#{it2}#{it3}#{it4}")
          end
        end
      end
    end
  end

  # generates a random valid code
  def make_code
    @code = ''

    4.times do
      @code += rand(1..6).to_s
    end

    puts @code
  end

  # calculates pins for a guess and returns number of red and white pins as an array
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

    [red, white]
  end

  # eliminates all of the code combinations which have no chance of being the correct answer
  def eliminate_codes(guess, white, red)
    @set.select! do |it|
      pins = match(it, guess)
      (white == pins[1] && red == pins[0])
    end
  end

  # handles the computer's code breaking
  def break_code(answer)
    generate_set
    initial_guess = '1122' # "1122" is always the computer's first guess, because Knuth said so.

    pins = match(initial_guess, answer)

    puts initial_guess
    @display.print_pins(pins[1], pins[0])

    if pins[0] == 4 && pins[1] == 0
      computer_victory_message
      return
    end

    eliminate_codes(initial_guess, pins[1], pins[0])

    11.times do
      sleep(2.5)

      guess = @set[rand(0..(@set.size - 1))]
      pins = match(guess, answer)

      puts guess
      @display.print_pins(pins[1], pins[0])

      if pins[0] == 4 && pins[1] == 0
        computer_victory_message
        return
      end

      eliminate_codes(guess, pins[1], pins[0])
    end

    computer_defeat_message
  end
end
