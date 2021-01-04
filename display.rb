require_relative 'message.rb'
require_relative 'game.rb'

class Display
  include Message

  def initialize
    @number = {
      1 => "\e[31m 1 \e[0m",
      2 => "\e[32m 2 \e[0m",
      3 => "\e[33m 3 \e[0m",
      4 => "\e[34m 4 \e[0m",
      5 => "\e[35m 5 \e[0m",
      6 => "\e[36m 6 \e[0m",
      :red => "\e[91m\u25CF\e[0m",
      :white => "\e[37m\u25CB\e[0m"
    }
  end

  def introduction
    welcome_message

    choice = gets.chomp

    while choice != 'm' || choice != 'b' || choice != 'X'
      invalid_message
      choice = gets.chomp
    end

    @game.play(choice)
  end

  def print_pins(white, red)
    red.times do
      print @number[:red], ' '
    end

    white.times do
      print @number[:white], ' '
    end

    print "\n"
  end
end
