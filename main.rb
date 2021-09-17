# frozen_string_literal: true

require_relative './lib/board'

def ask_start
  puts 'Type a starting point [x, y]'
  puts 'Type x: '
  x = gets.chomp.to_i
  puts 'Type y: '
  y = gets.chomp.to_i
  [x, y]
end

def ask_dest
  puts 'Type a destination point [x, y]'
  puts 'Type x: '
  x = gets.chomp.to_i
  puts 'Type y: '
  y = gets.chomp.to_i
  [x, y]
end

def print_path(path)
  puts "You made it in #{path.size - 1} moves! Here's your path: "
  path.each do |cell|
    p cell
  end
end

def ask_for_another
  puts 'Do you want to calculate another path again?(Y/n)'
  input = gets.chomp.to_s
  input.upcase == 'Y'
end

loop do
  board = Board.new
  puts 'This program calculates the shortest path a knight can travel from one point to another'
  src = ask_start
  dest = ask_start
  puts "Your starting point is #{src} and destination point is #{dest}"
  unless board.board_cells.include?(src) && board.board_cells.include?(dest)
    puts 'Enter coordinates ranging from 0 to 7'
    next
  end
  path = board.knight_moves(src, dest)
  print_path(path)
  break unless ask_for_another
end
