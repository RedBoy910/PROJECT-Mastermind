require_relative 'computer.rb'
require_relative 'display.rb'
require_relative 'game.rb'
require_relative 'message.rb'
require_relative 'player.rb'

gameInstance = Game.new

gameInstance.welcome_message

input = gets.chomp

while input != 'X' && input != 'm' && input != 'b'
  gameInstance.invalid_message
  input = gets.chomp
end

gameInstance.play(input)
