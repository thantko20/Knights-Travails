require 'pry-byebug'

class Graph
  attr_accessor :neighbors, :board

  def initialize
    @board = (0..7).to_a.product (0..7).to_a
    @neighbors = gen_neighbors
  end

  def knight_moves(curr, dest)
    #binding.pry
    # TODO
    q = []
    q.push(curr)

    visited = []
    visited.push(curr)

    prev = {}
    while !q.empty?
      node = q.shift
      moves = neighbors[node]

      moves.each do |move|
        unless visited.include?(move)
          q.push(move)
          visited.push(move)
          prev[move] = node
        end
      end
    end
    prev
  end

  private

  # I want like this
  # hash = {[0, 0] => [[0,1], [0,2]], etc}
  def gen_neighbors
    moves = {}
    @board.each do |cell|
      gen_moves(cell, moves)
    end
    moves
  end

  def gen_moves(cell, move)
    x = cell[0]
    y = cell[1]
    move[cell] = []
    move[cell].push([x-1,y+2]) if @board.include?([x-1,y+2])
    move[cell].push([x+1,y+2]) if @board.include?([x+1,y+2])
    move[cell].push([x+2,y+1]) if @board.include?([x+2,y+1])
    move[cell].push([x+2,y-1]) if @board.include?([x+2,y-1])
    move[cell].push([x+1,y-2]) if @board.include?([x+1,y-2])
    move[cell].push([x-1,y-2]) if @board.include?([x-1,y-2])
    move[cell].push([x-2,y-1]) if @board.include?([x-2,y-1])
    move[cell].push([x-2,y+1]) if @board.include?([x-2,y+1])
  end
end

graph = Graph.new

p graph.knight_moves([0,0], [2,1]).to_a

