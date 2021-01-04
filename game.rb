require_relative 'message.rb'
require_relative 'computer.rb'
require_relative 'player.rb'

# Distributes the tasks between the player and the computer, depending on the player choice
class Game
  include Message

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def play(choice)
    if choice == 'm'
      @player.make_code
      @computer.break_code(@player.code)
    elsif choice == 'b'
      @computer.make_code
      @player.break_code(@computer.code)
    else
      exit_message
      exit!
    end
  end
end
