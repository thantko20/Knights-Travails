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

    prev = []
    while !q.empty?
      node = q.shift
      moves = neighbors[node]

      moves.each do |move|
        unless visited.include?(move)
          q.push(move)
          visited.push(move)
          prev.unshift([node, move])
          if move == dest
            q.clear
            break
          end
        end
      end
    end
    construct_path(prev)
  end

  def construct_path(prev)
    arr = []
    curr_child = prev.first.last
    arr.push(curr_child)

    prev.each do |relation|
      if relation.last == curr_child
        curr_child = relation.first
        arr.unshift(curr_child)
      end
    end
    arr
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

p graph.knight_moves([4,4], [1,2])

