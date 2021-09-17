require_relative './lib/board'

def ask_start
  puts 'Type a starting point [x, y]'
  puts 'Type x: '
  x = gets.chomp.to_i
  puts 'Type y: '
  y = gets.chomp.to_i
  [x, y]
end

board = Board.new
p board.knight_moves(ask_start, [3,3])